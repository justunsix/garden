---
filetags: ":emacs:packages:shortcuts:epubnote:"
id: c83f42e0-ecb2-427d-bf75-0a3ca824bf1d
title: Emacs Shortcuts from Other Packages
---

## Search with ripgrep, projectile

| Name                           | Shortcuts          |
|--------------------------------|--------------------|
| Search project                 | projectile-ripgrep |
| ripgrep results - display menu | m                  |
| ripgrep results - new regex    | r                  |

## Hyperbole

| Name | Shortcuts |
|----|----|
| Action key, follow button | M-Enter or hui-hbut-act |
| Action key, hkey-either | {M-RET} (ESC RETURN, ALT-RETURN, or CMD-RETURN) or SHIFT-MIDDLE-MOUSE |

## Markdown Mode

| Name                                           | Shortcuts |
|------------------------------------------------|-----------|
| Insert new list item of same level immediately | M-Enter   |

## Treemacs

| Name            | Shortcuts                    |
|-----------------|------------------------------|
| Open treemacs   | M-x treemacs                 |
| Edit Workspaces | M-x treemacs-edit-workspaces |

## Projectile

| Name | Shortcuts |
|----|----|
| Invalidate caches | C-c p i |
| Invalidate caches - Such as on Windows when file cache is out of date | projectile-invalidate-cache |
| Test project using unit tests | M-x projectile-test-project or C-c p P |

## Python

| Name | Shortcuts |
|----|----|
| Run Python shell | M-x run-python |
| Run region in Python shell | M-x python-shell-send-region |
| Run buffer/file in Python shell | M-x python-shell-send-buffer / M-x python-shell-send-file |

## DAP (Debugging)

| Name                                    | Shortcuts                 |
|-----------------------------------------|---------------------------|
| Start debugging                         | M-x dap-debug             |
| Set breakpoint                          | M-x dap-breakpoint-toggle |
| Run REPL to see values during debugging | M-x dap-ui-repl           |

## CSV

| Name                           | Shortcuts             |
|--------------------------------|-----------------------|
| Align columns on a fixed width | csv-align-mode        |
| Shorten long lines             | toggle-truncate-lines |

## expand-region (region marker)

| Name                             | Shortcuts     |
|----------------------------------|---------------|
| Expand region                    | C-=           |
| Expand region: contract, reset   | C-= then -, 0 |
| Mark email, paragraph, symbol, … | er/mark-…     |

## imenu (Outline mode)

| Name                          | Shortcuts               |
|-------------------------------|-------------------------|
| Show imenu / outline side bar | imenu-list-smart-toggle |

## Avy - Search, Go to, and Act on Selection

Tips from [Avy can do
anything](https://karthinks.com/software/avy-can-do-anything/)

| Name                    | Shortcuts                     |
|-------------------------|-------------------------------|
| Go to char              | avy-goto-char, avy-goto-char2 |
| Go to char/word         | avy-goto-char-timer           |
| Action menu before jump | ?                             |

- timer means type chars quickly to match

## Embark

| Name                      | Shortcut           |
|---------------------------|--------------------|
| Embark Act (Context menu) | SPC a (Doom Emacs) |

Using with ripgrep:

Combine with `consult-rg` and `embark-export` (C-c C-e)

## Consult

Use to navigate file like `consult-line`, `consult-ripgrep`,
`consult-fd`

| Name                           | Shortcut            |
|--------------------------------|---------------------|
| Consult Buffer (switch buffer) | SPC \< (Doom Emacs) |

## Undo Tree Mode - vundo

| Name                    | Shortcut                      |
|-------------------------|-------------------------------|
| Visualize the undo tree | vundo or SPC s u (Doom Emacs) |

## YASnippet

Begin type snippet with its short form like:

- \<…
- \_\_
- abbreviation
