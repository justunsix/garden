---
date: 2026-09-30
description: A package of small utilities that use the proc file-system
filetags: ":snippets:epubnote:psmisc:proc-file-system-utilities:"
id: a69bf5ac-1fba-4a72-a7eb-c749cb7ce920
title: psmisc proc file system utilities Snippets
---

## List of Utilities

- fuser - Identifies processes using files or sockets
- killall - kills processes by name, e.g. killall -HUP named
- prtstat - prints statistics of a process
- pslog - prints log path(s) of a process
- pstree - shows the currently running processes as a tree
- peekfd - shows the data travelling over a file descriptor

## fuser - identify processes using files or sockets

Source: [Learn "fuser", a little-known Linux workhorse command! -
Veronica Explains -
Youtube](https://www.youtube.com/watch?v=xF8uttDarG0)

Use case: find which processes are using files or sockets you are
interested in, like files on a USB drive you want to eject

Called "F-user"

``` shell

# Check process IDs holding a file/directory
fuser /media/user/my_folder

# Check process IDs, user, access type, and command using a file with verbose (-v)
fuser -v ~/my_file

# Kill process IDs holding a file, good practice is check the processes first with fuser -v
fuser -f ~/my_file

# Check mount point usage (-m or -c)
sudo fuser -m -v /dev/sda1

# Check what is using a port with namespace (-n) and TCP followed by port
fuser -v -n tcp 3000

```

## References

- [psmisc - package contains miscellaneous utilities that use the proc
  file-system - GitLab](https://gitlab.com/psmisc/psmisc)
