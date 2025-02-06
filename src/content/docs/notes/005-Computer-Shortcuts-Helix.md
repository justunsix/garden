---
filetags: ":helix:shortcuts:epubnote:"
id: bc213b79-60c0-4e31-acf7-97ecfe5dd98b
title: Helix Shortcuts
---

## Migrating from Vim

See [Migrating from Vim -
helix-editor/helix](https://github.com/helix-editor/helix/wiki/Migrating-from-Vim)

| Description                                 | Shortcut                         |
|---------------------------------------------|----------------------------------|
| Delete character at point                   | d                                |
| Delete word                                 | wd                               |
| Delete line                                 | xd                               |
| Go to first line (same as vim)              | gg                               |
| Go to last line                             | ge                               |
| Go to beginning of line                     | gh                               |
| Go to end of line                           | gl                               |
| Copy line                                   | xy                               |
| Select entire buffer / file                 | %                                |
| Global replace                              | %sword\<ret\>creplacement\<esc\> |
| Delete entire line                          | xd                               |
| Delete to end of line                       | vgl d or v \<end\> d             |
| Go to matching brackey                      | mm                               |
| Autocomplete                                | C-x                              |
| Comment lines                               | C-c                              |
| Search word at point                        | be\* n                           |
| Multiple cursors, add                       | Shift + c                        |
| Multiple cursors, turn off cursors          | ,                                |
| Multiple cursors, use for "block selection" | Shift + c                        |
| Run shell command                           | :sh command                      |
| Run shell command, insert output to buffer  | :! command                       |
| Log, View                                   | :log-open                        |
| Sort, pipe selection to sort to sort buffer | :pipe sort                       |

### Same commands

| Description               | Shortcut |
|---------------------------|----------|
| Jumplist previous, before | C-o, C-i |

## Main

| Description                                   | Shortcut                   |
|-----------------------------------------------|----------------------------|
| Command palette                               | SPC ?                      |
| Command palette, search bindings              | SPC ? (%bindings \<keys\>) |
| Multiple cursor in next line, above line      | C / Alt-C                  |
| Multiple cursor turn off                      | ,                          |
| Code, show documentation for item at point    | SPC k                      |
| Code, diagnostics, errors                     | SPC d                      |
| Code, Symbol picker                           | SPC s                      |
| Code, Symbol picker workspace                 | SPC S                      |
| Code, rename                                  | SPC r                      |
| Jump list, open                               | SPC j                      |
| Match, (selection) menu                       | m                          |
| Match, select inside of given object          | mi \<object\>              |
| Match, surround given object                  | ms \<object\>              |
| Go to, next, previous buffer                  | gn, gp                     |
| Go to menu like cursor, symbols, buffers      | g                          |
| Go to menu like diagnostics, code             | \[ or \]                   |
| Go to, version control changes                | \[ or \], g or G           |
| Go to, word, like Vim Flash, seek / Emacs Avy | gw, \<letter code\>        |
| File picker, up, down                         | C-n, C-p                   |
| File picker, open file in vertical split      | C-v                        |
| Version control, file picker of changes       | SPC g                      |
| Register, menu                                | "                          |
| Register, system clipboard                    | "+                         |
| Register, document path                       | "%                         |

### Commands

| Description                           | Shortcut           |
|---------------------------------------|--------------------|
| Buffer, close others                  | :bco               |
| Version control, change, reset a diff | :reset-diff-change |

### Selection

- Select matches in a selection with `s`, then type selection and Enter.
  Can type c to change the selection
  - `Esc` to exit insert mode and `,` to remove extra cursors

| Description                                         | Shortcut             |
|-----------------------------------------------------|----------------------|
| Find char and select to it                          | f \<char\>           |
| Find char and select to before it                   | t \<char\>           |
| Jump mode (hinting selection), works in visual mode | gw                   |
| Select, walk up syntax tree / section of buffer     | Alt up or Alt + down |

## See Also

- [Vim Shortcuts](005-Computer-Shortcuts-Vim.md) - [Vim
  Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)
