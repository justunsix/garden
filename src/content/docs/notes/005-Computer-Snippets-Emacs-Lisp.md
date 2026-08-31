---
filetags: ":snippets:epubnote:emacs:lisp:emacs-lisp:"
id: 00798efe-be1c-4450-8aaf-2b1d288d8422
title: Emacs Lisp Snippets
---

Lisp stands for LISt Processing and Lisp handles lists by putting them
between parentheses \[fn:1\].

``` commonlisp

;;;;;;;;;;;;;;;
;; Variables ;;
;;;;;;;;;;;;;;;

;; Global variable
(setq x '(a b))

;; Local variables scoped
(let ((y 1)
      (z y))
  (list y z))
     ⇒ (1 2)

;;;;;;;;;;;;;;;
;; Functions ;;
;;;;;;;;;;;;;;;

;; Create function
(defun capitalize-backwards ()
  "Upcase the last letter of the word at point."
  (interactive)
  (backward-word 1)
  (forward-word 1)
  (backward-char 1)
  (capitalize-word 1))

;; Call function
(defun foo () 5)
(foo)
     ⇒ 5

;; Function with arguments
(defun bar (a &optional b &rest c)
    (list a b c))
(bar 1 2 3 4 5)
     ⇒ (1 2 (3 4 5))

;;;;;;;;;;;;
;; Output ;;
;;;;;;;;;;;;

;; Ouput variable or value
(print "Hello")
(print (x))

;;;;;;;;;;;
;; Types ;;
;;;;;;;;;;;

;; List preceded by single quote
'(rose violet daisy buttercup)
;; Set a varaible to a list
;; Single quote means do not interpret, stuff after it is not a variable, function
;; instead use the actual value
;; Sets completion-styles to a list of orderless and basic
(setq completion-styles '(orderless basic))

;; Concatenate (combine) two or more items into strings
(concat "string1" string2var)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Buffer Navigation, Editing ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Go to specific position in buffer
;; Beginning of buffer is position (point-min), end is (point-max).
(goto-char (point-min))

;; Move forward a line or N lins
(forward-line N)

;; Insert text
(insert "Hello world")

;; Beginning of buffer position
(point-min)
;; End of buffer position
(point-max)

;;;;;;;;;;;;;;;
;; Functions ;;
;;;;;;;;;;;;;;;

;; Create an interactive (person calls it) function
(defun jt/bongo-open-my-playlist()
  ;; "Open my playlist in bongo stored in playlist environment variable
  (interactive)
  (bongo)
  (bongo-insert-playlist-contents jt/bongo-playlist-location)
  (bongo-playlist-mode))

(defun replace-foo-with-bar ()
  "Replace every occurrence of \"foo\" with \"bar\" in the current buffer."
  (interactive)
  ;; save-excursion restores cursor position after function call
  (save-excursion
    (replace-string "foo" "bar" nil (point-min) (point-max))))

```

### Emacs Configuration Snippets

``` commonlisp

;;;;;;;;;;;;;;;;;;
;; Key bindings ;;
;;;;;;;;;;;;;;;;;;

;; Set key binding
(global-set-key (kbd "C-x w h w") 'hello world')

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Global keybinding overrides ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; https://archive.org/details/prot-codelog-2026-07-08-emacs-global-keybinding-overrides/
;; Safe keys set here, eval-region to jump to info section:
;; (info "(elisp) Key Binding Conventions")
(define-key global-map (kbd "M-o") 'other-window)

;; There is also `defvar-keymap'...
(defvar prot-overrides-mode-map (make-sparse-keymap)
  "Keymap for the `prot-overrides-mode'.")

(define-minor-mode prot-overrides-mode
  "Activate the `prot-overrides-mode-map'."
  :global t
  :init-value nil
  :keymap prot-overrides-mode-map)

(define-key prot-overrides-mode-map (kbd "M-o") 'other-window)
(define-key prot-overrides-mode-map (kbd "C-<return>") 'find-file)

(prot-overrides-mode 1)

```

## References

- \[fn:1\] [An Introduction to Programming in Emacs Lisp -
  GNU](https://www.gnu.org/software/emacs/manual/eintr.html)
- \[fn:2\] [Emacs: global keybinding overrides : Protesilaos Stavrou -
  Archive.org](https://archive.org/details/prot-codelog-2026-07-08-emacs-global-keybinding-overrides/)
