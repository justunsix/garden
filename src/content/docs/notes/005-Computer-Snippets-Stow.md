---
filetags: ":stow:snippets:epubnote:"
id: b70edd4e-9022-467b-ba9a-600b39b72853
title: Stow GNU Snippets
---

Source: TLDR pages for stow

``` shell

# Symlink all files recursively to a given directory
stow [-t|--target] path/to/target_directory file1 directory1 file2 directory2
# Make sure target path exists
mkdir -p ~/.config/nvimexample
# Symlink ~/.config/nvimexample directory to current working directory's nvimexample directory (package)
stow -t ~/.config/nvimexample nvimexample

# Delete symlinks recursively from a given directory
stow [-D|--delete] [-t|--target] path/to/target_directory file1 directory1 file2 directory2

# Simulate to see what the result would be like
stow [-n|--simulate] [-t|--target] path/to/target_directory file1 directory1 file2 directory2

```
