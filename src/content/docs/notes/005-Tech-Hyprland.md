---
id: 16c1c5c3-e648-48cf-83d5-3a082ce363a5
title: Hyprland
---

\#:filetags: :hyprland:epubnote:

## Using Hyprland using Distrobox Experiment

``` shell

distrobox create --name arch --image docker.io/archlinux:latest
distrobox enter arch

# Inside Container
sudo pacman -Syu hyprland

# Nvidia troubleshooting
## https://wiki.hyprland.org/Nvidia/
sudo pacman -Syu nvidia nvidia-utils egl-wayland
## Go through further steps on above link

cp /usr/share/wayland-sessions/hyprland.desktop ~/usr/temp

distrobox-export --bin /usr/sbin/Hyprland

sudo cp ~/usr/temp/hyprland.desktop /usr/share/wayland-sessions/

```
