---
filetags: ":emacs:package:magit:epubnote:"
id: f9107e82-4d3f-4198-a00d-f653096b9ebd
title: "Emacs Package: Magit"
---

## Emacs Package: Magit

### Introduction

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

1.  Installation

    Not require when using Spacemacs

    ``` elisp
    (use-package magit
      :ensure
    ```

2.  Use

    - Launch `magit-status`: `M-m g s`

    - Refresh Magit: `g` (required after changes after opening status)

    - Close Magit: `q`

    - Expand unstaged changes `Tab`, press `Tab` again to collapse
      changed sections

    - Unstaged changes - stage changes: `c`

      - You can stage individual changes in a file

    - Navigation:

      - Move forward/backward in sections: `n` and `p`
      - Move forward/backward in logical section (e.g. file, change)
        `M-n` and `M-p`
      - Move to parent section `^`

    - Open transient Magit panel: `?` - good way to learn all commands

3.  Tutorials

    1.  Commits

        - Stage a change `s`
        - Commit the file `c` `c`, type commit
          - Commit the message `C-c C-c` or cancel `C-c C-k`
          - Amend a previous commit with `c` `a` or reword `c` `w` -
            used only on head
        - Extend a commit (add an additional commit) to an existing
          commit: `c` `e`
        - Instant Fixup (add an additional commit) to an existing
          commit: `c` `F`

        1.  Discard changes

            - Highlight and discard changes: `k`

    2.  Clone a repo

        - Clone with `magit-clone`: `M-m g c`
          - If on GitHub can use `username/repo` format

    3.  View History

        - Go to commit history: `l l`
        - Search with history: `C-s`
        - Search history of another branch `l o`

    4.  Branches

        - Checkout a branch: `b b`
        - Spin off:
          - Create a new branch and move recent commits to it: `b s` and
            name spin off branch

    5.  Push

        - Push to remote (same as configured): `P p`
        - Force push latest state of branch to overwrite remote: `P f`

    6.  Stashing - Save Changes for Later

        - Save changes to stash (staged and un-staged): `z z`
        - Apply stash changes: `z a`

    7.  Pull

        - Pull from remote: `F u`

    8.  Rebase

        - Pull upstream changes and merge with your current changes: `F`
          `r` to configure rebase true and `p` to start, fix merge and
          continue merge `r`.

    9.  Fetch

        - Fetch from an upstream: `f p`

    10. Gitignore

        - Ignore a file: `i` at top level of repo: `t`, directory: `s`,
          private to repo: `p`

### Multiple Repositories View and Operations

Sources:

- [How to use
  magit-list-repositories](https://emacs.stackexchange.com/questions/32696/how-to-use-magit-list-repositories)
- [git operations from
  magit-list-repositories](https://github.com/magit/magit/issues/4453)
- Use `magit-list-repositories` to view all repositories in a directory
  and perform operations on them.
- With the above buffer, use `magit-repolist-mode` to perform operations
  on marked repositories like fetch with `magit-repolist-fetch`.

## Magit diff

Source: [local PR review, git worktrees, find breaking changes (go) -
bashbunni YouTube](https://www.youtube.com/watch?v=Zr0Cqqbmmuc)

Use `magit-diff` and press `e` to see side by side changes of diff in
context of the range selected.
