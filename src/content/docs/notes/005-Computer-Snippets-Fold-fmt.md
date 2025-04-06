---
descriptions: Snippets for GNU Coreutils fold and fmt commands
filetags: ":fold:fmt:snippets:epubnote:"
id: 2e37e08e-4764-4714-8dc9-0b557f3c7a0a
title: Fold and fmt snippets
---

## Fold

``` shell

# View file and fold lines are 60 characters and on spaces
cat file.txt | fold -s -w 60
# -s - fold on spaces

# Fold file and output to file
fold -s -w 60 < file.txt > foldedfile.txt

```

## Fmt

``` shell

# Reformat file
fmt file.txt

# Reformat output
cat file.txt | fmf

# Reformat file with uniform spaces (1 space between words, 2 between paragraphs)
fmt -u file.txt

```
