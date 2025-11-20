---
filetags: ":tmux:shortcuts:linux:terminal:epubnote:"
id: 7f641c76-24e6-4027-b7b7-364b0f503926
title: Tmux Shortcuts
---

## Windows

| Description                         | Shortcut                     |
|-------------------------------------|------------------------------|
| Default prefix key                  | Ctrl + b                     |
| Switch to window (number in footer) | prefix + number              |
| New session                         | prefix + c                   |
| Cycle windows next/previous         | prefix + n/p                 |
| Close windows                       | kill all panes or prefix + & |
| Rename window                       | prefix + ,                   |
| Command mode                        | prefix + :                   |
| Command mode, history               | prefix + : + arrow keys      |

## Copy-Paste, Visual Mode, Movement

Like visual mode, cursor and pagination can move

vi bindings per tmux man page

| Description                                | Shortcut                    |
|--------------------------------------------|-----------------------------|
| Page Up/Down                               | prefix + Page Up, Page Down |
| Copy mode                                  | prefix + \[                 |
| Select                                     | Space                       |
| Select, visual select rectangle toggle     | Space or v                  |
| Select, visual line monde                  | Shift + v                   |
| Copy                                       | Enter / Ctrl + w            |
| tmux-yank plugin: copy to system clipboard | prefix + y or y             |
| Search up, down                            | ?, / + \<word\> + enter     |
| Search next, previous result               | n, p                        |

### Copy-Paste, Mouse mode

Select mode with mouse using Shift + mouse motions, then Ctrl+Shift+c to
copy, Ctrl+Shift+v to paste

## Panes

| Description | Shortcut |
|----|----|
| Split panes | prefix + % (horizontal) / " (vertical) |
| Go to pane by direction | prefix + arrow keys |
| Go to pane by number | prefix + q + number |
| Close pane | close shell or prefix + x |
| Synchronize panes (execute same commands) | prefix + :setw synchronize-panes |

- synchronize panes can be useful when running same commands in
  different environments, machines, projects

## Sessions

| Description             | Shortcut          |
|-------------------------|-------------------|
| Detach session          | prefix + d        |
| List sessions           | prefix + s        |
| See, switch to sessions | prefix + w, enter |
| Rename session          | prefix + \$       |

## Edit

| Description                        | Shortcut    |
|------------------------------------|-------------|
| Paste                              | prefix + \] |
| Paste from tmux buffer (clipboard) | prefix + =  |

## Other

| Description             | Shortcut   |
|-------------------------|------------|
| Install/reload plugins  | prefix + I |
| Help, list key bindings | prefix + ? |

## Plugins

| Description             | Shortcut          |
|-------------------------|-------------------|
| tmux-resurrect, save    | prefix + Ctrl + s |
| tmux-resurrect, restore | prefix + Ctrl + r |
