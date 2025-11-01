---
filetags: ":emacs:eshell:snippets:epubnote:"
id: b9c15120-7b17-427c-9f08-e12e2678e0b7
title: Emacs eshell Snippets
---

``` elisp

;; Check command being used with which
which ls

;; Open dired to current directory or specific path
dired ..
dired PATH

;; See file
view-file filename

;; Edit file
find-file filename

;; Output of command to kill-ring (clipboard history)
rg ID >/dev/kill

;; Output of command to a separate named buffer
rg -i string > #<buffername>

;; Output of last command to clipboard, run multiple commands with ;
echo $$ >/dev/clip; echo hello
;; Run 2 commands only if first command successful
echo hello && echo world

;; Grep all files in directory, open in Emacs grep mode
grep PATTERN *

;; Evalute subshell
echo $(+ 1 2 3)

;; Parse agrument string into elisp notation
listify 1 2 3

;; Add path to $PATH environment variable or print existing paths if no argumment
addpath PATH

;; magit status of directory
magit

;; Status of version controlled directory
vc-dir

;; Diff two files
ediff-files FILE1 FILE2

;; Alias
alias ff 'find-file $1'

;; Run command in background if external to Emacs
external-command &

;; Search for file name with emacs in current directory using * glob
find-name-dired ./ *emacs*

;; Start command in background asynchronously
curl hello.org &

;; Run eshell commands in a batch file with eshell-batch-file
#!/usr/bin/env -S emacs --batch -f eshell-batch-file

```
