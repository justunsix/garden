---
filetags: ":neovim:vim:debug:epubnote:"
id: 3dd708f8-6a2e-4752-9d7f-3a71b5c64352
title: Neovim Debugging
---

Source: [Debug With Neovim: A Dev's Edge in the AI
Age](https://www.youtube.com/watch?v=fvRwG17XsaA&t=214), [LazyVim
Extras](https://www.lazyvim.org/extras) for Neovim configuration and
recommended plugins

## How to Debug in Neovim

### Set up

Use the Neovim Debug Adapter Protocol (DAP)

Setup with nvim-dap-ui to user interface

An easy way to setup is to use [LazyVim](https://www.lazyvim.org/) DAP
Core extra and language extra for language you are using

### Usage

- Set breakpoints for place in code you want to start debugging
- Turn on user interface and set breakpoint(s)
- Run debugger with program and see:
  - Local variables, scopes
  - Set breakpoints, can step into a program running, going into code
    and libraries
  - Threads
  - Expressions - view details and make changes
    - Check values similar to a REPL and query

You can use expressions to check program information. Code can be edited
in real time.

Threads are useful for going through multi threaded programs.

## See Also

- [GDB and LLDB
  Snippets](/garden/notes/005-computer-snippets-gdb-lldb-gnu-debugger) - [GDB and
  LLDB Debugger Snippets](id:7fba6e8c-f671-4deb-8126-88a1208d567e)
