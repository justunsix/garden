---
filetags: ":snippets:epubnote:flatpak:"
id: 8d596332-95f9-4f9a-b7a9-cfe859af98e5
title: Flatpak Snippets
---

Source: TDLR pages for Flatpak

``` shell

# Run an installed application
flatpak run com.example.app

# Install an application from a remote source
flatpak install remote_name com.example.app

# List installed applications, ignoring runtimes
flatpak list --app

# Update all installed applications and runtimes
flatpak update

# Add a remote source
flatpak remote-add --if-not-exists remote_name remote_url

# Remove an installed application
flatpak remove com.example.app

# Remove all unused applications and agree to prompts with -y
flatpak remove --unused -y

# Show information about an installed application
flatpak info com.example.app

```
