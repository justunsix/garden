---
filetags: ":helix:shortcuts:epubnote:"
id: bc213b79-60c0-4e31-acf7-97ecfe5dd98b
title: Helix Shortcuts
---

## Migrating from Vim

See [Migrating from Vim -
helix-editor/helix](https://github.com/helix-editor/helix/wiki/Migrating-from-Vim)

| Description | Shortcut |
|----|----|
| Delete character at point | d |
| Delete word | wd |
| Delete line | xd |
| Go to first line (same as vim) | gg |
| Go to last line | ge |
| Go to beginning of line | gh |
| Go to end of line | gl or t + Enter |
| Go to file/URL in selection | gf |
| Copy line | xy |
| Copy to end of line | t + Enter + y |
| Select entire buffer / file | % |
| Search, buffer replace | %sword\<ret\>creplacement\<esc\> |
| Search, replace | s c , See instructions below |
| Delete entire line | xd |
| Delete to end of line | vgl d or v \<end\> d |
| Go to matching bracket | mm |
| Autocomplete | C-x |
| Comment lines | C-c |
| Search word at point | be\* n |
| Multiple cursors, add | Shift + c |
| Multiple cursors, turn off cursors | , |
| Multiple cursors, use for "block selection" | Shift + c |
| Run shell command | :sh command |
| Run shell command, insert output to buffer | :! command |
| Log, View | :log-open |
| Sort, pipe selection to sort to sort buffer | :pipe sort |

- For t + Enter, Helix has newlines like a character which is Enter

### Search and replace sequence

- % - to select whole buffer or v for visual select

- s - split the selection, and type the pattern/word you want to
  substitute, press enter

  - All the occurrences of the word are selected

- c - change the selections, and type the replacement to replace all
  occurrences

- , or Esc - Go back to selections, normal mode

To modify all lines in a certain way, you would first select the whole
file, and then split the selection at .

### Same commands

| Description               | Shortcut |
|---------------------------|----------|
| Jumplist previous, before | C-o, C-i |

## Main

| Description | Shortcut |
|----|----|
| Code, Symbol picker | SPC s |
| Code, Symbol picker workspace | SPC S |
| Code, diagnostics, errors | SPC d |
| Code, rename | SPC r |
| Code, show documentation for item at point | SPC k |
| Command palette | SPC ? |
| Command palette, search bindings | SPC ? (%bindings \<keys\>) |
| Edit, Redo | Shift + u |
| Edit, Undo | u |
| File explorer | SPC e |
| File picker, open file in vertical split | C-v |
| File picker, up, down | C-n, C-p |
| Go to menu like cursor, symbols, buffers, line | g |
| Go to menu like diagnostics, code | \[ or \] |
| Go to, next, previous buffer | gn, gp |
| Go to, version control changes | \[ or \], g or G |
| Go to, word, like Vim Flash, seek / Emacs Avy | gw, \<letter code\> |
| Jump list, open | SPC j |
| Jump list, save place (current selection for use later) | C-s |
| Match, (selection / mark) menu | m |
| Match, Tree sitter syntax tree contract | A-i |
| Match, Tree sitter syntax tree expand | A-o |
| Match, around function | maf |
| Match, replace and then selection | mr \<selection\> |
| Match, select inside of given object | mi \<object\> |
| Match, surround given object | ms \<object\> |
| Multiple cursor in next line, above line | C / Alt-C |
| Multiple cursor turn off | , |
| Paste | p |
| Paste, from system clipboard | SPC + p |
| Picker, open last picker (like file, palette) | SPC ' |
| Register, menu | " |
| Register, document path | "% |
| Register, system clipboard | "+ |
| Search, global | SPC / |
| Select, Collapse selection onto a single cursor | ; |
| Select, Keep only primary selection | , |
| Select, Remove primary selection | Alt , |
| Select, line and press again to select next line | x |
| Select, move to next selected element as primary | ) |
| Select, move to previous selected element as primary | ) |
| Select, within selection, input regex | s |
| Select, within selection, split selection up | Shift + s |
| Version control, file picker of changes | SPC g |

### Global search, restrict path of files

`[search regex] %p [path regex]`

Example of search for multiclass word in all files that fuzzy match to
AI

`multiclass &p AI`

### Selection, Multiple Cursors

- Select matches in a selection with `s`, then type selection and Enter.
  Can type c to change the selection
  - Can create multiple cursors depending on the selection regex
  - `Esc` to exit insert mode and `,` to remove extra cursors

| Description                                         | Shortcut             |
|-----------------------------------------------------|----------------------|
| Find char and select to it                          | f \<char\>           |
| Find char and select to before it                   | t \<char\>           |
| Jump mode (hinting selection), works in visual mode | gw                   |
| Select, walk up syntax tree / section of buffer     | Alt up or Alt + down |

### Commands

| Description                           | Shortcut                       |
|---------------------------------------|--------------------------------|
| Buffer, close others                  | :bco                           |
| Sort selection                        | :sort                          |
| Toggle options                        | :toggle \<option\>             |
| Hard wrap text, permanently reformat  | :reflow                        |
| Version control, change, reset a diff | :reset-diff-change             |
| Language, Set for syntax highlight    | :lang \<language\>             |
| Echo current buffer name              | :echo %{buffer<sub>name</sub>} |
| Go to, line 11 in file                | :11                            |

Toggles can be visual elements, options. Tab completion is available for
options.

## See Also

- [Vim Shortcuts](../005-computer-shortcuts-vim) - [Vim
  Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)
