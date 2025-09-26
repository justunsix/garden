---
filetags: ":emacs:doom:epubnote:"
id: 86755b7e-1580-414e-af76-161b8cb1a9b6
title: Doom Emacs
---

## Learning Doom Emacs

Sources:

- [DistroTube Doom Emacs
  Videos](https://www.youtube.com/@DistroTube/search?query=doom%20emacs)
  (mostly top 20 videos)
  - [x] What Are The Benefits Of Emacs Over Vim?
- [Emacs Doom Screencasts by Zaiste
  Programming](https://www.youtube.com/watch?v=rCMh7srOqvw&list=PLhXZp00uXBk4np17N39WvB80zgxlZfVwj)
  (select videos you don't know about)

## Doom Emacs On Day One (Learn These Things FIRST)

Source: <https://www.youtube.com/watch?v=37H7bD-G7nE>

- Emacs Daemon, Server

  - Can add start up on desktop startup:
    - Look for Start up applications
    - Add example /usr/bin/emacs –daemon
    - Restart session
  - Launch emacsclient -c -a 'emacs'
  - Launching emacsclient easier:
    - In shell: alias emacs=emacsclient -c -a 'emacs'
    - In desktop: add emacsclient.desktop

- Open / find files

  - Can use vim way with :e \<file\> with tab completion
  - Use find-file or SPC .
  - Find recent files: SPC f r

- Split screen:

  - Evil: split - C-w v, return to other split - C-w w
  - Doom: vertical split - SPC w v, close - SPC w c, other split - SPC w
    w

- Kill buffer: SPC b k

- Spelling and Languages support in Doom: `init.el`

- Reload Doom configurations after init.el changes: `doom-reload` or
  SPC-h-r-r

- Configurations in Doom: `config.el`

  - Add packages

- Buffer management and switching

  - ibuffer: SPC-b-i
  - switch buffer: SPC-\<

- dired file manager

- Terminals: recommend using - vterm or eshell

## Installing Doom Emacs

``` shell

# Install Doom
cd ~/.config
git clone https://github.com/doomemacs/doomemacs.git emacs
cd ~/.config/emacs/bin/
doom install

# Start Emacs from Doom configuration
emacs 
## or
emacs --init-directory ~/.config/emacs

### Other Commands

# Upgrade
doom upgrade
# Upgrade only your packages
doom upgrade --packages
# Build after Emacs version upgrades
doom build
# Check health of Doom and dependencies
doom doctor

```
