---
filetags: ":neovim:vim:epubnote:"
id: 92a17093-5e2e-41c9-a142-b2c08e06ffe8
title: Neovim
---

## Effective Neovim: Instant IDE

### Set up Configuration

``` shell

# Create directory
mkdir -p ~/.config/nvim

# Get starter nvim config from https://github.com/nvim-lua/kickstart.nvim
cd ~/.config/nvim
curl -O https://raw.githubusercontent.com/nvim-lua/kickstart.nvim/master/init.lua

# On any OS, locate the configuration directory used for nvim with
:echo stdpath('config')
# e.g. on Windows it is %AppData%/Local/nvim

```

Read through init.lua to understand installed packages and keymaps

## Astrovim - Neovim configuration

- Install using Getting Started section of [Astronvim
  Documentation](https://docs.astronvim.com).
- Can install plugins using
  [lazynvim](https://github.com/folke/lazy.nvim) such as putting single
  lua files per plugin to plugins directory, for example, for
  [orgmode](https://github.com/nvim.mdmode.mdmode) add `orgmode.lua` to
  plugins directory with block in [orgmode install
  instructions](https://github.com/nvim.mdmode.mdmode?tab=readme-ov-file#installation).

Use Astrovim with existing nvim configuration:

``` bash

git clone --depth 1 https://github.com/AstroNvim/template ~/.config/astronvim
# Set nvim configuration to use
export NVIM_APPNAME='astronvim'
nvim

```

``` powershell

git clone --depth 1 https://github.com/AstroNvim/template $env:LOCALAPPDATA\astronvim
# Set nvim configuration to use
$env:NVIM_APPNAME = "astronvim"
nvim

```

## Enabling NvChad/menu in lazyvim

``` lua

-- mouse users + nvimtree users!
vim.keymap.set("n", "<RightMouse>", function()
  vim.cmd.exec('"normal! \\<RightMouse>"')

  local options = vim.bo.ft == "NvimTree" and "nvimtree" or "default"
  require("menu").open(options, { mouse = true })
end, {})

return {
  {
    { "nvchad/volt", lazy = true },
    {
      "nvchad/menu",
      config = function()
        local options = "default" -- Load default menus
        local opts = { mouse = true, border = false }
        require("menu").open(options, opts)
      end,
      -- opts = { mouse = true, border = false },
      -- config = function()
      --   require("menu").open("menu", { mouse = true, border = false })
      -- end,
      lazy = true,
    },
  },
}

```

## See Also

- [Neovim Shortcuts](005-Computer-Shortcuts-Neovim.md) - [Neovim
  Shortcuts](id:441cec9c-4ca1-479a-9dcc-b0b0bbe294f6)
- [Neovim Language Server Protocol (LSP)](005-Tech-Vim-Neovim-LSP.md) -
  [Neovim Language Server Protocol
  (LSP)](id:2a279ca1-8291-45e0-889d-26ec8063e535)
- [Neovim Language Support](005-Tech-Vim-Neovim-Language-Support.md) -
  [Neovim Language Support](id:645199ea-3a6f-4847-aecf-c475ac0c19b8)
- [Neovim and Artificial
  Intelligence](005-Tech-Vim-Neovim-Artificial-Intelligence.md)

### Resources

- [Effective Neovim: Instant IDE -
  YouTube](https://www.youtube.com/watch?v=stqUbv-5u2s)
