---
filetags: ":ripgrep:rg:snippets:epubnote:"
id: 6e48cb97-82cb-40b9-ad4e-0ecc70d13b7b
title: ripgrep rg Snippets
---

``` shell

# Search for a regexp pattern, literal '-foo'
rg -e -foo

# Search case sensitive (default search)
rg -s John

# Search case insensitive, ignore case
rg -i

# Search for files in the current directory and all subdirectories
rg -lU --multiline-dotall 'foo.*bar|bar.*foo'
# for files containing the string "foo" and "bar"
# -l : List files that contain a match (don't print the matching lines)
# -U : multiline
# regex : when foo is before bar or reverse

# List files with case insensitive search
rg -li 'string_to_search_for'

# For word in specified files
rg -w word file1 file2 file3
#or
rg "word" *volunteer*.org

# Search all files including hidden files in current directory and subdirectories
rg --hidden "word"

```
