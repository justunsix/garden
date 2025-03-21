---
filetags: ":fd:find:snippets:epubnote:"
id: 2a52ab2a-7857-4b15-8f5a-dbeffc23f6eb
title: fd find Snippets
---

``` shell

# Find a pattern
find -iname '*pattern*'

# Find a pattern with fd
fd pattern
fd 'put_regex_here'

# Find pattern from fd output with rg for better highlighting
fd | rg -i pattern

# List files recursively in current and sub directories
fd

# Find with fd files with these 3 words in any order
fd | rg -e --pcre2 '^(?=.*apple)(?=.*banana)(?=.*cherry).*'

```
