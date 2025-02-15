---
filetags: ":scoop:windows:package-manager:epubnote:"
id: fed06507-bb32-40a4-90c3-a490d2f0302f
title: Scoop Windows Package Manager Snippets
---

``` powershell

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
