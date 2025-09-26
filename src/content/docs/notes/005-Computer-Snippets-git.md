---
filetags: ":git:gitops:tech:snippets:epubnote:"
id: 95f66412-2bb4-49f7-aed1-c05f0057798c
title: Git Snippets
---

Source: [Git - Documentation](https://git-scm.com/doc)

``` bash

# Clone (download) a repository
git clone url
# Clone only a branch
git clone url --branch branch_name --single-branch

# Clone, but only populate files present in the root directory
git clone --sparse url

# Only fetch the latest commit
git clone --depth=1 url

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
## -p : --patch means it will produce patch text, like commit, file and diff information

# Show git log history including change diffs
git log -p

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

# Edit commits, interactive rebase
git rebase -i HEAD~5
# rebase -i : interactive rebase using editor
# HEAD~5 : include last 5 commits from HEAD

# Windows git bash
## Graphical User Interfaces
git gui
gitk

# Add all directories as safe directories
## bash, nu
git config --global --add safe.directory '*'
## PowerShell
git config --global --add safe.directory *

# Set private key to sign with
git config --global user.signingkey 0A46826A!

# Signing a commit with -S
git commit -a -S -m 'Signed commit'

# See and verify a signature on a commit
git log --show-signature -1

# Git worktrees - manage multiple working trees
## Like managing a git branch as a separate directory
## Like manually git cloning a repo to a separate directory and changing the working branch of that repo
## Easier to keep track of separate branches

# Create a new branch whose name is the final part of the path
git worktree add my_path_and_branch
# Add a new worktree with a feature branch
git worktree add ../myrepo-newfeature new-feature
## Example
## /bubbles is [master]
## /bubbles-table is branch [use-lipgloss-table]

# Create new worktree with existing branch main
git worktree add ../repo-main main

# If you want to make experimental changes or do testing without disturbing development,
# it is often convenient to create a throwaway worktree not associated with any branch.
# Creates a new worktree with a detached HEAD at the same commit as the current branch example
git worktree add -d ../repo-experimental

# List work trees, their location, and checked out branches
git worktree list

# Remove a worktree
git worktree remove worktree-name

# Tagging
git tag -a v1.0 -m "pre digital garden"

# Checkout only a subset of files, useful for selecting which files you want
git sparse-checkout set MY/DIR1 SUB/DIR2
# Change to a sparse checkout with all files (at any depth) under MY/DIR1/ and SUB/DIR2/
# For files in the the working copy (plus all files immediately under MY/ and SUB/ and the toplevel directory)

# List directories or pattersn in sparse-checkout file
git sparse-checkout list

# Repopulate all files in repository, remove sparse-checkout patterns
git sparse-checkout disable

# Submodules - add a submodule into a specific directory in current repository
git submodule add https://github.com/chaconinc/DbConnector dbconnfolder

# Submodules - initialize existing module inside a repository and fetch all data from the project
git submodule init
git submodule update

# Make changes to submodule and parent repository
cd submodule
git commit -m"add file"
git submodule update
cd ..
git add path/to/your/submodule
git commit -m "Updated submodule to latest main branch"

# Submodules - clone, initialize all submodules and update each submodule in the repository
git clone --recurse-submodules https://github.com/chaconinc/MainProject

# Example workflow with these branches:
# - main / master
# - pull request review
# - feature development
git clone myrepo.git # main
cd myrepo
git worktree add ../myrepo-feature feature_branch
git worktree add ../myrepo-pr pull_request_numbered_branch

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

## Using Multiple SSH Private Keys

Source: [How to Configure Git to Use Specific SSH Private
Keys](https://net2.com/how-to-configure-git-to-use-specific-ssh-private-keys/)

See the source and [bash - How to specify the private SSH-key to use
when executing shell command on Git? - Stack
Overflow](https://stackoverflow.com/questions/4565700/how-to-specify-the-private-ssh-key-to-use-when-executing-shell-command-on-git)
for more options than the ones listed here.

### Option: Use SSH Configuration (~/.ssh.config)

``` shell

# Set host and specific key you want to use
# ~/.ssh/config

Host github.com
  HostName github.com
  User git
  IdentityFile ~/.ssh/github_personal_key
  IdentitiesOnly yes

```

1.  Option is using host aliases for multiple identity

    ``` shell

    # ~/.ssh/config

    # Personal GitHub account
    Host github-personal
      HostName github.com
      User git
      IdentityFile ~/.ssh/personal_key
      IdentitiesOnly yes
      AddKeysToAgent yes # Optional: Add key to agent on first use

    # Work GitHub account
    Host github-work
      HostName github.com
      User git
      IdentityFile ~/.ssh/work_key
      IdentitiesOnly yes

    # Then use on command line like:
    # Clone using the 'github-work' alias and associated key
    git clone git@github-work:MyCompany/ProjectRepo.git

    # Or, update an existing remote's URL
    git remote set-url origin git@github-work:MyCompany/ProjectRepo.git

    ```

2.  Explanation of configuration

    - Host: The alias or pattern to match for where git repository is at
    - HostName: Real hostname or IP address to connect to.
    - User: The remote username (`git` is used for services like
      GitHub/GitLab)
    - IdentityFile: The path to the specific private key file to use
    - IdentitiesOnly yes: Tells SSH to try the key specified in
      IdentityFile and keys in the agent, preventing it from trying
      default key files (like \`~/.ssh/id<sub>rsa</sub>\`) which could
      be the wrong identity.
    - AddKeysToAgent yes: If the key has a passphrase, this attempts to
      add it to a running SSH agent after the first successful
      authentication, avoiding repeated passphrase prompts.
    - Permissions: Ensure your `~/.ssh/config file` permissions are
      restricted only to your user with `chmod 600 ~/.ssh/config`

### Option: Using the GIT<sub>SSHCOMMAND</sub> Environment Variable

This option is available in Git version 2.3.0 and later. The
GIT<sub>SSHCOMMAND</sub> environment variable sets the SSH command that
git uses and can use the `-i` flag to point to a key file to use. It is
useful for temporary changes and scripts.

``` shell

# Run a single git command using a specific key
GIT_SSH_COMMAND='ssh -i /path/to/private_key -o IdentitiesOnly=yes' git clone user@host:repo.git

# Set the variable for the current shell session
export GIT_SSH_COMMAND='ssh -i /path/to/private_key -o IdentitiesOnly=yes'
git pull
git push
# Unset it later if needed: unset GIT_SSH_COMMAND

```

As explained above `IdentitiesOnly` tells SSH the specific IdentityFile
to use and not use the default ones

On Windows OS, use `set`

``` powershell

set "GIT_SSH_COMMAND=ssh -i C:\path\to\private_key -o IdentitiesOnly=yes"

```

### Option: Using the core.sshCommand Git Configuration Setting

This option is available in Git 2.10.0 and later. It is like setting the
GIT<sub>SSHCOMMAND</sub> in the git configuration for a repository or
globally.

1.  Per-Repository Configuration

    ``` shell

    cd /path/to/your/repo
    git config core.sshCommand 'ssh -i /path/to/private_key -o IdentitiesOnly=yes'
    # git commands in this repo use the specified key

    ```

    This adds the setting to the repository’s .git/config file.

2.  Configuration During Clone

    You can set the configuration temporarily for the \`clone\` command
    using the \`-c\` flag, and then optionally make it permanent within
    the newly cloned repository:

    ``` shell

    # Clone using the specified key
    git -c core.sshCommand="ssh -i /path/to/private_key -o IdentitiesOnly=yes" clone user@host:repo.git new-repo-dir

    # Optionally, make it permanent for this repo
    cd new-repo-dir
    git config core.sshCommand 'ssh -i /path/to/private_key -o IdentitiesOnly=yes'

    # Cloning and setting the core.sshCommand configuration permanently in one command
    git clone -c "core.sshCommand=ssh -i /path/to/private_key -o IdentitiesOnly=yes" user@host:repo.git

    ```

3.  Ignoring User SSH Config

    Sometimes, you might want Git to use the specified command and key
    while completely ignoring the user’s \`~/.ssh/config\`. The \`-F
    /dev/null\` option (or equivalent on non-Unix systems) can achieve
    this:

    `git config core.sshCommand "ssh -i /path/to/private_key -F /dev/null -o IdentitiesOnly=yes"`

## Only checkout or clone specific files

Use case: reduce amount of files tracked or you are only interested in a
subset of files in a repository

Recommend option 3 for large repositories

``` shell

# Option 1: Git clone and sparse-checkout to only clone specific files
git clone --no-checkout repository_url
cd repository
# Enable sparse-checkout
git sparse-checkout init
# Set sparse-checkout pattern
git sparse-checkout set directory/i/want
git checkout branch_name

# Option 2: Git archive a specific directory and extract it
git archive --remote=https://github.com/user/repo.git HEAD:docs | tar -x
# docs - the sub directory you want

# Option 3: Partial clone with sparse-checkout
git clone --filter=blob:none <repository-url>
# --filter=blob:none - excludes large blobs, useful for a repo with many large files
# and minimizes downloads
# Alternatively, if only interested in current commits, use --depth 1
git clone --depth 1 --filter=blob:none <repository-url>

# Enable sparse-checkout
git sparse-checkout init
# Set sparse-checkout pattern
git sparse-checkout set directory/i/want
# or with cone
git sparse-checkout set --cone file1.ext file2.ext dir1 sub/dir2
git checkout branch_name

```

## See Also

- [Technology](../600-technology) -
  [Technology](id:9092eabf-f6f5-4775-b8aa-6e78e74880c3)
- [GitHub](../005-computer-tech-github) -
  [GitHub](id:7780cbb0-5092-4233-8f80-bb90864828f9)
