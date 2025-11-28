---
filetags: ":linux:terminal:tmux:epubnote:"
id: 82ff7f83-77f0-434a-a2b6-dc066577a8ea
title: Terminal tmux
---

## Basic Tmux, Tmux package manager, and sane default configuration

Source: [Tmux has forever changed the way I write code. -
YouTube](https://www.youtube.com/watch?v=DzNmUNvnB04) - Dreams of Code

### Requirements

``` shell

# Install tmux with Nix
nix-env -iA nixpkgs.tmux

# Set up tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Set up sane default configuration in $HOME/.config/tmux/tmux.conf

# In tmux session, press prefix + I to install plugins per conf file

```

## Learn tmux to Boost Linux Productivity

Source: [Learn tmux (Part 1) Boost your Linux Productivity with this
5-part Course! - Learn Linux TV -
YouTube](https://www.youtube.com/watch?v=UxbiDtEXuxg)

- Sessions in tmux persist even after you close the terminal/ssh
  connections and can be re-attached later

## Practical tmux: A How-To Guide Beyond the Basics

Source: [Practical tmux: A How-To Guide Beyond the Basics -
YouTube](https://www.youtube.com/watch?v=RmSvKKmLjGU)

- Manage sessions, like using for project, can change session path with
  loading direnv
- Change repos
