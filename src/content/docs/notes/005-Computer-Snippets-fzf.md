---
filetags: ":fzf:snippets:epubnote:"
id: 1aa7c311-74a6-4304-86f1-4c3676ad2498
title: fzf Fuzzy Finder Snippets
---

Some snippets are bash shell specific

``` bash

# Search all files in current directory (default)
fzf

# Search and only multiple select
fzf --multi
fzf -m

# Search files using find and selections to file
find * -type f | fzf > selected

# Search only directories, change directory into them
cd (fd --type directory | fzf)
cd (find -type d | fzf)

# Search all files including hidden files
fzf -a
## Search all files including hidden and ignored files from fd -HI
fd -HI | fzf

# Preview files with bat
fzf --preview 'bat --color=always {}'
## Restrict lines
fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'

# Open searched file with vim
# Can be used with any other command
vim $(fzf)
vim $(find . -type f | fzf)

# Change to directory
cd $(find . -type d | fzf)

# Copy searched file to a specific location
cp $(fzf) /path/to/destination

# Use fzf auto-completion with other commands like vim, ssh, variables, kill
## Requires shell integration
vim ** <TAB>
ssh ** <TAB>
unset ** <TAB>
kill -9 ** <TAB>
# Command will give a pop up for search on:
# - files
# - known hosts
# - environment variables, aliases
# - processes
# For more, see https://github.com/junegunn/fzf#fuzzy-completion-for-bash-and-zsh

# fzf key bindings, source appropriate file for your shell
# Fedora - see DNF package information, example:
source /usr/share/fzf/shell/key-bindings.bash
# See Ubuntu Debian per /usr/share/doc/fzf/README.Debian
# For more, see https://github.com/junegunn/fzf/tree/master/shell

# Nushell: Open fzf selected file with a helix
hx (fzf)

```

## Search and Filters

``` bash

# fzf extended search - default setting
# https://github.com/junegunn/fzf#search-syntax

# fuzzy-match   Items that match sbtrkt
fzf sbtrkt

# exact-match   Items that match wild (uses ')
fzf \'wild
fzf -e

# Limit scope to nth field of the entry, accepts ranges
fzf --nth
## Example
## Display a number before each entry using CLI command nl, for number of lines
# But we don’t want our queries to match these numbers
vim $(find . -type f | nl | fzf --nth=2)

# Regex to change field delimiter which is space by default
fzf  --delimiter
## Example
vim $(find . -type f | nl -s ',' | fzf --nth=2 --delimiter=',')

# Case insensitive
fzf -i
# Case sensitive
fzf +i

# items matching wild and wold exact patterns
fzf \'wild \'world
# prefix-exact-match - items that start with music
fzf ^music
# suffix-exact-match    Items that end with .mp3
fzf .mp3$
# inverse-exact-match   Items that do not include fire
fzf !fire
# inverse-prefix-exact-match    Items that do not start with music
fzf !^music
# inverse-suffix-exact-match    Items that do not end with .mp3
!.mp3$

```

## fzf Useful Aliases

Sources:

- [GitHub - kelleyma49/PSFzf: A PowerShell wrapper around the fuzzy
  finder
  fzf](https://github.com/kelleyma49/PSFzf?tab=readme-ov-file#helper-functions)
- [fzf/ADVANCED.md at master · junegunn/fzf ·
  GitHub](https://github.com/junegunn/fzf/blob/master/ADVANCED.md)

``` shell

# fe - Starts an editor for the selected files in the fuzzy finder
fzf | xargs $EDITOR
fzf | xargs nvim

# fkill - Stops process selected by the user in fzf.
ps -ef | fzf | awk '{print $2}' | xargs kill -9

```

## fzf on PowerShell

``` powershell

# Edit a file
# Replace notepad with another program to open a file with that program
Get-ChildItem . -Recurse -Attributes !Directory | Invoke-Fzf | % { notepad $_ }

```

## See Also

### Resources

- [Linux Fuzzy
  Finder](https://www.redhat.com/sysadmin/fzf-linux-fuzzy-finder)
- [Practical Guide to fzf
  Examples](https://thevaluable.dev/practical-guide-fzf-example/)
