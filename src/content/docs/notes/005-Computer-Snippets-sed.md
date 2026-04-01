---
filetags: ":snippets:epubnote:sed:stream-editor:"
id: dfacdd4d-a4e5-4f51-b672-0b7a8a873468
title: sed (Stream Editor) Snippets
---

``` shell

# [s]ubstitute all occurrences of "apple" with "mango" on all lines, print to stdout, use basic regex
command | sed 's/apple/mango/g'

# Use extended regular expressions with -E
sed -E 's/pattern/replacement/flags'
## Replace dog and cat with pet
"dog cat moose" | sed -E 's/(cat|dog)/(pet)/g'

# Replace "apple" with "mango" in-place in a file (overwriting original file), use basic regex
sed [-i|--in-place] 's/apple/mango/g' path/to/file
sed -i 's/apple/mange/g' fruits.txt

# Run multiple substitutions in one command
command | sed -e 's/apple/mango/g' -e 's/orange/lime/g'

# Use a custom delimiter (useful when the pattern contains slashes)
command | sed 's#////#____#g'

# [d]elete lines 1 to 5 of a file and back up the original file with a .orig extension
sed [-i|--in-place=].orig '1,5d' path/to/file

# [p]rint only the first line to stdout
command | sed [-n|--quiet] '1p'

# [i]nsert a new line at the beginning of a file, overwriting the original file
sed [-i|--in-place] '1i\your new line text\' path/to/file

# Delete blank lines (with or without spaces/tabs) from a file, overwriting the original file:
sed [-i|--in-place] '/^[[:space:]]*$/d' path/to/file

# Delete lines containing a string
sed -i '/lang.sql/d' lazyvim.json

# Get only lines starting with start string, those in between and ending with end string
# from an input_file
sed -n "/$start_string/,/$end_string/p" "$input_file"

# Append a string (\a) after a known string in place (-i) in file
sed -i "/Known-string/a Inserted-String" myfile.txt

```
