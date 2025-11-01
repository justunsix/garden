---
filetags: ":fd:find:snippets:epubnote:"
id: 2a52ab2a-7857-4b15-8f5a-dbeffc23f6eb
title: fd find Snippets
---

``` shell

# Find a pattern
find -name '*my*pattern*'

# Find a pattern, case insensitive using -iname
find -iname '*pattern*'

# Find a pattern with fd followed by a pattern to search
fd pattern
fd 'put_regex_here'

# Find pattern from fd output with rg for better highlighting
fd | rg -i pattern

# List files recursively in current and sub directories
fd
# List files including hidden (-H, --hidden) and ignored files (-I, --no-ignore)
fd -HI

# Exclude files / directories matching (-E, --exclude)
fd --exclude .git

# Find with fd files with these 3 words in any order
fd | rg -e --pcre2 '^(?=.*apple)(?=.*banana)(?=.*cherry).*'

# List only directories
fd -t d
# -t or --type - d for directory, f for file, see help for others
## At depth 1
fd --type d --max-depth 1

```
