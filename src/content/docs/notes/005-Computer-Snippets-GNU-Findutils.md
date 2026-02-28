---
date: 2026-01-07
filetags: ":snippets:epubnote:gnu findutilsfind:findutils:gnu:"
id: 86eb6f90-622f-4d0d-b37d-eb55d6b6cf45
title: GNU Findutils Snippets
---

## find

``` bash

# Find files in current directory and subdirectories with .html extension
find . -name "*.html" -type f

# files with foo in the title
find . -name "*foo*" -type f

# Like above, except find all .html files and delete them
find . -name "*.html" -type f -delete

# Find files given filename and other parameters.
# Some usage patterns are below.
# -exec is powerful since it defines what to do with the file(s) found by the find command. For example, you can use grep to look for information inside those files (see below)
find (./ -name or expression 'in quotes') -print

# Find files containing a string called "string_here"
find / -type f -exec grep -l "string_here" {} ;

# Find files containing a string called "string_here" and output the lines from those files that contain that string. -print will show which files were found
find / -type f -print -exec grep -l "string_here" {} ;

# To see which files within the current directory and its subdirectories that end in s
find . -name '*s' -print

# Find files with dolphin in the file name, case insensitive and is a pdf
find . -iname '*dolphin*' -iname '*.pdf' -print

# Find largest files in current directory, sort
find ./ -type f -size +2G -exec du -h {} + | sort -rh | head -30
# -type f - is a file
# -size +2G - is 2 gigabytes or larger
# du -h - print out file information
# head -30 - first 30 files

```

## xargs

``` bash

# xargs is a command that takes the output of a command and uses it as arguments to another command. It is useful for passing the output of one command to another command. For example, you can use it to pass the output of find to rm to delete files.
# xargs can also read from file instead of standart input using -a file

# Common examples of xargs usage:
# - delete files found by find where files end in 's'
find . -name '*s' -print | xargs rm

# Find files named core in or below the directory /tmp and delete them, processing  filenames  in
# such a way that file or directory names containing spaces or newlines are correctly handled.
find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f

# Generates a compact listing of all the users on the system
cut -d: -f1 < /etc/passwd | sort | xargs echo

# Find a specific file and open its directory in Dolphin
find . -name 'file_name' -exec dirname {} \; | xargs dolphin
find . -iname 'filename' -printf %h\0 | xargs -0t dolphin

```

This post lists common commands used in Windows and Linux/Unix system
administration, server support, and troubleshooting.

## See Also

- [GNU Coreutils Snippets](/garden/notes/005-computer-snippets-gnu-coreutils) -
  [GNU Coreutils Snippets](id:60d1c07a-22b6-40bb-99ee-274feab9cd20)
- [Linux Snippets](/garden/notes/005-computer-snippets-linux) - [Linux
  Snippets](id:3aca5424-540c-4f65-a7ca-079fd5e94a99)
