---
filetags: ":snippets:television:epubnote:"
id: 464e217b-0754-456e-9b6b-d3d954917af5
title: Television Snippets
---

``` shell

# Search for files which is the default channel
tv files

# Update channel list
tv update-channels

# List chanels
tv list-channels

# Channel specific search
## Switch to channel
tv channels
## Directories
tv dirs
## Nushell history
tv nu-history
## PowerShell history
tv-pwsh-history
## Git branch
tv git-branch
## Git log
tv git-log
## Git repositories
tv git-repos
## Git diff on changed files
tv git-diff
## Shell aliases
tv alias
## Dotfiles - select user's dotfiles, cross platform for Unix, Windows
tv dotfiles
## Environment variables
tv env
## Text like grep
tv text

# Change Directory
tv zoxide

# Open downloads directory items
tv downloads

```

## Applying with other commands

``` shell

# Open a file with editor
vim (tv files)

# Change directory
cd (tv dirs)

# Flatpak run program
flatpak run (tv flatpak)

# Nu history run
nu -c (tv nu-history)

tmux attach -t (tv tmux-sessions)

```

## Television search patterns

| Matcher   | Pattern                                        |
|-----------|------------------------------------------------|
| Fuzzy     | foo                                            |
| Substring | 'foo / !foo to negate                          |
| Prefix    | <sup>foo</sup> / !<sup>foo</sup> to negate     |
| Suffix    | foo\$ / !foo\$ to negate                       |
| Exact     | <sup>foo</sup>\$ / !<sup>foo</sup>\$ to negate |

Use spaces to combine patterns like `car 'bike !^car` which will fuzzy
match car with exact substring bike, but not starting with car.

## See Also

- <span class="spurious-link"
  target="alexpasmantier.github.io/television/">*Television - cross
  platform fast and extensible fuzzy finder*</span>
