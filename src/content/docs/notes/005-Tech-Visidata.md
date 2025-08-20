---
description: VisiData is an interactive multitool for tabular data. It
  combines a spreadsheet, terminal, and Python, into a lightweight
  utility.
id: c09f8b01-007c-4842-a90e-6546a68ba286
title: Visidata
---

## Convert Excel to CSV

- Open Excel sheet of interest in visidata
- Save the file, when prompted for name, change extension to `.csv`

## Install Visidata on Windows

- Use Python interpreter with a supported version of windows-curses
  - Create a virtual environment like in conda if needed like 3.11
- If the current Python interpreter supports windows-curses, recommend
  use pipx instead

``` shell

# uv install option
## uv will include windows-curses
## openpyxl for Excel support
uv tool install visidata

# pip install option
# Install visidata requirements
pip install visidata windows-curses

# For Excel files support
pip install openpyxl

```
