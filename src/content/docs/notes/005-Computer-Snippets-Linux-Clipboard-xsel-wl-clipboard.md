---
filetags: ":xsel:clipboard:linux:snippets:wl-clipboard:epubnote:"
id: c88711fb-c7c5-487d-8a51-454cac0d8eb5
title: Linux Clipboard xsel, wl-clipboard
---

## wl-clipboard on Wayland

``` shell

# Copy a simple text message:
$ wl-copy Hello world!

# Copy the list of files in ~/Downloads:
$ ls ~/Downloads | wl-copy

# Copy an image:
$ wl-copy < ~/Pictures/photo.png

# Copy the previous command:
$ wl-copy "!!"

# Paste to a file:
$ wl-paste > clipboard.txt

# Sort clipboard contents:
$ wl-paste | sort | wl-copy

# Upload clipboard contents to a pastebin on each change:
$ wl-paste --watch nc paste.example.org 5555

```

## xsel on X Windows

``` shell

# Paste output of working directory to X clipboard
pwd | xsel --clipboard
echo "hello" | xsel -b
# -b or --clipboard - operate on clipboard selection

# Copy clipboard contents to a file
xsel -ob >input.md
# -o write selection to standard output
# -b operate on clipboard selection

# Copy file contents to clipboard
xsel --clipboard <input.md

```

## References

- [bugaevc/wl-clipboard: Command-line copy/paste utilities for Wayland -
  GitHub](https://github.com/bugaevc/wl-clipboard)
