---
filetags: ":emacs:shortcuts:dired:epubnote:"
id: 8f08d874-1ec0-4709-b492-dc0d679513a0
title: Emacs Shortcuts for dired
---

## Dired and Search

| Description | Shortcut |
|----|----|
| Fuzzy find file with fd, (Doom Emacs) | `+vertico/consult-fd-or-find` |
| Find a file with pattern, case sensitive (like ***Linux***) | `find-name-dired <pattern like *string*>` |
| Find a file with pattern, case insensitive or other flags | `find-dired` and set flags as needed |
| Grep in directory, by default does not include hidden | `consult-rg` or `counsel-rg` |
| Grep in version controlled files in git | `consult-rg` or `counsel-git-grep` |

### Search File Names and Replace

- Use `find-name-dired` to search for files recursively in a directory
  - Use `*` as a wild card, the search is case sensitive
- or use `find-dired` and use flag `-iname` to search case insensitive
  and/or other find flags
- Use `wdired-change-to-wdired-mode` or `C-c C-e` to edit the results in
  dired and apply with `C-c`
- Use `browse-url-of-dired-file` to open the file in the browser or
  default OS program like on Windows
  - Suggested by
    <https://emacs.stackexchange.com/questions/37088/windows-open-files-by-default-application>

### Search and Replace all in Directory Files

- Grep in directory and got to search results using `projectile-ripgrep`
  - `e` to edit results
  - `m` for `rg-menu` for ripgrep options like search hidden files with
    `--hidden`
  - `query-replace` or `M-%` to make changes
  - apply changes with `C-x C-s` to save or `C-c C-k` to abort

| Description | Shortcut |
|----|----|
| Grep in directory | grep |
| Grep in directory, change search results | grep and search, `C-c C-p` or `wgrep-change-to-wgrep-mode` |
| Grep in directory, change search results save or abort | C-x C-s (save) or C-c C-k |

## Dired and Files Management

| Name                                               | Shortcuts           |
|----------------------------------------------------|---------------------|
| Open dired                                         | C-x d               |
| Open dired in directory with point on current file | C-x C-j             |
| Rename current file (Emacs 29+)                    | rename-visited-file |
| Find file and open or create file                  | C-x C-f             |
| Make Directory                                     | \+                  |

For renaming files under version control, dired will rename them in a
friendly way, for example using `git mv`. This functionality is
controlled by the variable `dired-vc-rename-file` being `t` (true).

### Selection

| Name                           | Shortcuts |
|--------------------------------|-----------|
| Mark file                      | m         |
| Unmark file                    | u         |
| Unmark all files               | U         |
| Mark all files in directory    | \* s      |
| Invert marks in buffer \* t, t |           |
| Mark using RegExp              | % m       |

### File Names

from [Emacs: store music playlists (Dired+Bongo) -
YouTube](https://youtu.be/-qo2Ai3pZRk?t=504) \|

| Name                                     | Shortcuts |
|------------------------------------------|-----------|
| Copy path and file names of marked items | C-0 w     |
| Copy file name at point                  | w         |

### File Operations

| Name | Shortcuts |
|----|----|
| Compress file | c |
| Copy file | S-c |
| Copy filename at point or marked | C-0 w |
| Delete - delete file at point with confirmation | S-d |
| Delete - Execute deletion of marks | x |
| Delete - Mark for deletion | d |
| Execute program on file (e.g. cat) | ! or & |
| Move/rename file | S-r |
| Open, Edit file | RET |
| Open file in other window | o |
| Open file in other window without focusing on it | M-o/RET |
| Open with External Program | dired-do-open or S-w |
| Open with local browser | browse-url-of-dired-file, S-w |
| Preview file | g o and close with q |
| Rename based on RegExp | % R |
| Wdired dired, make dired buffer editable | C-c C-e |

### Changes and Permissions

| Name                             | Shortcuts |
|----------------------------------|-----------|
| Touch (change timestamp of file) | T         |
| Change file mode                 | M         |
| Change file owner                | O         |
| Change file group                | G         |

### Directories

| Name                 | Shortcuts |
|----------------------|-----------|
| Go up one directory  | ^         |
| Create directory     | \+        |
| Create symbolic link | S         |

### Other

| Name | Shortcuts |
|----|----|
| Compress/uncompress | Z |
| Load Emacs Lisp (.el) file into Emacs | L |
| Show/hide/view permission, user, group, space details using dired-hide-details-mode | ( |
