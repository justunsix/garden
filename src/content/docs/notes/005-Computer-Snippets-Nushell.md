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
help operators
help escapes

# Change directory
cd mydirectory
# Go back one directory
cd -
# Change to parent
cd .. # or ..
# Go up two levels
cd ... # or ...

# Move file
mv

# Remove file
rm

# Copy file
cp

# List files
ls

# List files and find files with a name or pattern with Nushell's find
ls | find .jpg

# Run a pipeline of commands
nu -c <commands>
# Run script
nu <script>

# List all markdown files with asterisk (*) glob, also called wildcard
ls *.md
# List non-hidden files under current directory
ls **/*
# Other glob syntax is supported
# List all files including hidden files (-al) and show sizes of files/folders (-d)
ls -ald

# List files, sort, filter, query first item
ls
| where size > 10kb
| sort-by size
| first

# Disk usage of files in current directory, 1 folder depth
du
# Runs similar to GNU coreutils' du -h --max-depth=1

# Print output
print "Hello World"
# Print is not the same as echo "Hello World" as
# echo just returns the value

# Read a file as structured data and output
open <file>

# Display contents of file
open --raw <file>

# Read a csv file and output specific columns
open data.csv | select "First Name" column2 column3 column4

# Read a csv file, find a specific row and output specific columns
open contacts.csv | where "First Name" =~ "John" | select "First Name" "Last Name" "E-mail Address" "Mobile Phone"

# Transpose table display - useful for small amount of rows, but many columns
let name = 'John'; open contacts.csv | where "First Name" =~ $name | select "First Name" "Last Name" "E-mail Address" "Mobile Phone" "Birthday" | transpose

# Read csv data, filter and only return non-empty items in Phone field
open contacts.csv | where "First Name" =~ "John" | compact Phone

# Output default config.nu and save to file
config nu --default | save config.nu
# Open config.nu in editor
config nu

# Output default env.nu and save to file
config env --default | save env.nu
# Open env.nu in editor
config env

# Save output to file
ls -al | save lsoutput.txt

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

# Describe output of a command or expression
ps | describe

## Explore use Vim key bindings
ps | explore
# See first 10 processes
ps | first 10
# Find a process that contains a name "gnome" and sort by cpu
ps | where name =~ 'gnome' | sort-by cpu
# Kill a process
ps | where name =~ 'emacs' | first | kill $in.pid

# See environment
$env | table
## Environment using table pager
$env | explore
# Display current directory
pwd
$env.PWD

# Detect columns in output and output in table
podman top mycontainer | detect columns

# Convert to other format like csv, md, json, yaml, html, text
cat mytable.md | detect columns | to csv

# Find a program file, alias, or command
which <command>
# Check if command is installed
if (which fzf | is-empty) {
    print "fzf is not installed. Please install it to use this script."
    exit 1
}

# Set alias
alias s = git status -sb

# View aliases
scope alias

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
## Clear HTTP PROXY variables
$env.http_proxy = ''; $env.https_proxy
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

# Open specific Excel spreadsheet
open --raw sheet1.xlsx | from xlsx --sheets [Sheet1]
# Open sheet "Sheet1" in binary xlsx file
open sheet1.xlsx | get "Sheet1"
# Open sheet "Sheet1" in binary xlsx file and search first column
open sheet1.xlsx | get "Sheet1" | where column0 =~ "myfilter"

# Open a file, folder or website in the default application or viewer for the operating system
start file.txt
start https://www.nushell.sh
start obsidian://open?vault=Test

# Run system (external) command instead of nushell command
^ls
^find

# http command to get, fetch and other commands, similar to curl --get
http get https://jsonplaceholder.typicode.com/todos/1
http get https://google.com
# Can returned structured data for further use
# Similar to curl --get, jq tools combined
# Post with http post
http post https://httpbun.com/post 'name=myname'
http post https://httpbun.com/post 'name=myname' | get data

# Use output of command fzf with another command
vim (fzf)

# Redirect both stdout and stderr to the same file with out+err>
cat unknown.txt out+err> log.log

# Redirect command's output to other command
^$env.EDITOR (fd --hidden | fzf)
# Get Editor environment variable and call it with finding files

# Complete: Gather stdout, stderr, and exit code together in one record
cat unknown.txt | complete

# View system information
sys host
# Other possible values are:
# cpu - View information about the system CPUs.
# disks - View information about the system disks.
# host - View information about the system host, operating system
# mem - View information about the system memory.
# net - View information about the system network interfaces.
# temp - View the temperatures of system components.
# users - View information about the users on the system.

# Get user input
let var = input
# Get secret input
let secret = input -s

# Background jobs, commands
# In Nushell they are background threads, not processes and will stop with the shell exit

# Run background job
job spawn { nautilus }
# List jobs
job list
# Stop job
job kill id_of_job

# Job, Suspend, freeze foreground application
job unfreeze
job unfreeze id_of_specific_job
## Press Ctrl + z on Unix targets like Linux and macOS
## Bring most recent background job back up, like fg in bash, Use Ctrl + Z to freeze (suspend) job

# Send data to an existing job
job send id_of_job
# Receive data
job recv

# If statement
if 5 < 3 { 'yes!' } else { 'no!' }
no!

# Booleans
## Check empty
value | is-empty
value | is-not-empty

```

## Data

``` shell

# String to Integer conversion
"12" | into int

# Date to a Time Zone
date now | date to-timezone "America/Toronto"

# Convert data, strings to yaml, other ouputs supported, see help for to
[one two three] | to yaml

```

## Variables

``` shell

# Set immutable variable
let name = 'John'

# Get variable
$msg
$"greeting, ($name)"

# Previous command's output, can be used similar to xargs in bash
$in

# Copy largest file to user's home directory using $in
ls | sort-by size | first | get name | cp $in ~

```

## Operators

``` shell

# Help on operators
help operators

# Greater than operator
4 > 10
# => false

```

## Scoping

Nushell blocks control their own environment. Changes to environment
like working directories or environment variables will not persist
outside a block.

``` shell

# For each statement from a table
ls | each { |row|
  # Change to PWD will not persist outside this block
  # ending in the bracket
  cd $row.name
  make
}
# For each: Loop on process table
let processes = ps | select pid name | each {|it| $'($it.pid) ($in.name)'}


```

## Development

``` shell

# Python - activate virtual environment with overlay use
overlay use .venv/bin/activate.nu

```
