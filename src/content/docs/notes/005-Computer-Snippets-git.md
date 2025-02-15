---
filetags: ":git:gitops:tech:snippets:epubnote:"
id: 95f66412-2bb4-49f7-aed1-c05f0057798c
title: Git Snippets
---

``` bash

# Create a new branch
git checkout -b new-branch-name
# make changes to new-branch-name
# Merge changes to main branch
git checkout main
git merge new-branch-name

# List all git branches, local, and remotes in current repository
git branch -a

# Check differences between local "main" branch and remote
git diff main remotes/origin/HEAD

# List branches
git branch -a -v

# Switch to git (remote) branch named "Release_3.0"
git switch Release_3.0

# Remove temporary branch named "list"
git branch -d list

# Go back to last branch
git checkout -

# Show git commit history of specified file
git log -p -- <filename>

# Browse repository and log
tig

# Show, viewing an old version of a file
git show <commit-hash>:<path-to-file>
# View old version of a file example
git show 3a6e7b9:src/main.js

# Find string pattern in repository files
git grep string
# or
# -n : show line number
git grep -n "string pattern"

# Windows git bash
## Graphical User Interfaces
git gui
gitk

# Add all directories as safe directories
## bash, nu
git config --global --add safe.directory '*'
## PowerShell
git config --global --add safe.directory *

# Git worktrees - manage multiple working trees
## Like managing a git branch as a separate directory
## Like manually git cloning a repo to a separate directory and changing the working branch of that repo
## Easier to keep track of separate branches

# Create a new branch whose name is the final part of the path
git worktree add <path>
## Example
## /bubbles is [master]
## /bubbles-table is branch [use-lipgloss-table]

# Create new worktree with existing branch example
git worktree add ../repo-main main

# If you want to make experimental changes or do testing without disturbing development,
# it is often convenient to create a throwaway worktree not associated with any branch.
# Creates a new worktree with a detached HEAD at the same commit as the current branch example
git worktree add -d ../repo-experimental

# List work trees
git-worktree list

# Remove a worktree
git worktree remove <worktree-name>

# Tagging
git tag -a v1.0 -m "pre digital garden"

```

## Create a new repository

``` shell

#1: Create a folder for this project on your local hard drive
$ mkdir my-project

#2: change into this folder
$ cd my-project

#3: initialize a new, empty Git repository here
$ git init

...after having written some code + created some files...
#4: add all changes to the next (= first) commit
$ git add .

#5: create this first commit
$ git commit -m "Initial commit"

# git command and add files
git commit -am"message"

```

## Create a local repository for backup and synchronization

Source:
<https://stackoverflow.com/questions/10603671/how-to-add-a-local-repo-and-treat-it-as-a-remote-repo>

``` shell

git init --bare ~/repos/myproject.git
cd /path/to/existing/repo
git remote add origin ~/repos/myproject.git
git push origin master

```

## Reset, Revert Changes

``` shell


# "Reset repository to the latest remote
git fetch origin
git reset --hard origin/master
# This example assumes that the remote repo’s name is “origin” and that
# the branch named “master”, ​in the remote repo, matches the currently
# checked-out branch in your local repo.

## From https://stackoverflow.com/questions/1146973/how-do-i-revert-all-local-changes-in-git-managed-project-to-previous-state
## Revert Local Changes
### To revert changes made to your working copy, do this:
git checkout .
### or
git restore .

### To revert changes made to the index (i.e., that you have added), do this. Warning this will reset all
### of your unpushed commits to master
git reset

### To revert a change that you have committed:
git revert <commit 1> <commit 2>

### To remove untracked files (e.g., new files, generated files):
git clean -df

### Or untracked directories (e.g., new or automatically generated directories):
git clean -fd

# Remove files from git and index
git rm -r files

# Remove git tracking from root of repository
rm -rf .git

```

## Remove passwords and sensitive information from a git repository

Follow steps in [The Easiest Way To Remove Checked In Credentials From A
Git
Repo](https://deshpandetanmay.medium.com/the-easiest-way-to-remove-checked-in-credentials-from-a-git-repo-704a373b94e3)
using the [BFG tool](https://rtyley.github.io/bfg-repo-cleaner/)

Example, remove passwords or sensitive information

``` bash
# Get BFG jar and make sure Java is installed

# Remove passwords and sensitivte information from the repository and commit it

# In a temporary directory, copy the JAR and create a new file called password.txt to store sensitive information you want to remove from the git repo and its
history

# Make a copy of your repo
git clone https://.../myrepo.git

# Change repo history
java -jar bfg-1.14.0.jar --replace-text passwords.txt myrepo

# Push changes
git reflog expire --expire=now --all && git gc --prune=now --aggressive
git push --all --force
```

## Import an existing git project into a new repository on GitHub

Follow [GitHub instructions on importing a new
project](https://docs.github.com/en/github/importing-your-projects-to-github/importing-source-code-to-github/adding-an-existing-project-to-github-using-the-command-line).

Variations to commands are in this example:

``` bash
# Copy GitHub url of new repository and use it in the following command
# Run in existing repository root directory
git remote add main2 https://github.com/justunsix/olympic-app-go.git
# Check existing remotes
git remote -v
# Push the 'main' branch or whichever branch you want to push to the new repository. 'main2' is the remote branch
git push main2 main
```

## Reset and Set Git Proxy

For information from proxy

You may be prompted with a user/password when running git commands,
enter your proxy credentials

``` bash

# Set git proxy
git config --global https.proxy https://1.1.1.1:3128
git config --global http.proxy http://1.1.1.1:3128

# Reset git proxy
git config --global --unset https.proxy
git config --global --unset http.proxy
git config --unset https.proxy
```

## See Also

- [Technology](600-Technology.md) -
  [Technology](id:9092eabf-f6f5-4775-b8aa-6e78e74880c3)
- [GitHub](005-Computer-Tech-GitHub.md) -
  [GitHub](id:7780cbb0-5092-4233-8f80-bb90864828f9)
