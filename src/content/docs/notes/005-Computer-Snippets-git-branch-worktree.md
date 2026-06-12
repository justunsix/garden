---
date: 2026-05-26
filetags: ":snippets:epubnote:git:branch:worktree:"
id: 283b38d2-6efb-4f94-9150-3cd469615fbc
title: git branch and worktree Snippets
---

``` shell

# Create a new branch
git checkout -b new-branch-name
# make changes to new-branch-name
# Merge changes to main branch
git checkout main
git merge new-branch-name

# Checkout an existing branch
git checkout my-branch

# List all git branches, local, and remotes in current repository
git branch -a

# Create new branch and push to origin
git checkout -b feature1
git push origin feature1

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

```

## Branching and Merging

Source: [Git - Basic Branching and
Merging](https://git-scm.com/book/en/v2/Git-Branching-Basic-Branching-and-Merging)

``` shell

# Run visual tool to help with merges
git mergetool

```

### Options for Keeping Feature Branches Up-To-Date with Main

Source: [Best Practices for Keeping Feature Branches Up-To-Date with
Main · community
GitHub](https://github.com.mds/community/discussions/161932#discussioncomment-13394840)

Generally, use rebase option for small teams and merge option for large
teams.

#### Rebase

Pros:

- Clean, linear commit history, making it easier to read and review.
- Avoids merge commits, which can clutter the history.
- Preferred for small teams or solo developers who value a tidy Git log.

Cons:

- Complex if multiple developers are working on the same branch, as
  rebasing rewrites history and requires coordination.
- Conflicts must be resolved all at once during the rebase, which can be
  time-consuming for long-lived branches.

``` shell
# Ensure you're on your feature branch
git checkout feature-branch
# Fetch the latest main branch
git fetch origin
# Rebase feature branch onto main
git rebase origin/main
## Identify conflicts during rebase
git status
## Make changes and continue
git rebase --contiue
```

#### Merge

Pros:

- Safer for collaborative branches, as it doesn’t rewrite history.
- Easier to understand for teams new to Git.
- Preserves the context of when and why main was integrated.

Cons:

- Creates merge commits, which can make the history less clean.
- Can lead to a tangled Git graph if merges are frequent.

``` shell

# Ensure you're on your feature branch
git checkout feature-branch
# Fetch the latest main branch
git fetch origin
# Merge main into your branch
git merge origin/main
# Push the updated branch
git push origin feature-branch

# Merge conflicts manualy
git add <resolved-file>
git commit

```

## Worktrees - git worktree

Git worktrees help with manage multiple working trees and it is easier
to keep track of separate branches. See [Worktrunk
Snippets](/garden/notes/005-computer-snippets-worktrunk) - [Worktrunk
Snippets](id:85f7620e-184b-4c79-8157-d1146f0fbfbd) for command to
simplify management of worktrees.

They are like managing a git branch as a separate directory or manually
git cloning a repository to a separate directory and changing the
working branch of that repository.

``` shell

# Create a new branch whose name is the final part of the command; add a new worktree with a feature branch
git worktree add ../myrepo-newfeature new-feature
## Example
## /bubbles is [master]
## /bubbles-table is branch [use-lipgloss-table]

# Create new worktree with existing branch main
git worktree add ../repo-main main

# Example workflow with these branches:
# - main
# - pull request review
# - feature development
git clone myrepo.git # main
cd myrepo
git worktree add ../myrepo-feature feature_branch
git worktree add ../myrepo-pr pull_request_numbered_branch

# If you want to make experimental changes or do testing without disturbing development,
# it is often convenient to create a throwaway worktree not associated with any branch.
# Creates a new worktree with a detached HEAD at the same commit as the current branch example
git worktree add -d ../repo-experimental

# List work trees, their location, and checked out branches
git worktree list

# Remove a worktree
git worktree remove worktree-name

# Merge a worktree changes to main branch
git checkout main
git merge worktree-branch
git worktree remove worktree-branch

```

Example worktree workflow from [Stop Using Git Worktrees - DevOps
Toolbox, YouTube](https://www.youtube.com/watch?v=WBQiqr6LevQ)

``` shell

# Create a folder to contain worktrees of a repository
git clone --bare https://my.repository/repo2 repo2
## Add main branch as a subfolder in repo2
git worktree add main
# Create a new branch and push to origin
git checkout -b feature1
git push origin feature1
## Add feature1 branch as a subfolder in repo2
git worktree add ../feature1
## List worktrees
git worktree list
## Do work in feature1 and then merge it to main and remove it
cd main
git merge feature1
git worktree remove feature1
git branch -d feature1

```
