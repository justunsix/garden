---
filetags: ":emacs:package:magit:epubnote:"
id: f9107e82-4d3f-4198-a00d-f653096b9ebd
title: "Emacs Package: Magit"
---

## Introduction

- [Introduction to the Ultimate Git Interface,
  Magit](https://www.youtube.com/watch?v=_zfvQkJsYwI)
- [Boosting your Magit
  flow](https://www.youtube.com/watch?v=qPfJoeQCIvA)

User-friendly interface for Git source control tool for many operations
like:

- Creating and amending commits
- Managing and merging branches
- Pulling from and pushing to remotes
- Reading commit logs and "blaming" source files
- Cherry—picking
- Rebasing
- Using the reflog

### Installation

Not required when using Spacemacs

``` elisp
(use-package magit
  :ensure
```

## Usage

See [Emacs Shortcuts for Magit](../005-tech-emacs-shortcuts-magit) -
[Emacs Shortcuts for Magit](id:18083c56-9942-44b7-804d-623b22866188) for
common tasks.

- Navigation:

  - Move forward/backward in sections: `n` and `p`
  - Move forward/backward in logical section (e.g. file, change) `M-n`
    and `M-p`
  - Move to parent section `^`

- Open transient Magit panel: `?` - good way to learn all commands

## Multiple Repositories View and Operations

Sources: [How to use
magit-list-repositories](https://emacs.stackexchange.com/questions/32696/how-to-use-magit-list-repositories),
[git operations from
magit-list-repositories](https://github.com/magit/magit/issues/4453)

- Use `magit-list-repositories` to view all repositories in a directory
  and perform operations on them.
- With the above buffer, use `magit-repolist-mode` to perform operations
  on marked repositories like fetch with `magit-repolist-fetch`.

## Magit diff, Checking Differences between branches

Source: [local PR review, git worktrees, find breaking changes (go) -
bashbunni YouTube](https://www.youtube.com/watch?v=Zr0Cqqbmmuc)

Use `magit-diff` and press `e` to see side by side changes of diff in
context of the range selected.

Example process to check differences in branches:

- Go into a feature branch
- `magit-diff-range`, choose main branch
- See diff
- Choose diff and enter the file
- `magit-merge-preview` to see changes like `magit-diff-range`

## See Also

- [Emacs Shortcuts for Magit](../005-tech-emacs-shortcuts-magit) -
  [Emacs Shortcuts for Magit](id:18083c56-9942-44b7-804d-623b22866188)
