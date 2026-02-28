---
filetags: ":fzf:shortcuts:epubnote:"
id: 52f3c982-73c9-432f-b697-4d96843b3397
title: fzf Shortcuts
---

| Description | Shortcut |
|----|----|
| Cursor, up and down | Arrow keys, Ctrl-k and Ctrl-j, Ctrl-p and Ctrl-n |
| Select multiple files (–multi flag) | Tab or Shift + Tab |
| Select item | Enter |
| Cursor, scroll, select | Mouse click, shift click, scroll |

## Shell Integration

Source: [GitHub - junegunn/fzf - Key bindings for
command-line](https://github.com/junegunn/fzf?tab=readme-ov-file#key-bindings-for-command-line)
showing shell integrations

| Description                  | Shortcut |
|------------------------------|----------|
| Search command history       | Ctrl + r |
| Search files/directories     | Ctrl + t |
| cd in the selected directory | Alt + c  |

- Ctrl+r: For smart searching your command history (replaces GNU
  Readline search)

## Search Filters inside fzf

Similar to [Regex Regular Expression
Snippets](/garden/notes/005-computer-snippets-regex) - [Regex Regular Expression
Snippets](id:1ff1942e-2077-44a4-9ab1-38401efb2631)

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
