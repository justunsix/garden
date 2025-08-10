---
description: GNU Project Debugger (GDB) and LLDB Debugger Snippets
filetags: ":gdb:lldb:llvm:snippets:epubnote:"
id: 7fba6e8c-f671-4deb-8126-88a1208d567e
title: GDB and LLDB Debugger Snippets
---

Source: [GDB to LLDB command map](https://lldb.llvm.md/use/map.html),
[Debugging Rust apps with GDB - LogRocket
Blog](https://blog.logrocket.com/debugging-rust-apps-with-gdb/),
[Debugging with GDB (GDB
manual)](https://sourceware.md/gdb/current/onlinedocs/gdb)

Note commands/aliases like run (r), step (s), and breakpoint (b) are
similar or same with GDB and LLDB

Commands below are confirmed to work with rust-gdb

``` shell

# Debug specific binary
rust-gdb target/debug/examples/basic

# Help information
help

# Quit
q

# Run
r

# Set breakpoint (break) on a function
b get_chip

# Set breakpoint on file and line number
b main.rs:22

# Breakpoint information
b info

# Breakpoint disable it
disable 1

# Breakpoint in temporary place, breakpoint will only occur once
tbreak 6

# Step - next, go to next line
n

# Step - step into like a function, run next line of code
s

# Step N - run next N lines of code
s Number

# Step - finish function
finish

# Step - continue execution until new breakpoint or end
c

# Repeat previous command
Enter

# Check incoming arguments
info args

# Print information on variable, function
print myvariable
p variable_name
p code_element

# Frame - check current code execution line
f
# Set - change state of variables
set var_name = my_value

# List - print source lines, print lines centered around line number
l 2
list 6
# List - print source around beginnning of function
list function_name

```

## GDB

``` shell


# Layout - See debugging location in source code
layout src
layout split

# Layout - remove layout
Ctrl + x a

```
