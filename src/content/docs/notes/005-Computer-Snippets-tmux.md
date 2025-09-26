---
filetags: ":tmux:snippets:linux:terminal:epubnote:"
id: 65e276bc-3efb-403c-a0fd-7e92905daa83
title: tmux Snippets
---

# Snippets

``` shell

# New session
tmux new -s session_name

# New session, create
tmux new

# List active sessions
tmux ls

# Attach to session, attaches to most recent one
tmux attach

# Attach to session by name
tmux attach -t session_name
# Attach to session by number
tmux a -t <number>

# Rename a tmux session
tmux rename-session -t 0 session_name

# Rename current tmux session
tmux rename-session new_session_name

# Change title of current pane
tmux select-pane -T title1

# Source tmux config after changes
tmux source ~/.config/tmux/tmux.conf
## or in tmux
## prefix + :source-file ~/.config/tmux/tmux.conf
## prefix + I

# Show every session, window, pane, and others
tmux info

```
