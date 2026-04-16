---
date: 2026-04-09
filetags: ":snippets:epubnote:zellij:terminal:cli:"
id: 17e6686e-93a5-4c52-81b6-5b0a250d4331
title: Zellij Snippets
---

Source: [Introduction - Zellij User
Guide](https://zellij.dev/documentation/)

``` shell

# Start with minimal user interface
zellij --layout compact

# Start with simplified UI and less special characters
zellij options --simplified-ui true

# Start a new session with name
zellij --session | -s myname

# Attach to session
zellij attach | a [session-name]

# List sessions
zellij list-sessions | ls

# Kill sessions
zellij kill-sessions | k

# Kill all sessions
zellij kill-all-sessions | ka

# Start with default config
zellij setup --clean

```
