---
filetags: ":yazi:shortcuts:epubnote:"
id: 6e5e2e7a-210e-4f99-82a3-743109eaf120
title: Yazi Shortcuts
---

Generally, vim shortcuts are used

| Description | Shortcut |
|----|----|
| Copy paths, directory path | c d |
| Copy paths, file name | c f |
| Copy paths, file name, no extension | c n |
| Copy paths, file path | c c |
| Directory, jump | g SPC |
| Directory, jump, ~ | g h |
| Directory, jump, ~/.config | g c |
| Directory, jump, ~/Downloads | g d |
| Directory, previous, next | Shift + h, Shift + l |
| File operations, create file (end with / for dir) | a |
| File operations, open | o or Enter |
| File operations, open with | Shift + o |
| File operations, open with, OS manager | Shift + o, choose reveal |
| File operations, paste | p |
| File operations, paste and overwrite | P |
| File operations, rename | r |
| File operations, trash, permanent delete | d, D |
| File operations, yank (copy) | y |
| File operations, yank (cut) | x |
| File Preview, Seek 5 units up or down | Shift + j or Shift + k |
| Help | F1 or ~ |
| Help, exit | Esc |
| Hidden files, show/hide toggle | . |
| Input mode, exit to normal mode, example rename | Esc |
| Navigation | j k h l or arrow keys |
| Navigation, cursor to top, bottom | gg, G |
| Quit | q |
| Search files, cancel search | Ctrl + s |
| Search files, search files by content using ripgrep | S |
| Search files, search files by name using fd | s |
| Search, change directory or reveal file with fzf | z |
| Search, change directory with zoxide | Shift + z |
| Search, filter file | f |
| Search, find file, next/previous | /, n/N |
| Selection, Select file | Space |
| Shell, run command | ; |
| Sort alphabetically | , a |
| Sort by file extension | , e |
| Sort by modified time or reverse | , m or , M |
| Sort by size | , s |
| Tabs, close current tab | Ctrl + c |
| Tabs, new tab | t |
| Tabs, switch to previous, next tab | \[, \] |
| Tabs, switch to tab \# | 1, 2, 3, … 9 |

File operations like rename, trash, yank work on bulk selections with
Space.

## Troubleshooting yazi

Check if yazi sees relevant variables and progams with `yazi -debug`

## See Also

### Resources

- [Yazi Quick Start,
  Keybindings](https://yazi-rs.github.io/docs/quick-start/)
