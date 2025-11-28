---
filetags: ":dolphin:file-manager:file:kde:epubnote:"
id: 9e619ede-8853-4aab-b4c2-469567e8ea7e
title: Dolphin File Manager (KDE)
---

Dolphin is KDE Plasma's default file manager and focuses only on file
management. Dolphin is not intended to replace Konqueror as Konqueror
remains a universal viewer.

## User Interface

UI can be customized with `Configure Toolbars...` from context menu.

### UI Elements

- Location bar - path
  - Bread crumb mode shows each folder name in the path to the current
    folder
  - Path can be edited
  - Kioslaves
    - Use an empty location bar (delete the path) can be used to open a
      kioslave built into KDE like fish for remote SHH, FTP, NFS, SFTP,
      SMB or webdav
  - If Places is hidden, an additional home icon appears next to the
    location allowing navigation of Places and media
- View - files and folders
  - Open files (enter, double click)
  - Context menu for files
  - Drag and drop files
  - Toolbar can configure appearance of view
    - Icons (default) - files represented by icons of file type
    - Compact - items grouped in columns with icons
    - Details - list with name, size, modification time
      - More columns can be added by right clicking on columns
      - Folders are *expandable folders* which allow expanded and
        collapsed states visible with `>` and `v` icons
  - Preview - if enabled (Configure Dolphin \> General \> Previews by
    type), icons are based on actual file / folder contents like images
    previews
  - Split - two views are shown to display contents of different folders
    - Useful for moving/copying files between folders
  - Selected items:
    - Cut
    - Copy
    - Delete (move to trash)
    - `Ctrl` click to select multiple items
    - `Shift` click to select range of items
- Places - bookmarked locations, disks, media, recent items
- Status bar - file metadata like name, size, type
- Menu bar
  - File, edit, view, navigation, tools commands
- Other panels: Information (F11), Folders (F7), and Terminal (F4) – are
  hidden by default and can be activated
  - Information - extended information / preview of folder or file
  - Folders - Tree view structure of the file system, can be limited to
    your *home* folder
  - Terminal - Konsole, current working directory will update as
    Dolphin's active view changes directories.

## Tips

- `Add to Places` by right click on a file/folder
- Filtering files using filter bar
  - Like .mp3 to see only music files
- Search for files
  - Search is case insensitive and does not require surrounding
    wildcards
  - `*` will match zero or more characters, `?` only one single
    character.
  - Can be used with Baloo services, without a KIOSlave is used
- Mount storage media - use Places panel
- Batch rename files:
  - Select files
  - Press `F2` or use menu: File \> Rename
    - Enter name plus `#` character where the `#` character will be
      replaced by a consecutive number when renamed. `#` is not required
      if files have different extensions
- If Kompare application is installed, it can be used to compare
  differences in two files/folders

## Settings

- Run Qt5 Setings `qt5ct` and set theme to Adwaita-dark and set fonts to
  Cantarell 12, set icon theme to Adwaita
- Make sure to set export QT<sub>QPAPLATFORMTHEME</sub>="qt5ct"

### Run Dark theme on Windows

- Use [KDEglobals and
  dolphinrcfile](https://github.com/justunsix/dotfiles) and copy to
  C:\\USER\>
- Download binary from
  [https://cdn.kde.org/ci-builds/system/dolphin/master/windows/](https://cdn.kde.org/ci-builds/system/dolphin/master/windows/)
  or use [Scoop install](https://scoop.sh/#/apps?q=dolphin+file).

1.  Archived Methods

    - Run Dolphin per <https://github.com/Bleskocvok/dolpwin-dark>
      - <https://superuser.com/questions/1667509/dolphin-file-manager-on-windows-dark-theme>
      - Use darkstyle.qss in dotfiles-overlay, copied from
        <https://github.com/ColinDuquesnoy/QDarkStyleSheet/blob/master/qdarkstyle/dark/darkstyle.qss>
        and
        [https://discuss.kde.org/t/dark-mode-workarround-for-dolphin-on-windows/7482](https://discuss.kde.org/t/dark-mode-workarround-for-dolphin-on-windows/7482)
    - 2024-04-16: During testing, Dolphin [with my kdeglobals and
      dolphinrc](https://github.com/justunsix/dotfiles) worked out of
      box in dark mode using:
      dolphin-master-3966-windows-cl-msvc2022-x86<sub>64</sub>.7z from
      [https://cdn.kde.org/ci-builds/system/dolphin/master/windows/dolphin-master-3/garden/notes/966-windows-cl-msvc2022-x86_64.7z](https://cdn.kde/ci-builds/system/dolphin/master/windows/dolphin-master-3966-windows-cl-msvc2022-x86_64.7z)
      - Remove all files to replicate:
        - C:
        - "C:<sub>dolphindolphin</sub>"
        - "C:"

    ``` powershell

    # Start Dolphin with Stylesheet on Windows
    dolphin --stylesheet darkstyle.qss &
    dolphin --stylesheet C:\Users\justi\Code\dotfiles-overlay\other\blue.qss &

    # or in Windows Powershell with persistent process
    Start-Job -ScriptBlock { dolphin --stylesheet darkstyle.qss & }
    Start-Job -ScriptBlock { dolphin --stylesheet C:\Users\justi\Code\dotfiles-overlay\other\blue.qss }

    ```

    - Switch to compact mode to get rid of alternate colour lines

### Dolphin Settings Example

Configured in dotfiles `dolphinrc`

- Choose details mode, zoom to make icons small
- Settings \> Configure Dolphin
  - General
    - Sorting mode: Alphabetical, case insensitive
    - Miscellaneous:
      - \[x\] Switch between split views panes with tab key
      - \[unchecked\] Turning off split view closes active pane
      - \[x\] Show tooltips
  - Startup
    - \[x\] Show full path inside location bar
    - \[x\] Show full path in title bar
- View \> Adjust display style
  - \[x\] Show hidden files
  - \[x\] Show hidden files last

## Configuring Dolphin

Two kinds of settings:

- Settings that affect general behaviour of Dolphin using the
  `Preferences Dialog`. Opened using Settings \> Configure Dolphin
- Settings that determine how contents of a folder are displayed.
  Controlled with toolbar buttons and `View` menu and
  `View Display Style dialog`.
  - Display styles can be configured in General section of settings.

### Settings \> Configure Dolphin

Things like

- View modes for all or specific folders
- Sorting
- Keys
- View interactions (tooltips, rename, splitting)
- Previews
- Status bar
- Startup options affecting appearance
- Actions submenu
- Trash

### Folder View Display Style

View \> Adjust View Display Style

Change settings like:

- View mode
- Sorting
- Previews
- Grouping
- Hidden files

## See Also

- [Dolphin Shortcuts](/garden/notes/005-computer-shortcuts-dolphin) - [Dolphin
  Shortcuts](id:87c1a54e-8b05-42fa-b62d-a40fb869eddf)

### Resources

- [Dolphin KDE User base with links to
  Handbook](https://userbase.kde.org/index.php?title=Dolphin/en) - source
  of material in this note
