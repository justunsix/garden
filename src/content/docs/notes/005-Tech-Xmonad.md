---
filetags: ":linux:window-manager:epubnote:"
id: 28926191-026e-4011-a51e-739713d8a0cb
title: XMonad
---

## Sources

- [Getting Started With Xmonad -
  YouTube](https://www.youtube.com/watch?v=3noK4GTmyMw) Distro Tube
  - [.config/xmonad - Derek Taylor Dotfiles at
    GitLab](https://gitlab.com/dwt1/dotfiles/-/tree/master/.config/xmonad)
- [Xmonad - HaskellWiki](https://wiki.haskell.org/Xmonad)

## Shortcuts

### Default

mod = configured mod key, default is alt, commonly remapped to Super
(Windows) key

| Description               | Shortcut            |
|---------------------------|---------------------|
| Open Terminal             | mod + Shift + Enter |
| Open DMenu (Command run)  | mod + p             |
| Close Window              | mod + Shift + c     |
| Restart Xmonad            | mod + q             |
| Change Window focus       | mod + j/K           |
| Change configured layouts | mod + Space         |
| Exit Xonmad (logout)      | mod + Shift + q     |

## Installation

On Ubuntu using APT and on Fedora using DNF

``` shell

# Install:
# - Window manager: xmonad
#   - Will include Haskell and Haskell compiler
# - xterm: default terminal
# - Module manager: xmonad-contrib (Arch), libghc-xmonad-contrib-dev (Ubuntu)
# - DMenu: command runner
# - xmobar: status bar
sudo apt install xmonad libghc-xmonad-contrib-dev xterm dmenu xmobar

# Fedora:
sudo dnf install xmonad ghc-xmonad-contrib-devel xterm dmenu xmobar
# Fedora workaround to usr/lib/rpm/redhat/redhat-annobin-cc1 no such file error during gcc
sudo dnf install redhat-rpm-config

# Logout to log into Xmonad

```

### Configuration

- Check example configurations at [Xmonad/Config archive -
  HaskellWiki](https://wiki.haskell.org/Xmonad/Config_archive).
- On errors in the configuration, Xmonad will display errors for you

``` shell

# Set up base config in Haskell
# Download xmonad.hs from Haskell wiki
mv xmonad.hs ~/.xmonad/xmonad.hs
cp /usr/share/doc/xmobar/examples/xmobar.config ~/.config/xmobar/xmobarrc

```

- Example changes and add comments:
  - Imports
  - Terminal, change terminal program
  - Mod key (default is alt), you will likely want to change to
    `mod4Mask` to change it to Super (Windows) key
  - Focused/no focused border
  - Key / mouse bindings
  - Windows rules
    - Floating (non-tiled)
    - Tiled
  - Startup: `myStartupHook`
    - Programs to always start like wallpaper, transparency, compositor
    - Define shell commands to execute
    - Example

1.  Example xmonad.hs

    ``` haskell

    -- Manage docks like gnome panel, xmobar
    -- https://hackage.haskell.org/package/xmonad-contrib-0.17.1/docs/XMonad-Hooks-ManageDocks.html
    import XMonad.Hooks.ManagerDocks
    import XMonad.Util.Run
    import XMonad.Util.SpawnOnce

    myTerminal     = "gnome-terminal"
    -- ...
    myStartupHook = do
    -- wallpaper
    spawnOnce "nitrogen --restore &"

    -- Allow xmobar to display above windws
    myLayout = avoidStruts (tall ||| mirror tall ||| full)
    -- ...

    main = do
    -- Launch xmobar on first monitor (0)
    xmproc <- spawnPipe "xmobar -x 0 ~/.config/xmobar/xmobar.config"
    -- Other monitors can have different xmobar configs
    -- xmproc1 <- spawnPipe "xmobar -x 1 ~/.config/xmobar/xmobar1.config"
    -- xmproc2 <- spawnPipe "xmobar -x 2 ~/.config/xmobar/xmobar2.config"
    xmonad $ docks def
    ```

2.  Example xmobar.config

    `killall xmobar` and restart xmonad after changes to xmobar config

    ``` txt

    Confit { font = "xft:Ubuntu Mono:pixelsize=16:antialias=true:hinting=true"
        ...

    ```
