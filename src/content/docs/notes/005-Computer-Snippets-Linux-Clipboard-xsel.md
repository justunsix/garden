---
filetags: ":xsel:clipboard:linux:snippets:epubnote:"
id: c3c2298e-3279-4514-a111-ec2bd3373193
title: Linux Clipboard Xsel
---

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
