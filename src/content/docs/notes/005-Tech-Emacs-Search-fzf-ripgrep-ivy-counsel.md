---
filetags: ":emacs:fzf:ripgrep:epubnote:"
id: 026ff642-5c97-4465-a4c2-e71fa8e2b63a
title: Emacs Search with fzf, ripgrep, ivy, counsel, consult, vertico
---

## Emacs: Search and Replace Basics

### isearch - basic search for text or regex in buffer

- Basic search in buffer using `isearch-forward` default `C-s` or
  `isearch-forward` default `C-r`
  - Search forward to next match: `C-s` and previous match backward:
    `C-r`
  - Cancel search: `C-g`
- Only matches characters, not regex
- To use regex, use `isearch-forward-regexp` default `C-M-s` or
  `isearch-backward-regexp` default `C-M-r`

Suggested configurations

``` elisp

;; isearch: Display a counter showing the number of the current and other matches
;; Place it before the prompt
;; from https://protesilaos.com/codelog/2023-06-10-emacs-search-replace-basics/
(setq isearch-lazy-count t)
(setq lazy-count-prefix-format "%s/%s ")
(setq lazy-count-suffix-format nil)

;; Make regular Isearch interpret the empty space as a regular
;; expression that matches any character between the words you give
;; it.
(setq search-whitespace-regexp ".*?")

```

### occur - search results buffer

- Search with list using `occur`
  - Opens new buffer with search results, going on each result will move
    to match in original buffer
  - Usually activated with `C-c` while in minibuffer search results
- Can combine isearch with occur to feed search results to occur
  - Search in isearch regularly, then call `occur` with `M-s o` inside
    isearch to get search results in new buffer
- Combine occur with `query-replace` in occur search results
  - Use `M-s o` to get search results in new buffer, then activate
    editing in occur buffer use `M-%` to replace in search results
    buffer and make changes in occur using `C-c C-c`
  - Can be combined with keyboard macros to make changes to search
    results in the file
- Similar flow works with tools with ripgrep results and ivy-occur and
  embark (embark-export) and occur-edit-mode

### query-replace - search and replace text in buffer

- Using `query-replace` or `M-%`
  - Asks for search text and replacement text
  - Use `y` to replace, `n` to skip, `!` to replace all
- Can combine isearch with query-replace
  - isearch (regular or regex version) then activate query-replace in
    isearch minibuffer
  - Can be combined to use regex search and regex replacements, for
    example using match groups

### dired - search and replace in file explorer

- Can use `grep` in a dired buffer
  - For example, such for text "volunteer" in all org files in
    directory: `grep --color=auto -nH --null -e "volunteer" *.org`
  - Will open buffer with search results
  - Change grep results using wgrep to editable mode `C-c C-p` or
    `wgrep-change-to-wgrep-mode`
  - Grep in directory, change search results: grep and search, `C-c C-p`
    or `wgrep-change-to-wgrep-mode`
    - Change search results save or abort: C-x C-s (save) or C-c C-k
      (abort)

### consult - command wrappers with minibuffer enhancements

- Go to line with search result: `consult-line`
- Go to heading in buffer based on major mode: `consult-outline`
- Grep files in directory: `consult-grep`, `consult-rg` (using ripgrep)

### embark - allows context sensitive actions

- Call embark in `consult-grep` to get grep buffer

## About fzf fuzzy search

- fuzzy match inserts wildcard between each letter, in sequence, not
  specific pattern

## Using fzf with ivy

Using `counsel-fzf`

- Use fzf to find files, fzf uses current working directory, then use
  ivy actions `M-o` to execute actions on the results such as:
  - copy
  - dired
  - xdg-open
  - change root directory
  - use ripgrep on directory
- In search results use ivy-occur to get buffer of results `C-c C-o`

## Using ripgrep with ivy

Using `counsel-rg` or `rg` or `projectile-ripgrep`

- Ripgrep searches root of current git repository, then use ivy actions
  `M-o` to execute actions on the results such as:
  - copy
  - find files with fzf in root directory

## Ivy-posframe

``` elisp

;; This one draws the line for the current match. The`:inherit' part gives it a background and a foreground value.
`(ivy-current-match ((,class (:inherit modus-theme-special-mild :weight bold :underline t))))
;; And here are all the face for `ivy-posframe'
   `(ivy-posframe ((,class (:background ,bg-dim :foreground ,fg-main))))
   `(ivy-posframe-border ((,class (:background ,bg-active))))
   `(ivy-posframe-cursor ((,class (:inherit cursor))))

```

## See Also

- [fzf fuzzy finder Snippets](../005-computer-snippets-fzf) - [fzf Fuzzy
  Finder Snippets](id:1aa7c311-74a6-4304-86f1-4c3676ad2498)

### Resources

- [Emacs: fuzzy find files (fzf, ripgrep,
  Ivy+Counsel)](https://www.youtube.com/watch?v=IDkx48JwDco)
- [prot-ivy-deprecated-conf.el](https://gitlab.com/protesilaos/dotfiles/-/blob/v3.0.0/emacs/.emacs.d/prot-lisp/prot-ivy-deprecated-conf.el)
- [Emacs: search and replace basics - Prot on
  YouTube](https://www.youtube.com/watch?v=f2mQXNnChwc)
