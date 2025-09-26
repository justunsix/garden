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
