---
filetags: ":bat:snippets:epubnote:"
id: c112c6bb-197d-40c0-8f8a-1facb0092a38
title: bat Snippets
---

``` shell

# View file
bat main.rs

# See supported languages
bat -L

# View characters not usually printed like control characters, line feeds
bat -A Makefile

# View todo file in todo.txt format
bat Todo-for-me.txt -l todo.txt

# Highlight specific links
bat -H 10:20 my_log_file.log

# Diff - Check for differences in file with respect to git index
bat --diff file_that_changed.md

```
