---
filetags: ":snippets:epubnote:emacs:lisp:"
id: 00798efe-be1c-4450-8aaf-2b1d288d8422
title: Emacs Lisp Snippets
---

``` commonlisp

;;;;;;;;;;;
;; Types ;;
;;;;;;;;;;;

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

;;;;;;;;;;;;;;;;;;
;; Key bindings ;;
;;;;;;;;;;;;;;;;;;

;; Set key binding
(global-set-key (kbd "C-x w h w") 'hello world')

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

```
