---
filetags: ":ripgrep:rg:snippets:epubnote:"
id: 6e48cb97-82cb-40b9-ad4e-0ecc70d13b7b
title: Grep, ripgrep rg Snippets
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

# Check pattern in specific path, files
rg -i host -g '*.env'

# Search all files including hidden files in current directory and subdirectories
rg --hidden "word"
# Search hidden files also with -.
rg -. 'word'

# search for apple, banana and/or cherry in any order in
# current directory's files
rg -e --pcre2 '^(?=.*apple)(?=.*banana)(?=.*cherry).*' .

# Replace output text using character groups
rg '(\\d{3})-(\\d{3})-(\\d{4})' --replace 'xxx-xxx-$3'
## Matches a phone number pattern and replaces all
## previous digits with x and leaves last four digit in
## the 3rd group

# Output a specific capture group using $number
rg '<title>(.*)</title>' test.html -r '$1'

```

## Grep

``` shell

# Search all files in current directory
grep PATTERN *
grep -e PATTERN
## -e use pattern after -e, helps with patterns begining with -

# Search all files in current and recurive directories
grep -r PATTERN

# Case insentive search
grep -i PATTERN

```
