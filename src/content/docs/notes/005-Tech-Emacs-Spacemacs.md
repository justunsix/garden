---
filetags: ":emacs:epubnote:"
id: 3fb19c26-bb2d-426d-b08b-1dd28d050f4d
title: Spacemacs
---

- [Spacemacs](https://www.spacemacs.org/doc/DOCUMENTATION.html)
- [Video Overview of
  Spacemacs](https://www.youtube.com/watch?v=hCNOB5jjtmc&list=PLhqJJNjsQ7KFkMVBunWWzFD8SlH714qm4)

## Configurations

[Details of dotfile
configuration](https://www.spacemacs.org/doc/DOCUMENTATION.html#dotfile-configuration)

- Go to spacemacs configuration file: `M-m f e d`
- Reload spacemacs configuration file: `M-m f e R`
- Default location: `.spacemacs` is in your HOME directory
  - A dot directory `~/.spacemacs.d/` can be used instead of a dotfile
- Custom variables configuration from `M-x customize-group` built-in
  Emacs feature are automatically saved by Emacs at the end of your
  `~/.spacemacs` file
- Layers and personal configurations can be added

### Key Bindings

- Common command prefix: `M-m`
- Reserved prefix command for user: `M-m o`
  - Setting key bindings behind these is guaranteed to never conflict
    with Spacemacs default key bindings
- Switch between windows: `alt-1`, `alt-2`, `alt-3`, `alt-4`, `alt-5`
- Major mode command: `M-m-m`

### Introduction

- Uses layers to combine related packages
- Support VIM key bindings and regular emacs
- Update
  - Spacemacs - will be shown in mode line, use link in home page
  - Packages - use home page link

### Layouts and Workspaces

- [About
  layouts](https://www.spacemacs.org/doc/DOCUMENTATION.html#layouts-and-workspaces)
- Activate layouts manager: `M-m l ?`
- Activate workspaces manager: `M-m l w`
- Create a new layout where \# is the next layout number `M-m l` + \#
  (e.g. 3 if there are 2 layouts already)
- Create a project layout use `M-m p l`
- Layouts commands: `M-x persp...`

### Completion

- Spacemacs uses [Helm](https://github.com/emacs-helm/helm/wiki) by
  default

### Packages

- Use `M-x package-list-packages` to browse packages but use Spacemacs
  layers and upgrade packages to manage them

### Helm Buffers and Files

- Kill buffer: `M-m b d`
- Go to spacemacs home: `M-m b h`
- Browse buffers in transient state: `M-m b .`

[Cursor](https://www.spacemacs.org/doc/DOCUMENTATION.html#neotree-file-tree)
