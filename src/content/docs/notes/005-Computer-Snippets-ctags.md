---
date: 2026-06-16
filetags: ":snippets:epubnote:ctags:coding:development:"
id: 833c12af-a703-4f60-b92c-41ab7705b79f
title: ctags Snippets
---

Commands are for [University Ctags](https://docs.ctags.io/en/latest/)

``` shell

# generate tags file for Vim
ctags -R --languages=Rust --exclude=target --exclude=.git --verbose .
# -R - recursively
# --languages - specify languages
# --exclude - do not include certain directories
# --verbose - detailed log output
# . - start with current directory of command
#     make sure this source dir/file is listed last in the command line
#     otherwise, options after it are ignored

# generate tags file for Emacs (-e)
ctags -e -R --languages=Rust --exclude=target --exclude .git .

# tags for NodeJS project
ctags -R --exclude=node_modules .

# Tags for all supported languages in project
ctags -R .

# Restrict tagging to specific languages.
ctags --languages=Python,JavaScript -R .

# Store relative to tag file location (--tag-relative=yes) and sort alphabetically (--sort)
ctags --sort --tag-relative=yes

# Include additional fields like language and kind and extras like doc comments, see help for details
ctags --fields=<list> --extras=<flags>

```
