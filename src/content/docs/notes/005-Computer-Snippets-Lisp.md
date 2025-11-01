---
filetags: ":snippets:elisp:lisp:emacs-lisp:epubnote:"
id: 6fb9219e-4a52-4870-94e9-8c64a997c58f
title: Lisp Snippets
---

## Emacs Lisp Snippets

``` elisp

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

```
