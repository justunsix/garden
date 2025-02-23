---
filetags: ":epubnote:linux:window-manager:i3:"
id: 8fc7c224-8e81-40b7-aace-6fa36a7edcf7
title: i3 Window Manager
---

## User Guide Points

- Base configuration at `/etc/i3/config`
- See resizing bind examples at [i3 config.keycodes -
  GitHub](https://github.com/i3/i3/blob/next/etc/config.keycodes)
- i3 stores all information in a tree:
  - X11 root
    - X11 outputs, dock areas, content container (window and can host 1
      or more container)s
      - Workspaces
        - Windows

## SSH-Agent

ssh-agent should be started and if not, follow [SSH keys -
ArchWiki](https://wiki.archlinux.md/title/SSH_keys#SSH_agents).

- Add SSH keys using `keychain` like

  ``` shell
  eval $(keychain --eval --quiet id_ed25519 id_rsa)
  ```

- Another option is start KeePassXC with SSH Agent integration from the
  terminal where `SSH_AUTH_SOCK` is set like

  ``` shell

  # Start KeePassXC in background
  keepassxc &; disown

  ```

## Configuring Fedora i3 Spin Example

Sources:

- [Rice i3 from scratch! Fedora i3 spin edition -
  YouTube](https://www.youtube.com/watch?v=T8ju0aMDwGw) as of 2022-12
  Fedora 36
- [GitHub - TesterTech/dotfiles: The . files for i3 Fedora
  spin](https://github.com/TesterTech/dotfiles)

See dotfiles in repository above. Notes below show specific
configuration changes.

``` shell

######################
# In ~/.bashrc
######################

# Quick editing
alias bashrc='nvim ~/.bashrc'
alias i3conf='nvim ~/.config/i3/config'

# end of .bashrc
#####################

# Packages
# - polyba: status bar
# - compton:  compositor
# - i3-gaps: i3 with gaps, not required in later version of i3
# - feh: set wallpaper
# - kmix: volume control
# - xlockmore: screen locker
# - neofetch: system info
# - neovim: editor
# - rofi: application launcher
sudo dnf install polybar compton i3-gaps feh kmix xlockmore neofetch neovim rofi

# polybar - etc/polybar/config
polybar example
# Create script to launch polybar
nvim polybar-start.sh

######################
# In polybar-start.sh
######################
#!/bin/bash

killall polybar

polybar example

# end of script
#####################

chmod +x polybar-start.sh
# put in i3 config
./polybar-start.sh

# Edit i3 config
nvim ~/.config/i3/config

# symlink configuration files
ln -s ~/git/dofiles/config/i3/config ~/.config/i3/config
ln -s ~/git/dofiles/config/picom.conf ~/.config/picom/picom.conf

########################
# in ~/.config/i3/config
########################

set $exe exec --no-startup-id

# start terminal
bindsym $mod+Return exec xfce4-terminal
bindsym $mod+d exec firefox

# gaps
gaps inner 10
gaps outer 10

# screen brightness
bindsym XF86MonBrightnessUp exec brightnessctl s +30
bindsym XF86MonBrightnessDown exec brightnessctl s 30-

# autostarts
# start compton in background with specific config file
# when restarting, you will see more shadows
$exe compton -b --config $HOME/.config/picom/picom.conf
# Have feh randomly load wallpapers in specified directory
$exe feh --randomize --bg-fill ~/Pictures/Wallpapers/*
# Start specific layout
$exe $HOME/screen-laptop-layout.sh

# Firefox no title bar
for_window [title="^.*Mozilla Firefox"] border pixel 0
# Can also floating enable and other configurations
# applications with floating windows
for_window [class="pavucontrol"] floating enable; border none

# end of i3 config
#####################

```

## Suggested Packages

Based on [Fedora i3
spin](https://docs.fedoraproject.md/en-US/i3/package-groups/)

i3 (minimal)

These are packages that will be installed by sudo dnf install @i3. It
will include a minimal number of packages to provide a common "base" for
an i3 workstation. Core packages

These packages are required to get i3 working minimally.

i3

i3lock

i3status

dmenu

dunst (notifications)

lightdm (display manager)

Group: @base-x

urxvt (virtual terminal)

Networking

nmcli

network-manager-applet

firefox (web browser)

Audio

pactl

pauvcontrol

volumeicon

Power management

TBD. Miscellaneous

xbrightlight (laptop backlight control)

htop (monitoring system)

azote (wallpaper management)

mousepad (text editor)

thunar (file browsing)

i3-extended

This package group provides a set of extended utilities, applications,
or other useful tools. Some i3 users may prefer or expect these tools in
an installation, but they are not required to use i3. This package group
can improve the user experience of using i3. Menu

rofi

morc

Power management

powertop

Miscellaneous

arandr

conky

i3status-rs

font-awesome

alacritty

tmux

xarchiver

qutebrowser

st (need to choose between alacritty and st)

py3status

nitrogen

lxappearance (GUI theming app)

## See Also

- [i3 Dotfile Config](../005-tech-i3-dotfile-config)
- [i3status.conf Dotfile](../005-tech-i3-dotfile-i3status)
- [i3 Shortcuts](../005-computer-shortcuts-i3)

## Resources

- [i3: i3 User Guide](https://i3wm.md/docs/userguide.html)
