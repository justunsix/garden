---
filetags: ":snippets:epubnote:worktrunk:git:"
id: 85f7620e-184b-4c79-8157-d1146f0fbfbd
title: Worktrunk Snippets
---

Source: [Worktrunk — Git Worktree Manager for AI Agent
Workflows](https://worktrunk.dev/)

``` shell

# List worktrees with status, with all attributes (--full)
wt list
wt list --full

# Switch to worktree by name
wt switch alpha

# Create and switch to new worktree
wt switch --create api

# Remove a worktree
cd beta
wt remove

# Create a worktree and branch called feature and start a program
wt switch -c -x opencode feature

# Merge to the default branch
wt merge

# Merge to different branch
wt merge develop

# Merge to default branch and keep worktree after merging (--no-remove)
wt merge --no-remove

# Preserve commit history on merge (--no-squash)
wt merge --no-squash

```
