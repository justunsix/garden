---
filetags: ":neovim:shortcuts:epubnote:"
id: 441cec9c-4ca1-479a-9dcc-b0b0bbe294f6
title: Neovim Shortcuts
---

## Command mode

| Name | Shortcuts |
|----|----|
| Lua, run visual selection | :'\<'\>lua |
| Lua, see vim table | :lua =vim |
| Nvim, see runtime paths | :echo nvim<sub>listruntimepaths</sub> |
| Nvim, check health of a component | :checkhealth lazy |
| Treesitter, Inspect item at point | :Inspect |
| Treesitter, Inspect language nodes tree at point | :InspectTree |
| Treesitter, Inspect language nodes tree at point, Query Editor | :InspectTree , then press o |
| Buffer, format | vim.lsp.buf.format |

For Buffer, format, can run with :lua vim.lsp.buf.format

## Language Server Protocol (LSP)

See :h lsp for more commands

| Description                                       | Shortcut    |
|---------------------------------------------------|-------------|
| Go to, lsp definition, variable/function creation | C-\]        |
| Go to, lsp tag, variable/function use             | C-t         |
| Go to, lsp reference of item at point             | g r         |
| Go to, lsp references                             | g r r       |
| Go to, lsp references, rename them                | g r n       |
| Go to, lsp implementation                         | g r i       |
| Go to, lsp code action                            | g r a       |
| Go to, lsp document symbol                        | g 0         |
| Go to, lsp signature help (insert mode)           | C-s         |
| LSP, restart                                      | :LSPRestart |

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
| Code, actions | \<l\> c a |
| Code, actions, check LSP, Linter with Mason | \<l\> c m |
| Code, actions, fix all | \<l\> c A |
| Code, actions, LSP Rename | \<l\> c r |
| Code, Diagnostic error next and previous | \[ d and \] d |
| Code, LSP Information | \<l\> c l or :LspInfo |
| Code, Markdown preview | \<l\> c p |
| Code, Problems Diagnostics list with Trouble | \<l\> x x |
| Command history, to execute in command mode | \<l\> : |
| Completion, accept | C-y |
| Completion, insert mode up or down | C-n or C-p |
| Dashboard open | :lua Snacks.dashboard() |
| Debug, actions | \<l\> d |
| Debug, run/continue | \<l\> dc |
| Debug, step into | \<l\> di |
| Debug, toggle breakpoint | \<l\> db |
| Debug, toggle breakpoint condition | \<l\> dB |
| Debug, toggle user interface | \<l\> du |
| Find files, telescope mode, exit mode | ESC ESC |
| Find files, telescope mode, fuzzy find | \<l\> f f or SPC SPC |
| Find files, telescope mode, fuzzy find cwd | \<l\> f F |
| Find files, telescope mode, git files | \<l\> f g |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, insert mode | i |
| Find files, telescope mode, seek mode | s |
| Flash: go to characters(s), Like Emacs Avy | s \<characters\> |
| Flash: go to for tree-sitter | S |
| git: Lazygit | \<l\> g g |
| Go to element Declaration | g D |
| Go to element definition | g d |
| Go to element Implementation | g I |
| Go to, File under cursor | g f |
| Go to, Toggle comment line | g c c |
| Go to, Toggle comment on selection | g c |
| Help: search | \<l\> s h |
| Navigation, buffer to left, right of current | H, L |
| Navigation, Next, buffer | \]b |
| Navigation, Previous, buffer | \[b |
| Navigation, previous/next paragraph/section | {, } |
| Navigation, previous/next sentence | (, ) |
| Neo tree, File, Add file, add folder | a, A |
| Neo tree, File, Copy | y |
| Neo tree, File, Cut | x |
| Neo tree, File, Delete | d |
| Neo tree, File explorer | \<l\> e |
| Neo tree, File explorer open in cwd | \<l\> E |
| Neo tree, File, Open file/folder | Enter |
| Neo tree, File, Open file/folder |  |
| Neo tree, File, Paste | p |
| Neo tree, File, Rename | r |
| Neo tree, File, Up one directory | Backspace (BS) |
| Neo tree, Help | :help neo-tree |
| Neo tree, Move up, down, scroll up, down | j, k, C-u, C-d |
| Neo tree, Quit | q |
| Registers, show lists | " |
| Marks, show lists | ' |
| Neo tree, Seek / search | s or / |
| Neo tree, Toggle hidden files | H |
| Notifications | :noice |
| Screen: Adjust height and width | C-arrow keys |
| Screen: Navigate to screen in direction | C-h,j,k,l |
| Search: Buffer | \<l\> s b |
| Search: Command history | \<l\> s c |
| Search: Commands, Auto Commands, Key maps | \<l\> s C, a, k |
| Search: Diagnostic messages | \<l\> s d |
| Search: Diagnostic messages, root directory | \<l\> s D |
| Search: Help | \<l\> s h |
| Search: Keymap | \<l\> s k |
| Search: Replace, Do Replace | \<l\> s r, \<l\> R |
| Search: Todos | \<l\> s t |
| Search: selection, selected tex on root or cwd | \<l\> s w or s W |
| Terminal, Bring up/Hide open terminal | C-/ |
| Terminal, Find: enter terminal | \<l\> f t |
| Terminal, return to normal mode | ESC ESC or C-\\ C-n (default vim) |
| UI, Split screen vertical, horizontal | \<l\> \\ , \<l\> - |
| UI, Toggle (LSP) Diagnostics, like inline msgs | \<l\> u d |
| User Interface (UI) Settings | \<l\> u |
| Which-key | \<l\> k s |
| Window, increase width left, right | C-left arrow, C-right arrow |
| Window, move in direction | \<l\> w \<j, k, h l\> |
| Window, move to split left, right, down up | C-h, C-l, C-j, C-k |
| Window, next, previous window | \<l\> w w or W |

To simulate M-x in Emacs, use search keymaps and search commands.

### Item Navigation with \[ and \] (Unimpaired Mode)

| Description                         | Shortcut               |
|-------------------------------------|------------------------|
| Next, previous item                 | \[ \<item\>\] \<item\> |
| Buffer                              | \[b, \]b               |
| Function                            | \[f, \]f               |
| Spelling: misspelled word           | \[s, \]s               |
| Section or Code reference, previous | \[\[                   |
| Section or Code reference, next     | \]\]                   |

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
- [LazyVim Keymaps](https://www.lazyvim.org/keymaps)

### fzf-lua

| Description                           | Shortcut |
|---------------------------------------|----------|
| Search, move results to quickfix list | C-q      |

### org-mode

| Description | Shortcut |
|----|----|
| Go to, previous, next headline | <span class="spurious-link" target=" ,">* ,*</span> |
| Headline, demote, promote | \>\>, \<\< |
| Folding, toggle | S-Tab |
| Help, show | g? |
| Checkbox, toggle | C-Space |

### vim-dadbod, vim-dadbob-ui

| Description                                        | Shortcut |
|----------------------------------------------------|----------|
| Open DBUI                                          | :DBUI    |
| Query, Save for later use                          | \<l\> W  |
| Edit bind parameters                               | \<l\> E  |
| LazyVim, Execute query in file or visual selection | \<l\> S  |

Example connection string: sqlite:/path/to/myfile.sqlite3

## See Also

- [Vim Shortcuts](/garden/notes/005-computer-shortcuts-vim) - [Vim
  Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)

### Resources

- `vimtutor` command tutorial in terminal
- [LazyVim for Ambitious Developers, Vim, Neovim, Lazyvim
  Guide](https://lazyvim-ambitious-devs.phillips.codes/)
