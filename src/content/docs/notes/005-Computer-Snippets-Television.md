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

# Open file
vim (tv)

# Channel specific search
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
## Shell aliases
tv alias
## Dotfiles - select user's dotfiles, cross platform for Unix, Windows
tv dotfiles
## Environment variables
tv env
## Text like grep
tv text

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
