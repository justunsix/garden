---
date: 2026-01-07
filetags: ":snippets:epubnote:gnu:coreutils:"
id: 60d1c07a-22b6-40bb-99ee-274feab9cd20
title: GNU Coreutils Snippets
---

## cat - concatenate

``` shell

# Send multiline text to a file
cat <<EOF > test.md
The quick brown fox jumped over the lazy dog
EOF

# Show multiple files
cat file1 file2 file3

# Show Linux distribution and release information
cat /etc/*release

```

## chown, chmod - Change file permission

``` bash

# Give current user read write execute on all files in currect directory and files and folder below it
chmod -R u=rwx ./

# Change ownership to user tom, group admin of text.txt file
sudo chown tom:admin test.txt

# Chage just owner
sudo chown admin test.txt

# Change just group
sudo chgrp devops test.txt

```

See also DevOps Bootcamp [Modifying
Permissions](id:ec2b10e8-9f38-4b44-85be-842d5e02994d) file permissions
section of - [DevOps Bootcamp with
Nana](/garden/notes/005-computer-tech-devops-bootcamp-twn) - [DevOps Bootcamp
Series with Nana Janashia](id:47b64b3b-67a0-4cc5-9e96-2369c5877b08)

## cut - remove selections from each line of files

``` shell

# Print the fifth character on each line:
command | cut [-c|--characters] 5

# Print the fifth to tenth character of each line of the specified file:
cut [-c|--characters] 5-10 path/to/file

# Split each line in a file by a delimiter into fields and print fields two and six (default delimiter is `TAB`):
cut [-f|--fields] 2,6 path/to/file

# Use space as a delimiter and print only the first 3 fields:
command | cut [-d|--delimiter] " " [-f|--fields] -3

# Use : as delimiter and print first part before delimiter
command | cut -d ":" -f 1

# Only print lines that contain the delimiter:
command | cut [-d|--delimiter] ":" [-f|--fields] 1 [-s|--only-delimited]

# Print specific fields of lines that use `NUL` to terminate lines instead of newlines:
find . -print0 | cut [-z|--zero-terminated] [-d|--delimiter] "/" [-f|--fields] 2

```

## df - display free disk space

Reports on disk space on mounted and mounted file systems

``` shell

# display in human readable format
df -h
df -ahk
# -a all mount points
# -h human readable
# -k Use 1024 byte (1-Kbyte) blocks

```

## du - disk usage

``` shell

# Check disk usage of current directory up to 1 directory level
du -h --max-depth=1

```

## ln - link files

``` shell

# Create a symbolic link to a file
ln -s /path/to/file /path/to/symlink

# Create a symbolic link to a directory
ln -s /path/to/directory /path/to/symlink

# Remove a symbolic link
rm /path/to/symlink
rm -r /path/to/symlink-directory

```

## locate - find files from index

See [Locate Snippets](/garden/notes/005-computer-snippets-locate) - [Locate
Snippets](id:4bb55697-f217-4460-b29b-57d021a951a6)

## od (Octal Dump)

Displays a file in octal (base 8) format by default. Used for seeing
data that isn't in a human readable format that control characters in
files.

``` shell

# Display file in character format and show control characters
od -c input.txt

```

## sort

``` shell

# Sort output of a command or text files, output to standard out
sort file.txt

# Sort file and save back to new file or can be same file
sort file.txt -o new_file.txt

# Call sort from uutil
coreutils sort [OPTION] [FILE]

```

## tee - Update a file's contents and append items

``` shell

# Update a file's contents and append items
# Update /etc/environment for all users
echo "http_proxy=http://2.3.4.5:3128" | sudo tee -a /etc/environment
echo "https_proxy=http://2.3.4.5:3128" | sudo tee -a /etc/environment
echo "export no_proxy=localhost, 127.0.0.1" | sudo tee -a /etc/environment

```

## tr - translate/delete

Use also `sed` command if use of `tr` becomes complex

``` shell

# Replace Characters J for Z
echo 'Call me Justin' | tr 'J' 'Z'

# Replace delimiters
echo 'FirstName LastName Comment Age' | tr ' ' ','

# Replace character with newlines
# Easier way to see a path
echo $PATH | tr ":" "\n"

# Combine techniques below to clean up text
echo "Mangled FiLE-nAMe.txt" | tr -d '-' | tr -s ' ' | tr ' ' '_' | tr '[:upper:]' '[:lower:]'
# and pipe output to tr repeatedly like a bad filename

# Replace lower case with upper case
echo 'Call me Justin' | tr '[:lower:]' '[:upper:]'
# or
echo 'Call me Justin' | tr 'a-z' 'A-Z'
# Other tokens that can be used for matching and replacing
# [:alnum:]: Letters and digits.
# [:alpha:]: Letters only.
# [:digit:]: Digits only.


# [:blank:]: Tabs and spaces.
# [:space:]: All whitespace, including newline characters.
# [:graph:]: All characters including symbols, but not spaces.
# [:print:]: All characters including symbols, including spaces.
# [:punct:]: All punctuation characters.
# [:lower:]: Lowercase letters.
# [:upper:]: Uppercase letters.

# Invert matches with -c (complement)
# Convert all spaces to dashes '-'
echo 'A long file name nice to have as dashed name' | tr ' ' '-'

# Delete characters -d
# Delete all spaces and letter i
echo 'Characters and 12354 numbers' | tr -d ' i'

# Reduce repeated characters -s (squeeze repeats)
# Reduce repeated spaces to a single space
echo 'A  spaced  out  sentence' | tr -s ' '

# Delete all blank characters
echo 'Call  me  Just  in' | tr -d '[:blank:]'

# Delete all whitespace (tabs, newlines, spaces)
echo 'bunch of words to merge' | tr -d '[:space:]'

# Delete everything except digits from a string
# Deletion will include space, whitespace, newlines
# -c and -d to complete (reverse match) and delete others
echo 'Call me 123 Justin 552' | tr -cd '[:digit:]'

```

## uniq - choose unique items

``` bash

# Show only uniq lines in a file
cat file.txt | uniq

```

## yes - repeat string or y

Useful for scripts requiring prompts

``` shell

# Output Hello world repeatedly
yes "Hello World"

# Automatically confirm a prompt, for example in apt, alternative to apt -y
yes | sudo apt install vim-nox

# Automatically decline a prompt by outputting n repeatedly
yes n | sudo apt install vim-nox
# Note yes piping will only work when there is a prompt
# In this example, if all vim-nox dependencies are installed, there won't be a prompt
# and the package will be installed anyways

# Limit output of string output to first 5 lines using head limit of 5
yes | head -n 5

```

## See Also

- [GNU Findutils Snippets](/garden/notes/005-computer-snippets-gnu-findutils)
- [Linux Snippets](/garden/notes/005-computer-snippets-linux) - [Linux
  Snippets](id:3aca5424-540c-4f65-a7ca-079fd5e94a99)

### Resources

- [List of GNU Core Utilities commands -
  Wikipedia](https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands)
