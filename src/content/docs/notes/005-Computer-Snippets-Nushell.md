---
filetags: ":nushell:snippets:epubnote:"
id: 8f076960-3e23-4f1c-a53e-239ec3a61cb4
title: Nushell Snippets
---

``` bash

# Get help
help
help <command, alias module>
help --find <search text>

# Read a file
open <file>

# Read a csv file and output specific columns
open data.csv | select "First Name" column2 column3 column4

# Read a csv file, find a specific row and output specific columns
open contacts.csv | where "First Name" =~ "Sonia" | select "First Name" "Last Name" "E-mail Address" "Mobile Phone"

# Transpose table display - useful for small amount of rows, but many columns
open contacts.csv | where "First Name" =~ "Sonia" | select "First Name" "Last Name" "E-mail Address" "Mobile Phone" | transpose

# Output default config.nu and save to file
config nu --default | save config.nu
# Open config.nu in editor
config nu

# Output default env.nu and save to file
config env --default | save env.nu
# Open env.nu in editor
config env

# Edit nushell env.nu
vim $nu.env-path
# Edit nushell config.nu
vim $nu.config-path

# Open File, replace string and save it again
open ~/.zoxide.nu | str replace --all 'def-env' 'def --env' | save -f ~/.zoxide-fixed.nu
# Replace strings, can take in file or text
open file.txt | str replace --all 'hello' 'hi'
'hello world' | str replace 'hello' 'hi'

# See processes with table pager explore
## Explore use Vim key bindings
ps | explore
# Find a process that contains a name "gnome" and sort by cpu
ps | where name =~ 'gnome' | sort-by cpu
# Kill a process
ps | where name =~ 'emacs' | first | kill $in.pid

# See environment
$env | table
## Environment using table pager
$env | explore

# Detect columns in output
podman top mycontainer | detech columns

# Find a program file, alias, or command
which <command>

# Sort in increasing order
sort
# Sort in decreasing order
sort -r
# -r or --reverse

## See yaml file and explore with page / table data
kubectl get deployment <deployment-name> -o yaml | from yaml | explore

# Set environment variable
## Spaces around = sign are required
$env.YAZI_FILE_ONE = '~\scoop\apps\git\current\usr\bin\file.exe'
$env.NVIM_APPNAME = 'lazyvim'
## Extend path
$env.Path = ($env.Path | prepend 'C:\path\you\want\to\add')

# Kill first process with a given name
ps | where name =~ 'emacs' | first | kill -f $in.pid

# Kill process with process ID
kill <pid>

# Filter output on string
gfold | lines | where {str contains "clean"}

# Filter output as json on a column
gfold -d json | from json | where status =~ 'Unclean'
gfold -d json | from json | where status =~ 'Unclean|Unpushed'

# Create a new column using upsert with computed values of other columns
gfold -d json | from json | where status =~ 'Unclean|Unpushed' | upsert path {|row| $row.parent + '/' + $row.name}

# Filter / find text "health" in an Excel spreadsheet / table
open --raw sheet1.xlsx | from xlsx | find health | rg health

# http command to get, fetch and other commands
http get https://google.com
# Can returned structured data for further use
# Similar to curl, jq tools combined
```
