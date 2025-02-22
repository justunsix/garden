---
filetags: ":tridactyl:shortcuts:epubnote:"
id: 3961e45c-7edc-4f94-9a50-df8f3e0113cf
title: Firefox Tridactyl Add On Vim like Shortcuts
---

## Modes

| Description                                          | Shortcut  |
|------------------------------------------------------|-----------|
| Exit current mode by the normal mode                 | ESC       |
| Hint mode (select links)                             | f         |
| Hint mode (select links, open in background new tab) | F         |
| Command mode (like vi)                               | :         |
| Ignore mode (past all keys as normal to browser)     | SHIFT-INS |

## Edit

### Copy Paste

| Description                                 | Shortcut            |
|---------------------------------------------|---------------------|
| Hint mode, copy element text like paragraph | ;y                  |
| Hint mode, Kill an element                  | ;k                  |
| Visual mode, to select text                 | v of F7             |
| Visual mode, copy text                      | y                   |
| Visual mode, adjust selection               | h, j, k, l, e, w, b |

## Movement

### Browser specific

1.  Tabs

    | Description                           | Shortcut                 |
    |---------------------------------------|--------------------------|
    | Switch tabs                           | J (previous), K (next))  |
    | Switch tabs by list                   | b                        |
    | Go to last active tab                 | C-^                      |
    | Go to first/last tab                  | g0, g\$                  |
    | Open new tab                          | t                        |
    | See open tabs and filter/select items | b + type + TAB/SHIFT-TAB |
    | Close / delete tab                    | d                        |
    | Undo close item                       | u                        |

2.  Pages

    | Description                                  | Shortcut                |
    |----------------------------------------------|-------------------------|
    | Back and Forward                             | H (back), L (forward)   |
    | Focus on first text box for input            | gi                      |
    | Copy current URL to clipboard                | yy                      |
    | Copy current tab title to clipboard          | yt                      |
    | Go to next page (guess it)                   | \]\]                    |
    | Go to previous page (guess it)               | \]\]                    |
    | Bookmark set - local non-persistent          | markadd \[a-z\]         |
    | Bookmark set - global persistent on restarts | markadd \[A-Z\]         |
    | Jump to bookmark                             | \` + \[a-z\] or \[A-z\] |
    | Jump back to where you came from             | \`\`                    |

### Same as vim

| Description             | Shortcut |
|-------------------------|----------|
| Navigation              | hjkl     |
| Go to beginning of page | gg       |
| Go to end of page       | G        |
| Repeat last action      | .        |

## Settings

| Description           | Shortcut   |
|-----------------------|------------|
| Zoom in, out, default | zi, zo, zz |

## Search

| Description                                                  | Shortcut |
|--------------------------------------------------------------|----------|
| Search page                                                  | /        |
| Search: next, previous match                                 | C-g, C-G |
| Open search default search engine, or open in new tab search | s, S     |

## Command mode

Access less frequent commands. Up/Down to navigate history.

- apropos - search for a setting
- help - open help page
- tutor - open interactive tutorial
- viewconfig - see current configuration
- viewsource - view page source

| Description                   | Shortcut |
|-------------------------------|----------|
| Complete command from history | C-f      |

## See Also

- [Vim Shortcuts](005-Computer-Shortcuts-Vim.md) - [Vim
  Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)
- [Firefox Shortcuts](005-Computer-Shortcuts-Firefox.md) - [Firefox
  Shortcuts](id:8d636d51-8333-4a2e-a9ab-b073f6ae6721)
- [Vim](005-Tech-Vim.md) -
  [Vim](id:57923c42-729e-4abc-b16a-4b0699e83717)

### Resource

- [Tridactyl
  Tutorial](https://github.com/tridactyl/tridactyl/blob/master/src/static/clippy/1-tutor.md)
