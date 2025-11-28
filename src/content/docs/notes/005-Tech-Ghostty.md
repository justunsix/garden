---
filetags: ":ghostty:terminal:epubnote:"
id: 8b558f51-6c91-44e6-8161-6b9db2eb24a2
title: Ghostty Terminal Emulator
---

## We ain't afraid of no Ghostty 2024-12-18

Source: [Changlog Interview Episode 622, We ain't afraid of no
Ghostty](https://changelog.com/podcast/622)

Summary: Describes Ghostty, the terminal emulator, and it's vision and
terminal as a platform.

- Side project motivations for Mitchell: desire to work on desktop,
  programming, GPU enabled

- Idea: Terminals are conceptually like web browsers

  - Web browser = mainstream GUI ecosystem
  - There is a place for text based interfaces - terminal is the
    platform
    - Terminal could be an exciting if it gets more features

- Terminal as a platform, terminal user interface (TUI)

  - Ask users what draws them to use a non-terminal applications
    - Examples:
      - Drag and drop files
      - Native tabs
      - Use native file explorer
      - Need browser, maybe TUI can have a browser widget

### Ghostty vision: best terminal emulator experience because

- Fast
  - How fast text can go through terminal, example cat file, tail logs
  - How fast key press to terminal feedback / display
  - Frame rate, example scrolling
- Cross platform
  - macOS: SwiftUI
    - Metal
  - Linux: GTK
    - OpenGL
  - Windows: in progress
- Native
  - Instructions to make read/processing, rendering fast
- Features
  - Ligature support
  - Support modern terminal features in version 1.0
  - Multiplexer support
    - Issue: tmux can conflict with terminal's graphics protocols
    - Would be nice to have multiplexer features inside the terminal
      itself
      - Example: Host ghostty and connect in VPN like tailscale to other
        machines with sessions saved with terminal
  - Can reuse libghostty as UI integration, core
  - Look to cross platform web browsers for good features
  - Quick terminal (drop down terminal)
  - Terminal inspector
    - Will help people debug terminal applications

### Discussion

- Discord and GitHub is active for a young project
  - Insight is many young people are interested in terminal
- Project is discussing governance, project sustainability, financing
  (pay infrastructure, contributors)
- Why Zig language?
  - Low level systems languages like C
    - Personal choice, had thought about rust
  - Community
  - No garbage collector
  - Zig contributions
    - Compiler contributions
    - Zig real world use case
- Hard stuff?
  - Font rendering
- Config
  - Config file naming and CLI argument keys are same names
    - File format is fast to parse
  - Constraints in software can be good
  - Defaults:
    - Font: Jetbrains Mono with emojis packaged

## Install on Ubuntu Linux

### Arch Linux Distrobox as of 2025-01-11

- Use Distrobox and podman
- Use archlinux:latest image from docker.io
- Install ghostty with pacman
- Expose ghostty to host

``` shell

sudo apt-get update
sudo apt-get -y install podman

# Set up distrobox for running ghostty
# Specify container repository
distrobox create -n arch --image docker.io/archlinux:latest
distrobox enter arch

sudo pacman -Syu ghostty --noconfirm

# Export ghostty for use on host
distrobox-export --app ghostty
# Exit container and run ghostty

```

When running ghostty inside the container, it will only have access to
user's programs local those in .local/bin and nix, but not those
installed on host like apt programs.

### Build from source using Nix as of 2024-12-28

1.  Nix-shell

    ``` shell

    nix-shell
    # Build binary to $HOME/.local/bin
    zig build -p $HOME/.local -Doptimize=ReleaseFast

    # Logout, then launch ghostty from app launcher

    ## Uninstall ghostty from zig build above
    rm -rf $HOME/.local/bin/ghostty
    rm -rf $HOME/.local/share/ghostty
    rm -rf $HOME/.local/state/ghostty
    rm -rf $HOME/.local/share/man/man1/ghostty.1
    rm -rf $HOME/.local/share/man/man5/ghostty.5
    rm -rf $HOME/.local/share/terminfo/ghostty.*
    ## Reboot or logout

    ```

2.  Nix only (has issues)

    ``` shell

    git clone https://github.com/ghostty-org/ghostty.git

    cd ghostty

    # Build using nix and enable experimental features
    nix build .#ghostty --extra-experimental-features 'nix-command flakes'
    ## Agree to prompts
    # Run ghostty
    ./result/bin/ghostty

    # If EGL problems, use nixGL - required for non-NixOS Ghostty
    # or home-manager installed ghostty
    # per https://github.com/nix-community/nixGL
    nix run --impure github:nix-community/nixGL --extra-experimental-features 'nix-command flakes' -- ./result/bin/ghostty

    ```
