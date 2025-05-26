---
filetags: ":readline:epubnote:"
id: bf3b61d8-23cc-4959-a5c7-17041d7e43f4
title: Linux Terminal Shortcuts - GNU Readline
---

| Description | Shortcut |
|----|----|
| Autocomplete | TAB |
| CUA: Cut word backward (behind cursor) | C-w |
| CUA: Cut word forward | M-d |
| CUA: Paste, yank from kill ring | C-y |
| CUA: Kill (to clipboard) to end of line/beginning of line | C-k, C-u |
| CUA: Cycle undo list | C-\_ , C-x, C-u, C-/ |
| Clear terminal screen | C-l |
| Cursor: delete everything to beginning of line | C-u |
| Cursor: delete everything to end of line | C-k |
| Cursor: line - move to beginning | C-a, Home |
| Cursor: line - move to end | C-e, End |
| Cursor: move to beginning of word | M-b / C-left arrow |
| Cursor: move to end of word | M-f / C-right arrow |
| Search history reverse isearch | C-r |
| Transpose character / word | C-t / M-t |

## Macros

| Description              | Shortcut                                     |
|--------------------------|----------------------------------------------|
| Start/stop macro records | C-x (, C-x )                                 |
| Play last macro          | C-x e                                        |
| Print out macro          | C-x p (bound in .inputrc, default is unbound |

## Completion

| Description            | Shortcut |
|------------------------|----------|
| Complete at point      | TAB      |
| List completions       | M-?      |
| Insert all completions | M-\*     |
| Complete tilde         | M-~      |

## Other uses

- Use numeric arguments like Emacs
  - `M-2 M-d` to kill two words forward

## Less useful shortcuts

| Description    | Shortcut |
|----------------|----------|
| Insert comment | M-#      |
| Clear screen   | C-c C-l  |

## Commands

| Description | Command |
|----|----|
| Empty file without deleting it | cat /dev/null \> file<sub>name</sub> |
| Go to home directory | cd or cd ~ |
| List files in current directory | ll (ls -l |
| Open Ubuntu files in folder (e.g. nautilus ~/) | nautilus |
| Reuse entire last command (e.g. useful for sudo !!) | !! |
| Reuse the last argument from the previous command (bash) | !\$ |
| Reuse the last argument… example: | ls tool && cd !\$ |
| Run multiple commands if previous command was successful | command<sub>1</sub> && command<sub>2</sub> |
| Run multiple commands in one line | command<sub>1</sub>; command<sub>2</sub>; command<sub>3</sub> |
| Stop a running command | C-c |
| Switch back to last working directory | cd - |
| View a file in a paged fashion | less file<sub>name</sub> |
| Watch log file for change | tail -f log<sub>file</sub> |

## About

GNU Readline and Emacs share many shortcuts

GNU Readline is reused by: bash, python, GDB, psql, sqlite, and more,
allowing shortcuts to be used in those CLIs.

### Features

- Keyboard macros
- History search and navigation
- Faster editing

### Keyboard Macros

You can record, play back, and print out keyboard macros. Can be
written, no recording needed. Can be written on the fly.

Example use cases

- `apt-cache search emacs` with keyboard macro transformed into
  `$(apt-cache search emacs | ezf -f 1)`
- Wrap prompt to simple python commands like dir(…), help(…)

### Limitations

- Readline's kill ring (clipboard) is not shared with the system
  clipboard
- It is not universally used, like Zsh and fish use their own line
  editing
  - Many commands are shared with fish; however macros may not function
    the same
- Prompt undo history is reset on each new prompt

## Configuration

- Global settings in `/etc/inputrc`
- User settings in `~/.inputrc`
- Uses Emacs notation like `C-x` for `ctrl + x` and `M-x` for `alt + x`
  and chords like `C-x p`
  - Except in `.inputrc` , use `\e` for alt (meta) and `\C` for control.
- Examples:

``` bash

# Correct - binds to C-x q
"\C-xq": "Hello, World"
# Correct - binds to C-M-p
"\e\C-p": "Good Bye!"

# Set variables with set keyword
set expand-tilde on

# Limit settings to certain programs
$if Bash
   # ...
$else
   # ...
$endif

# By default the keyseq-timeout value is a rather ambitious 500 ms. I find that far too quick, so I change it 1200 ms:
set keyseq-timeout 1200

# Colored completion of partial matches in bash
# by default color highlighting for completition is disabled
set colored-stats on
set colored-completion-prefix on

```

## See also

### Resources

- [Keyboard Shortcuts every Command Line Hacker should know about GNU
  Readline](https://www.masteringemacs.md/article/keyboard-shortcuts-every-command-line-hacker-should-know-about-gnu-readline)
