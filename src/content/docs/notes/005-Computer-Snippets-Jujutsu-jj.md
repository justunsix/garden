---
date: 2026-07-07
filetags: ":snippets:epubnote:jujutsu:jj:git:version-control:vcs:"
id: 239e3c3d-41de-4590-94c5-5ee81753c3e5
title: Jujutsu jj Snippets
---

``` shell

# Initialize or clone existing repository with git backend
jj git init
jj git clone repository_location

# View recent history of repository
jj

# Create new change
jj new
## Create new change with readme
jj new myname

# Describe changes
jj describe -m "feat(readme): add"

# Fetch changes
jj git fetch

# Edit change
jj edit

# Edit change by change id, can be non-commited changes
jj edit change_id

# Create new change and commit it
jj commit -m "feat(readme): add"

# Squash changes interactively and select relevant changes with change id called
jj squash --interactive --into change_id

# Describe specific change using change id
jj describe change_id -m "feat(readme): fix spelling"

# Split change
jj split --interactive change_id -m "feat(database): scripts"

# Abandon (discard) change
jj abandon change_id1

# Undo change
jj undo

# Add remote
jj git remove add orgin git@url

# Create bookmark (like git branch) with -r or --revisions (revision set or revset)
jj bookmark create main -r h
jj bookmark track main --remote=origin
## Create bookmark bar with revset at current change set of @'s previous 1 change
## Current change @ is empty
## @- are all changes in your current change set
jj bookmark create bar -r @-
## Create bookmark at current working set @
jj bookmark create workset -r @

# Push to remote
jj git push --remote origin
jj git push

# Log of changes
jj log

# Status of changes
jj status
jj st

# Difference of change
jj diff

# Resolve conflict at file
jj resolve src/file_with_conflict.c

# Check conflicts
jj resolve

```
