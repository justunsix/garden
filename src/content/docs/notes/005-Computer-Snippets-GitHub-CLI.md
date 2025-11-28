---
filetags: ":snippets:epubnote:github cligithub:cli:"
id: a3c30671-2f49-4952-9cb4-a5b4087bf8b3
title: GitHub CLI Snippets
---

``` shell

# Start interactive setup
gh auth login

# Open a browser to authenticate and copy one-time OAuth code to clipboard
gh auth login --web --clipboard

# Authenticate against github.com by reading the token from a file
gh auth login --with-token < mytoken.txt

# Authenticate with specific host
gh auth login --hostname enterprise.internal

# Clone a repository from a specific org
gh repo clone cli/cli

# Clone a repository from your own account
gh repo clone myrepo

# Clone a repo, overriding git protocol configuration
gh repo clone https://github.com/cli/cli
gh repo clone git@github.com:cli/cli.git

# Clone a repository to a custom directory
gh repo clone cli/cli workspace/cli

# Clone a repository with additional git clone flags
gh repo clone cli/cli -- --depth=1

# Issues, PRs, run in project directory
# Viewing a list of open issues
gh issue list
# Create issue
gh issue create

# Create a pull request (PR) interactively
gh pr create

# List pull requests
gh pr list

# Checking out a pull request locally
gh pr checkout 12

# Open the home page of the current repository
gh browse

# Open issue or pull request 217
gh browse 217

# Open a codespace in Visual Studio Code
gh codespace code [flags]

```

## See Also
