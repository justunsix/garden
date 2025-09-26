---
filetags: ":neovim:snippets:epubnote:"
id: 14f691d1-6ce6-4765-8fed-4fcee1ea410a
title: Neovim Snippets
---

``` bash

# Open file
nvim myfile.txt

# Launch neovim with a specific configuration folder
# e.g. ~/.config/astronvim
NVIM_APPNAME=astronvim nvim

# or in shell set environment variables
## powershell
$env:NVIM_APPNAME = "astronvim"
## bash
export NVIM_APPNAME="astronvim"
## nu
$env.NVIM_APPNAME = 'astronvim'
## Run nvim
nvim

# Edit a file with a specific configuration
NVIM_APPNAME=nvimexample nvim init.lua

```

## Lua Snippets related to Neovim

``` lua

-- Set key mappings
-- Source current file, normal mode SPC SPC X
vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
-- Run lua in current line
vim.keymap.set("n", "<space>x", ":.lua<CR>")
-- Run lua in visual selection
vim.keymap.set("v", "<space>x", ":lua<CR>")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

```

## See Also

- [Neovim Shortcuts](../005-computer-shortcuts-neovim) - [Neovim
  Shortcuts](id:441cec9c-4ca1-479a-9dcc-b0b0bbe294f6)
- [Lua Snippets](../005-computer-snippets-lua) - [Lua
  Snippets](id:2484c395-d27c-44b4-8706-7abab107d2ed)
