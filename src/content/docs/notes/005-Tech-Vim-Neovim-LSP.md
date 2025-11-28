---
filetags: ":neovim:lsp:rust:epubnote:"
id: 2a279ca1-8291-45e0-889d-26ec8063e535
title: Neovim and Language Server Protocol (LSP)
---

Language Server Protocol (LSP) helps computer programmers working on
editors and get information about the languages they are working on. The
LSP is an interface between editors (files, codes, cursor, state of
code) and language server(s) running on the computer and the language
server provides information on the state of the code.

## Neovim LSP Setup Native and options with Plugins

Source: [Neovim LSP Myth: You DON'T Need Plugins (The 5-Tier Setup) -
smnatale - YouTube](https://www.youtube.com/watch?v=yI9R13h9IEE)

Video covers setting up LSP in Neovim with default functionality and no
plugins. It then goes through options that add more automation with
plugins 1. `nvim-lspconfig`, 2. `mason.nvim`, 3. `mason-lspconfig`, 4.
`mason-tool-installer` and when to use the automation those plugins help
with.

### Option 1: Native Set up, No Plugins

Example using Lua LSP

1.  Install Lua language server on your system
2.  Copy `lua_ls.lua` from `nvim-lspconfig` repository to the Neovim
    configuration directory
3.  In `init.lua` add `vim.lsp.enable({"lua_ls"})`
4.  Repeat for other languages as needed

### Option 2: with LSP configuration plugin

1.  Reuse LSP configurations maintained by the community using the
    `nvim-lspconfig` plugin. Add plugin to Neovim configuration.
2.  Optionally, override any settings.
3.  Install language servers you want to use on your system
4.  In `init.lua` add `vim.lsp.enable({"lua_ls", "ts_ls"})` for Lua and
    Typescript or choose appropriate LSP for the language.

### Option 3: with LSP installer and LSP configuration plugins

1.  Set up Option 2. Use `mason.nvim` to install relevant language
    servers and in Neovim use `:Mason`
2.  Use `mason-lspconfig` to set which LSPs to install and enable LSPs.
3.  Update Neovim configuration to set which LSPs to install and enable:

``` lua

require("mason-lspconfig").setup({
    ensure_installed = {"lua_ls", "ts_ls"}
})

```

1.  Use `mason-tool-installer` to set which should be installed and not
    installed (for example, you manage the install yourself).

## Rust Setup for Neovim

Source: [Rust Setup For Neovim (ft BashBunni) \#bash2basics - YouTube
with TJ DeVries](https://www.youtube.com/watch?v=Mccy6wuq3JE)

### Installing rust

- Use rustup.rs
  - rustc, cargo
- Get Rust LSP: rust-analyzer

### New rust project, look at rust files

``` shell

# Install rust LSP
rustup component add rust-analyzer

# Create new project
cargo new projectname

# run project1
cd projectname
cargo run

```

Can prefer cargo run to check for errors

### Getting lspconfig setup

What is an LSP?

- Language Server Protocol (LSP)
  - Just a program
- Helps your editor figure syntax of language, helps navigate

Example lsp.lua

``` lua

lspconfig.rust_analyzer.setup {
  capabilities = capabilities,
  on_attach = on_attach,
  -- so it can find rust-analyzer
  cmd =  {
    "rustup", "run", "stable", "rust-analyzer"
  }
}

```

- Restart nvim
- Find help at [lspconfig
  site](https://github.com/neovim/nvim-lspconfig) or the LSP server site
  for the language on how to integrate

### Testing out Rust basics

main.rs

``` rust

fn main() {
    println!("{} world", "hello");
}

fn truthy() -> bool {
    return false;
}

#[cfg(test)]
mod test {
    use super::truthy;

    #[test]
    fn test_something() {
        assert_eq!(truthy(), true);
    }
}
```

### Writing rust tests, cargo-watch

``` shell

cargo test

# Install tool to monitor for file changes and then do tests
cargo install cargo-watch
# Tell cargo watch to run tests on source changes
cargo watch -x test
# During later changes to source code, tests will automatically be run

```
