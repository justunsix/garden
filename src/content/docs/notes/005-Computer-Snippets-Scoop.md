---
filetags: ":scoop:windows:package-manager:epubnote:"
id: fed06507-bb32-40a4-90c3-a490d2f0302f
title: Scoop Windows Package Manager Snippets
---

``` powershell

# Install a program
scoop install git

# Update all programs
scoop update -a

# Add extras bucket
scoop bucket add extras

# Set proxy
scoop config proxy 2.3.4.5:3128

# Uninstall a program
scoop uninstall <program>
# Uninstall and delete all persistent data
# Can use -p or --purge option
scoop uninstall -p <program>

# Clean packages
scoop cleanup *

# Install multiple packages at once
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser; Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression ; scoop bucket add extras ; scoop bucket add nerd-fonts ; scoop install 7zip autohotkey bat clink deno diff-so-fancy duf dust eza fd firefox fzf git go grep gron imagemagick JetBrainsMono-NF jq lazygit lua make neovim nodejs nomino pnpm poppler python qbittorrent ripgrep s sd sharex wezterm yazi zig zoxide jid yq doggo gping
# Command that will automatically install Scoop and every single package that might be used
# source: Windows 11 dotfiles by https://github.com/nikitarevenco/dotfiles

```

\>

## Installing and using scoop

On Windows, install tools using [Scoop](https://scoop.sh/). Run the
command line installer using instructions from scoop. No administrative
rights are needed.

After `scoop` is installed, search for programs you want to use at
[Scoop](https://scoop.sh/), then on command line, using the `scoop`
command to install them.

For example, to install `git`, VS Code, and Figma:

``` powershell
# Add extras bucket to scoop which has more programs
scoop bucket add extras
scoop install extras/vscode git figma
```

For example, install `nodejs` long term support version and `python`
latest version:

``` powershell
scoop install nodejs-lts python
```
