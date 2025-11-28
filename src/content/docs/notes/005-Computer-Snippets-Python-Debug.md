---
filetags: ":snippets:python:debug:tech:epubnote:"
id: 8093b4b0-9b65-4e0e-8dd7-260bce0a2ade
title: Python Debugging Snippets
---

PDB is Python Debugger. It is in the standard library though there are
other debuggers and GUI ones.

``` bash

# Debug a script with Python Debugger (PDB), part of standard library
python -m pdb pyfile.py
# See https://docs.python.org/3/library/pdb.html
# Commands are similar to GDB

```

``` python

# Debug interactively with PDB
import pdb
import buggyscript
buggyscript.crash()
# Post mortem command to PDB at crash
pdb.pm()

# Start debugging in program with console
import pdb
pdb.set_trace()
# run program with PDB console

# Set a breakpoint in a program
breakpoint()

```

## PDB Console

Also accepts valid python

``` python

# Help
help

# list, see current code line - same as GDB
l

# next, go through next line of code - same as GDB
n

# continue, until next breakpoint - same as GDB
c

# step into a statement, function - same as GDB
s

# return
r

# print variables - same as GDB
p variable_name

# breakpoint set on line of current file
b 20
break 4

# Breakpoint in temporary place, breakpoint will only occur once - same as GDB
tbreak 6

# unt(il) line number
until 6
# Continue execution until the line with a number greater
# than the current one is reached or until the current frame returns

```

## See Also

- [GDB and LLDB
  Snippets](/garden/notes/005-computer-snippets-gdb-lldb-gnu-debugger) - [GDB and
  LLDB Debugger Snippets](id:7fba6e8c-f671-4deb-8126-88a1208d567e) for
  similar commands
