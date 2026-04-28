---
filetags: ":snippets:television:fuzzy:find:epubnote:"
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

```

## Channel specific search

``` shell

tv alias # Shell aliases
tv apt-package # Search apt packages
tv channels # search tv list-channels
tv dirs # Search Directories
tv dotfiles # Dotfiles - select user's dotfiles, cross platform for Unix, Windows
tv downloads # Open download
tv env # Environment variables
tv flatpak # List flatpaks by full name
tv git-branch
tv git-diff # Git diff on changed files
tv git-log
tv git-repos # Git repositories
tv make-targets # List and run Makefile target
tv man-manages
tv nu-history # PowerShell history
tv opencode-sessions # List and open opencode sessions
tv path # Check path environment variable paths (directories)
tv pwsh-history # PowerShell history
tv text # Text like grep
tv tldr # Teeldeer TLDR brief man pages
tv tmux-sessions
tv zoxide # Change directory

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
  platform fuzzy finder*</span>
