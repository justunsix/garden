---
filetags: ":neovim:vim:programming:epubnote:"
id: 645199ea-3a6f-4847-aecf-c475ac0c19b8
title: Neovim Language Support
---

## LazyVim Linting and Formatting

Source: [LazyVim: Linting and Formatting - YouTube with Elijah
Manor](https://www.youtube.com/watch?v=a_ZpTPaSn38)

- Use LazyVim's language extras to setup environment for your language

- Can configure linters like ESLint for JS

  - Modify `.eslintrc.json` and configure linter messages
    - Can extend to use prettier

- How to find errors/warnings?

  - See neo tree indicators
  - View code diagnostics for buffer: SPC x x
    - View code diagnostics for line: SPC c d
  - Search diagnostics: SPC s d (buffer) / D (root dir)

- Fixing errors

  - Code action: SPC c a …
  - Code action, fix all issues: SPC c A

- Additional formatting with prettier in LazyVim extras

  - Create prettier config `npx prettier-init` in code directory

- null-ls.nvim has formatting sources

  - proselint - formatter for English
  - Can register formatters with mason, configure null-ls for
    diagnostics

## Understanding Neovim with Treesitter

Source: [Understanding Neovim \#4 - Treesitter -
YouTube](https://www.youtube.com/watch?v=kYXcxJxJVxQ)

Treesitter does efficient parsing of languages. It creates a tree of a
syntax, incremental as the file changes without re-parsing the whole
file

It helps with things like:

- Highlights words
- Pattern matching, like search

nvim-treesitter plugin helps with installation of the correct parsers
with specific queries.

- `:TSInstall` installs parsers for languages
- `:InspectTree` browse syntax tree

Allows navigation of code like:

- Comment
- Function
- Declaration
- Fields
- Statements

## Running nvim-treesitter with tree-sitter CLI on Windows 11 using MinGW

Following is a solution to using [MinGW on Windows with the tree-sitter
CLI](https://github.com/nvim-treesitter/nvim-treesitter/discussions/7934)

I was able to get tree-sitter build compilations working using mingw's
\`gcc\` without installing MSVC (cl.exe is not installed). Per
discussion in the link above, the workaround is not related to
nvim-treesitter, but rather setting the compiler for the the Rust \`cc\`
crate used by the tree-sitter cli build commands.

1.  Install mingw's gcc. For example, follow [instructions recommended
    by the cc
    crate](https://github.com/rust-lang/rust/blob/master/INSTALL.md#building-on-windows)
    which uses msys2 and the mingw gcc package.
2.  Set shell environment variable of \`CC\` to \`gcc\`. The environment
    variable setting is from the
    \[\[<https://docs.rs/cc/latest/cc/>\]\[cc Rust crate documentation\]
    on setting the compiler used.
3.  Run nvim and compilation should work now

Example workaround assuming nvim, tree-sitter CLI, and msys2 are
installed

``` shell
# Go into msys2
ucrt64

# Install mingw gcc
pacman -Syu mingw-w64-ucrt-x86_64-gcc

# Verify the gcc in the environment points to the mingw one
which gcc

# Set compiler that tree-sitter CLI will use
export CC="gcc"

nvim
```

Tested on 2025-09-18 with:

- NVIM v0.11.4
- tree-sitter 0.25.9
- Neovim distribution: LazyVim 15.x
