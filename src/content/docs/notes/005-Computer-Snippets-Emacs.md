---
filetags: ":emacs:snippets:epubnote:"
id: f1e69dcf-1ee5-48c5-9efe-a05affb4236c
title: Emacs Snippets
---

``` shell

# Start GUI
emacs &

# Start and stay in Terminal
emacs -nw

# Start with defaults
emacs -Q

# Use defaults and terminal only
emacs -Q -nw

# Start Emacs Web Wowser (EWW) from CLI to a URL
emacs -f eww-browse https://lite.duckduckgo.com/lite

# Start with a specified init file
emacs -q -l ~/.emacs.d/init.el

# Minimal Start
## On Windows
emacs -q -l C:\Users\user1\.config\emacs\init.el
## On Linux
emacs -q -l ~/emacs/.config\minimal.el

# Start Emacs with debugging enabled
emacs --debug-init

# Start Emacs with specific configuration directory
emacs --init-directory ~/.config/emacs-old

```
