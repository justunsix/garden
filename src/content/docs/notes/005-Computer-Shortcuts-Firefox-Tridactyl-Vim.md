---
filetags: ":tridactyl:shortcuts:epubnote:"
id: 3961e45c-7edc-4f94-9a50-df8f3e0113cf
title: Firefox Tridactyl Add On Vim like Shortcuts
---

## Modes

| Description                                          | Shortcut       |
|------------------------------------------------------|----------------|
| Command mode (like vi)                               | :              |
| Exit current mode back to normal mode                | ESC            |
| Hint mode (select links)                             | f              |
| Hint mode (select links, open in background new tab) | F              |
| Ignore mode (past all keys as normal to browser)     | Shift + Insert |

## Visual Mode, Hint Mode for Selecting and copying text

| Description                                  | Shortcut                 |
|----------------------------------------------|--------------------------|
| Hint mode, copy element text like paragraph  | ;p                       |
| Hint mode, copy link location                | ;y                       |
| Hint mode, Kill an element (delete it)       | ;k                       |
| Visual mode, adjust selection                | h, j, k, l, e, w, b      |
| Visual mode, copy text                       | y                        |
| Visual mode, enter                           | v or other options below |
| Visual mode, move cursor to end of selection | o                        |
| Visual mode, web search selected text        | s or S                   |

Visual mode enter options: v, mouse to select text, ;h, search with /,
F7

## Movement

### Browser specific

1.  Tabs

    | Description                           | Shortcut                          |
    |---------------------------------------|-----------------------------------|
    | Close / delete tab                    | d                                 |
    | Go to first/last tab                  | g0, g\$                           |
    | Go to last active tab                 | C-^                               |
    | Open new tab                          | t                                 |
    | See open tabs and filter/select items | b + type + TAB/SHIFT-TAB          |
    | Switch tabs                           | Shift + j (previous) or k (next)) |
    | Switch tabs by list                   | b                                 |
    | Undo close item                       | u                                 |

2.  Pages

    | Description                                  | Shortcut                |
    |----------------------------------------------|-------------------------|
    | Historym, Back and Forward                   | H (back), L (forward)   |
    | Bookmark set - global persistent on restarts | markadd \[A-Z\]         |
    | Bookmark set - local non-persistent          | markadd \[a-z\]         |
    | Copy current tab title to clipboard          | yt                      |
    | Copy current URL to clipboard                | yy                      |
    | Go to, Focus on first text box for input     | gi                      |
    | Go to, Next page (guess it)                  | \]\]                    |
    | Go to, Previous page (guess it)              | \[\[                    |
    | Jump back to where you came from             | \`\`                    |
    | Jump to bookmark                             | \` + \[a-z\] or \[A-z\] |

### Same as vim

| Description             | Shortcut |
|-------------------------|----------|
| Navigation              | hjkl     |
| Go to beginning of page | gg       |
| Go to end of page       | G        |
| Repeat last action      | .        |

j and k are bound to scrollline 10 and -10 respectively

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

| Description | Shortcut |
|----|----|
| History, navigate | Arrow key up or down |
| Enter command mode | : |
| Complete command from history | C-f |
| Completion, cycle | Tab, Shift + Tab |
| Insert URL of highlighted completion | Space |
| Run highlighted completion and keep command mode open | Ctrl + Enter |
| Copy highlighted completion to clipboard | Ctrl + o yy |

``` text

# Open help
:help
:h
:help [command]
:help [setting]

# Open interactive tutorial
:tutor

# View page source
:viewsource

# Containers
## Create
:createcontainer name [color] [icon]
## Open tab with container with -c name of container
:tabopen -c name [url]

# Enter ignore mode for specified URLs
:blacklistadd [url]
# Remove the URL from the blacklist
:blacklistremove [url]

# Search with a specific search engine
open duckduckgo <query>
tabopen bing <query>
## Default search engine
open search <query>

# Detach tab to new window
tabdetach

# Run command sequentially with ;
composite [commmand 1]; [command 2]

# Pipe commands
composite [commmand 1] | [command 2]

```

### Settings, Key bindings

``` text

# Search for a setting
:apropos

# Read settings from file, url, clipboard
source [arguments]
# Defaults to ~/.tridactylrc, ~/.config/tridactyl/tridactylrc or $XDG_CONFIG_HOME/tridactyl/tridactylrc
# and on Windows %USERPROFILE%
## Help for sourcing
:help source

# Search for a setting
:apropos
# Search for a setting
:apropos
get [setting]
# Setting, set value
set [setting]
## Set theme to dark
set theme dark
# Setting, unset value
unset [setting]
# Delete a setting
:setnull [setting]

# See current configuration
:viewconfig
## See current normal mode bindings
:viewconfig nmaps
## Default search engine and available engines or define them in searchurls
:viewconfig searchengine
:viewconfig searchurls
## Hint filter mode
:viewconfig hintfiltermode

# Theme appearance with dark or default
:viewconfig theme

# Aliases for ex commands
:viewconfig exaliases

# Check key binding
:bind j
# Rebind a key
:bind J tabnext

```

## See Also

- [Vim Shortcuts](../005-computer-shortcuts-vim) - [Vim
  Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)
- [Firefox Shortcuts](../005-computer-shortcuts-firefox) - [Firefox
  Shortcuts](id:8d636d51-8333-4a2e-a9ab-b073f6ae6721)
- [Vim](../005-tech-vim) -
  [Vim](id:57923c42-729e-4abc-b16a-4b0699e83717)

### Resource

- :tutor inside Tridactyl
- [Make Firefox Even Better With This Extension - The Linux Cast on
  YouTube](https://www.youtube.com/watch?v=wUtwc6KgzXU) - walkthrough of
  common features, tutor
- [Tridactyl
  Tutorial](https://github.com/tridactyl/tridactyl/blob/master/src/static/clippy/1-tutor.md)
