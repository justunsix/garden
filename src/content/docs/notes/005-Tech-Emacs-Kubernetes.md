---
filetags: ":emacs:kubernetes:k8s:epubnote:"
id: a76dbe77-9cda-474a-b8e9-34b9f4de6b93
title: Kubernetes and Emacs Package
---

## Kubernetes and Emacs

Source: [Conquering Kubernetes with
Emacs](https://www.youtube.com/watch?v=w3krYEeqnyk),
<https://github.com/abrochard/kubel>

## Kubernetes Logs in Emacs

A tutorial on building a major mode and user experience to interacting
with Kubernetes using command in the background with a UI in Emacs.

Adrien Brochard talks about how to integrate the Kubernetes client into
an Emacs workflow. The key takeaways have little to do about Kubernetes
itself, but rather focus on the design and implementation of an
integration between two complex systems: from how to deal with async
sub-processes, defining an appropriate major mode, to proposing a modern
and intelligent user experience.

### Get Pods

1.  Basic

    ``` shell

    kubectl get pods

    ```

    ``` example
    NAME                          READY     STATUS    RESTARTS   AGE
    frontend-6f567b7966-6pgzs     1/1       Running   0          3d
    hello-node-7f5b6bd6b8-48kk4   1/1       Running   0          3d
    redis-64896b74dc-zrw7w        1/1       Running   0          3d
    ```

2.  Get Pod Names

    ``` shell

    # Results will only be list of pod names
    kubectl get pods --no-headers=true | awk '{print $1}'

    ```

3.  Turn command output to string using Emacs Lisp
    `shell-command-to-string`

    ``` elisp

    (shell-command-to-string "kubectl get pods --no-headers=true | awk '{print $1}'")

    ```

4.  Turn that into a lisp list

    Just split at every new line (`\n`) with `split-string` function

    ``` elisp
    (split-string (shell-command-to-string "kubectl get pods --no-headers=true | awk '{print $1}'") "\n")
    ```

    ``` elisp
    ("frontend-6f567b7966-6pgzs" "hello-node-7f5b6bd6b8-48kk4" "redis-64896b74dc-zrw7w" "")
    ```

### Using Tabulated List Mode

Good for working with columns of data. Documentation is low.

The column format as a vector of `(name width)` elements where:

- `name` is the column name
- `width` is the column width

The row entries as a list of `'(id [values....])` where each element is
a row where:

- `id` can be left nil or be a unique id for the row
- `[values...]` is a vector of row values

``` elisp

;; Begin with column definition - width of 50, then 3 rows
(let ((columns [("Col1" 50) ("Col2" 50)])
           (rows (list '(nil ["row1" "value1"])
                       '(nil ["row2" "value2"])
                       '(nil ["row3" "value3"]))))
       (switch-to-buffer "*temp*")
       (setq tabulated-list-format columns)
       (setq tabulated-list-entries rows)
       (tabulated-list-init-header)
       ;; Print list out
       (tabulated-list-print))
```

1.  Dump our pod lists into tabulated-list-mode

    Set up only one column for pod name. Print list to temp buffer.

    ``` elisp
              (let ((columns [("Pod" 100)])
                    (rows (mapcar (lambda (x) `(nil [,x]))
                                  (split-string (shell-command-to-string "kubectl get pods --no-headers=true | awk '{print $1}'") "\n"))))
                (switch-to-buffer "*temp*")
                (setq tabulated-list-format columns)
                (setq tabulated-list-entries rows)
                (tabulated-list-init-header)
                (tabulated-list-print))
            #+end_src

    **** Putting it All Together: Make a Major Mode for List

         - Define a new major mode based on =tabulated-list-mode=, called Kubernetes
         - When mode is triggered, do tabulated list from above
         - Add function to call it

          #+begin_src elisp :results output silent
              (define-derived-mode kubernetes-mode tabulated-list-mode "Kubernetes"
                "Kubernetes mode"
                (let ((columns [("Pod" 100)])
                      (rows (mapcar (lambda (x) `(nil [,x]))
                                    (split-string (shell-command-to-string
                                                   "kubectl get pods --no-headers=true | awk '{print $1}'") "\n"))))
                  (setq tabulated-list-format columns)
                  (setq tabulated-list-entries rows)
                  (tabulated-list-init-header)
                  (tabulated-list-print)))

              (defun kubernetes ()
                (interactive)
                (switch-to-buffer "*kubernetes*")
                (kubernetes-mode))
    ```

    Run with `M-x kubernetes` or

    ``` elisp
    (kubernetes)
    ```

### Get Kubernetes Logs

- async process creation to prevent blocking Emacs
- Output goes to a buffer

1.  Basic Call a process with blocking

    - Use the `call-process` function and direct it to a buffer. Use
      kubectl logs and pod name.

    - Problem is synchronous blocking and large logs will hang Emacs

      ``` elisp
      (let ((buffer "*kubectl-logs*"))
        (call-process "kubectl" nil buffer nil "logs" "redis-64896b74dc-zrw7w")
        (switch-to-buffer buffer))
      ```

2.  Async Process

    - Use the `start-process` function instead which will create a
      process for you

    - Process is continuing to running logs and has not stopped until
      you stop it

      ``` elisp
      (let ((process "*kubectl*")
            (buffer "*kubectl-logs*"))
        (start-process process buffer "kubectl" "logs" "-f""redis-64896b74dc-zrw7w")
        (switch-to-buffer buffer))
      ```

3.  Async get process logs

    - Combine above to use the optional arg

    - Issue is hardcoded pod name

      ``` elisp
      (defun kubernetes-get-logs (&optional arg)
        (interactive "P")
        (let ((process "*kubectl*")
              (buffer "*kubectl-logs*"))
          (if arg
              (start-process process buffer "kubectl" "logs" "-f" "redis-64896b74dc-zrw7w")
            (call-process "kubectl" nil buffer nil "logs" "redis-64896b74dc-zrw7w"))
          (switch-to-buffer buffer)))
      ```

      Try it with `M-x kubernetes-get-logs` or
      `C-u M-x kubernetes-get-logs`

### How to connect that function to our major mode

- Our major mode is derived from `tabulated-list-mode` so we can use the
  function `tabulated-list-get-entry` which will give us the entry under
  the cursor as a vector:

  ``` elisp
  (aref (tabulated-list-get-entry) 0)
  ```

1.  Putting it All Together: Get logs for a specific pod where argument
    is pod name under the cursor

    ``` elisp
    (defun kubernetes-get-logs (&optional arg)
      (interactive "P")
      (let ((process "*kubectl*")
            (buffer "*kubectl-logs*")
            (pod (aref (tabulated-list-get-entry) 0)))
        (if arg
            (start-process process buffer "kubectl" "logs" "-f" pod)
          (call-process "kubectl" nil buffer nil "logs" pod))
        (switch-to-buffer buffer)))
    ```

2.  Testing it out

    Call kubernetes mode with `M-x kubernetes` and then look at the logs
    of pod under cursor with `M-x kubernetes-get-logs`

### Making a Modern User Experience

- UI for users to interact with major modes
- Transient from magit project - can wrap CLI tools. Need to import it
  into Emacs for use.

1.  A simple transient

    ``` elisp

    (require 'transient)

    (defun test-function ()
      (interactive)
      (message "Test function"))

    (define-transient-command test-transient ()
      "Test Transient Title"
      ["Actions"
       ("a" "Action a" test-function)
       ("s" "Action s" test-function)
       ("d" "Action d" test-function)])

    (test-transient)
    ```

2.  Transient with switches

    Define command line switches in our transient interface.

    ``` elisp
    (defun test-function (&optional args)
      (interactive
       (list (transient-args 'test-transient)))
      (message "args: %s" args))

    (define-transient-command test-transient ()
      "Test Transient Title"
      ["Arguments"
       ("-s" "Switch" "--switch")
       ("-a" "Another switch" "--another")]
      ["Actions"
       ("d" "Action d" test-function)])

    (test-transient)
    ```

3.  Transient with params

    - More complex than simple switches, params let users enter a value.

    - Params remember what you inputted as their value

      ``` elisp
      (defun test-function (&optional args)
        (interactive
         (list (transient-args 'test-transient)))
        (message "args %s" args))

      (define-infix-argument test-transient:--message ()
        :description "Message"
        :class 'transient-option
        :shortarg "-m"
        :argument "--message=")

      (define-transient-command test-transient ()
        "Test Transient Title"
        ["Arguments"
         ("-s" "Switch" "--switch")
         ("-a" "Another switch" "--another")
         (test-transient:--message)]
        ["Actions"
         ("d" "Action d" test-function)])

      (test-transient)
      ```

4.  Kubernetes-transient

    - can just get logs

    - can follow logs with `-f`

    - can specify tail length `--tail=100`

    - can combine these options

      ``` elisp
      (define-infix-argument kubernetes-transient:--tail ()
        :description "Tail"
        :class 'transient-option
        :shortarg "-t"
        :argument "--tail=")

      (define-transient-command kubernetes-transient ()
        "Test Transient Title"
        ["Arguments"
         ("-f" "Follow" "-f")
         (kubernetes-transient:--tail)]
        ["Actions"
         ("l" "Log" kubernetes-get-logs)])

      (kubernetes-transient)
      ```

5.  Updating our `kubernetes-get-logs`

    - read args from transient
    - check if `-f` is in args to do async or not
    - pass the args into the process functions

    ``` elisp
    (defun kubernetes-get-logs (&optional args)
      (interactive
       (list (transient-args 'kubernetes-transient)))
      (let ((process "*kubectl*")
            (buffer "*kubectl-logs*")
            (pod (aref (tabulated-list-get-entry) 0)))
        (if (member "-f" args)
            (apply #'start-process process buffer "kubectl" "logs" pod args)
          (apply #'call-process "kubectl" nil buffer nil "logs" pod args))
        (switch-to-buffer buffer)))
    ```

6.  Connecting the transient to our kubernetes major mode

    Define a mode map for `kubernetes-mode`

    ``` elisp
    (defvar kubernetes-mode-map
      (let ((map (make-sparse-keymap)))
        (define-key map (kbd "l") 'kubernetes-transient)
       map))
    ```

7.  Trying it out

    ``` elisp
    (kubernetes)
    ```

## Conclusion

### What could be improved

- Get pods and other columns like status
- Error handling
- No hard coded values
- Allow customization
- Implement other kubernetes functions, not just logs

## See Also

### Resources

- [Gist of these
  notes](https://gist.github.com/abrochard/dd610fc4673593b7cbce7a0176d897de)
- [Full extension for kubernetes](https://github.com/abrochard/kubel)
- `C-h f start-process` for doc on processes
- [Transient Manual](https://magit.vc/manual/transient.html)
- [Kubernetes
  cheatsheet](https://kubernetes.io/docs/reference/kubectl/cheatsheet/)
