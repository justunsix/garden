---
filetags: ":neovim:shortcuts:epubnote:"
id: 441cec9c-4ca1-479a-9dcc-b0b0bbe294f6
title: Neovim Shortcuts
---

## Neovim Shortcuts

| Name                     | Shortcuts    |
|--------------------------|--------------|
| Treesitter, inspect tree | :InspectTree |

## Kickstart LUA

| Name                              | Shortcuts          |
|-----------------------------------|--------------------|
| Search files with telescope       | \<SPC\> s f        |
| Search git files with telescope   | \<SPC\> g f        |
| Leader key and commands           | \<SPC\> \<keys…\>  |
| See telescope keymaps             | :Telescope keymaps |
| Lazy package manager              | :Lazy              |
| Lazy, sync (update clean plugins) | :Lazy sync         |

## LazyVim

\<l\> = leader key, default mapped to Spacebar

| Description | Shortcut |
|----|----|
| Buffer, Find | \<l\> f b |
| Buffer, Switch | \<l\> , |
| Code, Diagnostic error next and previous | \[ d and \] d |
| Code, LSP Information | \<l\> c l or :LspInfo |
| Code, Markdown preview | \<l\> c p |
| Code, Problems Diagnostics list with Trouble | \<l\> x x |
| Code, actions | \<l\> c a |
| Code, actions, check LSP, Linter with Mason | \<l\> c m |
| Code, actions, fix all | \<l\> c A |
| Debug, actions | \<l\> d |
| Debug, toggle breakpoint | \<l\> db |
| Debug, toggle user interface | \<l\> du |
| Debug, run/continue | \<l\> dc |
| Debug, step into | \<l\> di |
| Debug, toggle breakpoint condition | \<l\> dB |
| Command history, to execute in command mode | \<l\> : |
| Dashboard open | :lua Snacks.dashboard.open() |
| Find files, telescope mode, fuzzy find | \<l\> f f or SPC SPC |
| Find files, telescope mode, fuzzy find cwd | \<l\> f F |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, seek mode | s |
| Find files, telescope mode, exit mode | ESC ESC |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, insert mode | i |
| Find: enter terminal | \<l\> f t |
| Terminal Toggle, on and off | Ctrl + / |
| Flash: go to characters(s), Like Emacs Avy | s \<characters\> |
| Flash: go to for tree-sitter | S |
| Go to element Declaration | g D |
| Go to element Implementation | g I |
| Go to element definition | g d |
| Go to, Toggle comment on selection | g c |
| Navigation Next, buffer | \]b |
| Navigation Previous, buffer | \[b |
| Navigation, buffer to left, right of current | H, L |
| Neo tree, File explorer | \<l\> e |
| Neo tree, File explorer open in cwd | \<l\> E |
| Neo tree, Toggle hidden files | H |
| Neo tree, File, Open file/folder | Enter |
| Neo tree, File, Up one directory | Backspace (BS) |
| Neo tree, File, Delete | d |
| Neo tree, File, Add file, add folder | a, A |
| Neo tree, File, Open file/folder |  |
| Neo tree, File, Rename | r |
| Neo tree, File, Cut | x |
| Neo tree, File, Copy | y |
| Neo tree, File, Paste | p |
| Neo tree, Seek / search | s or / |
| Neo tree, Move up, down, scroll up, down | j, k, C-u, C-d |
| Neo tree, Quit | q |
| Neo tree, Help | :help neo-tree |
| Notifications | :noice |
| Screen: Adjust height and width | C-arrow keys |
| Screen: Navigate to screen in direction | C-h,j,k,l |
| Search: Command history | \<l\> s c |
| Search: Commands, Auto Commands, Key maps | \<l\> s C, a, k |
| Search: Current buffer | \<l\> s b |
| Search: Diagnostic messages | \<l\> s d |
| Search: Diagnostic messages, root directory | \<l\> s D |
| Search: Help | \<l\> s h |
| Search: Replace, Do Replace | \<l\> s r, \<l\> R |
| Search: Todos | \<l\> s t |
| UI, Split screen vertical, horizontal | \<l\> \\ , \<l\> - |
| UI, Toggle (LSP) Diagnostics, like inline msgs | \<l\> u d |
| User Interface (UI) Settings | \<l\> u |
| Which-key | \<l\> k s |
| Window, increase width left, right | C-left arrow, C-right arrow |
| Window, move in direction | \<l\> w \<j, k, h l\> |
| Window, move to split left, right, down up | C-h, C-l, C-j, C-k |
| Window, next, previous window | \<l\> w w or W |
| git: Lazygit | \<l\> g g |

### Plugins

| Description                                              | Shortcut    |
|----------------------------------------------------------|-------------|
| Plugin: Get Help when in a specific plugin like Neo tree | ?           |
| LazyVim Extras, View                                     | :LazyExtras |
| LazyVim Extras, Activate plugin                          | x           |

- Use LSP to see symbols, documents, rename, etc

Resources:

- [Zero to IDE with LazyVim -
  YouTube](https://www.youtube.com/watch?v=N93cTbtLCIM)
- [LazyVim Keymaps](https://www.lazyvim.md/keymaps)

## See Also

- [Vim Shortcuts](../005-computer-shortcuts-vim) - [Vim
  Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)

### Resources

- `vimtutor` command tutorial in terminal
- [LazyVim for Ambitious Developers, Vim, Neovim, Lazyvim
  Guide](https://lazyvim-ambitious-devs.phillips.codes/)
