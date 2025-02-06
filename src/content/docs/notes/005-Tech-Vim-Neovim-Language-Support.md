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

- Treesitter does efficient parsing of languages
  - Creates a tree of a syntax, incremental as the file changes without
    re-parsing the whole file
  - Highlights words
  - Pattern matching, like search
- nvim-treesitter plugin helps with installing parsers
  - `:TSInstall` installs parsers for languages
  - `:InspectTree` browse syntax tree
    - Allows navigation of code like:
      - Comment
      - Function
      - Declaration
      - Fields
      - Statements
