---
filetags: ":snippets:epubnote:wine:winetricks:"
id: d74e20b9-f1b8-4d8d-8747-71366f9ab90a
title: Wine Snippets
---

``` shell

# Set Wine prefix location and 64-bit architecture environment variables
export WINEPREFIX="/path/to/WinApps/myprogram/pfx"
# Set Wine to 64-bit
export WINEARCH="win64"

# Run a specific program inside the `wine` environment:
wine command

# Run a specific program in background
wine start command
# Run a program in its location of the Wine prefix
cd ~/my/wine/prefix/folder/
wine start mycommand.exe

# Install/uninstall an MSI package
wine msiexec /i|x path/to/package.msi
wine msiexec /i ~/Downloads/program.msi

# Run `File Explorer`, `Notepad`, or `WordPad`
wine explorer|notepad|write

# Run `Registry Editor`, `Control Panel`, or `Task Manager`:
wine regedit|control|taskmgr

# Run the configuration tool
wine winecfg

# Run Wine Configuration with a specific prefix
WINEPREFIX=~/.newprefix winecfg

# Run a specific program
cd "/path/to/WinApps/myprogram/pfx/drive_c/users/yourusername/programdirectory"
wine start program.exe

# Open uninstaller
wine uninstaller

```

## Wine Tricks to Install Missing Files, Libraries

``` shell

# Install corefonts
winetricks corefonts

```
