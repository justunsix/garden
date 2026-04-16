---
filetags: ":vscode:settings:epubnote:"
id: 59a60588-a161-4243-8696-1e361454067a
title: VS Code - Local App Settings
---

## Extensions

- See [example
  dotfiles](https://github.com/justunsix/dotfiles/tree/main/.config/Code/User)
  for workspace settings
- Sign into GitHub for easier synchronization across machines.

## VS Code on Linux Spelling

- For
  [Spellright](https://marketplace.visualstudio.com/items?itemName=ban.spellright),
  follow Linux dictionary installation

On most Linux distributions system-wide dictionaries can be reused (for
now only UTF-8 encoded dictionaries are supported, verify SET line in
\*.aff file) by soft linking the system folder e.g.:

``` shell

# Linux specific hunspell configuration
ln -s /usr/share/hunspell/* ~/.config/Code/Dictionaries
# Ensure spellright.suggestionsInHints is false in settings due to slower suggestions

```
