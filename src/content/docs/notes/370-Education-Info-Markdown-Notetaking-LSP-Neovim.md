---
filetags: ":markdown:note:knowledge:management:epubnote:"
id: 56fe068c-d63a-4457-8feb-eb6be389bf4a
title: Marksman LSP Markdown and Neovim Notetaking
---

Source: [Marksman LSP: Replace Obsidian with Neovim for Note-Taking -
linkarzu on YouTube](https://www.youtube.com/watch?v=SXKsIyYJIrU)

Source goes over Markdown LSP Protocol, links, rename, completions,
diagnostics, and other functionality with the [Marksman
LSP](https://github.com/artempyanykh/marksman) and
[Neovim](https://neovim.io/). See Marksman documentation on installation
of marksmans. In Neovim, can use mason plugin for installation.

## Navigating and Editing Notes with Marksman Functionality

Completion, folding, and heading (symbols) navigation/renaming works in
markdown like other code and LSP actions in Neovim and Vim.

Restart the Marksman LSP server to have it scan file locations like with
`:LSPRestart`. Restart is useful after file renames.

## Managing Notes: Images, Snippets, Table of Contents

[Images in Neovim](https://linkarzu.com/posts/neovim/images-neovim/) are
supported using plugins.

Creating notes are just new files in the file system, for example
editing a new note.

Snippets can be inserted, for example using
[blink.cmp](https://github.com/Saghen/blink.cmp) Neovim plugin snippet
completion to create a blog post template and it can be inserted in a
new file.

Create a table contents using Markdown table of contents functionality.
