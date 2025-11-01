---
filetags: ":fzf:shortcuts:epubnote:"
id: 52f3c982-73c9-432f-b697-4d96843b3397
title: fzf Shortcuts
---

From:
<https://github.com/junegunn/fzf?tab=readme-ov-file#key-bindings-for-command-line>

| Description                         | Shortcut           |
|-------------------------------------|--------------------|
| Search command history              | Ctrl + r           |
| Search files/directories            | Ctrl + t           |
| cd in the selected directory        | Alt + c            |
| Select multiple files (–multi flag) | Tab or Shift + Tab |

## Shell Shortcuts

- Ctrl+t: To select files, similar to autocompletion but with fewer
  keystrokes
- Alt+c: To quickly switch into a selected subdirectory like when using
  cd
- Ctrl+r: For smart searching your command history (replace GNU Readline
  search)

## Search Filters inside fzf

- End of line `$`, find files matching ending for example: .yaml\$
- Beginning of line `^`, find files starting with for example:
  <sup>Dockerfile</sup>
- OR operator `|`, find files matching either of the patterns for
  example: .yaml$`|.yml`$
- AND operator `/.../`, find files matching both patterns for example:
  .yml\$ *docker*
- NOT operator `!`, find files not matching the pattern for example:
  !.yaml\$
- Exact match: `'`, find files matching the exact pattern for example:
  'Dockerfile'
