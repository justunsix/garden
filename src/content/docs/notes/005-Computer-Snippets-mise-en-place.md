---
filetags: ":snippets:epubnote:mise-en-place:"
id: 4126d6c6-3402-40de-95d9-e28e97cbb617
title: mise-en-place Snippets
---

``` shell

# Install mise and bash shell integration
curl https://mise.run/bash | sh
# Installs mise and adds activation to ~/.bashrc

```

## Dev Tools, Runtimes

``` shell

# Install and use a tool in current path with mise use program_name and specific version
mise use node@24
## will install the latest version of node-24 and
## create/update the mise.toml config file in the local directory
## Anytime you're in that directory, that version of node will be used

# List installs
mise ls
mise list

# Install lazyvim distribution requirements (assume curl and git are aleady installed) and run it
mise use neovim lazygit tree-sitter fzf ripgrep fd
mise activate
nvim

# Install a tool from GitHub
mise use github:hashicorp/vagrant

# Install a tool globally (-g)
mise use -g github:nickgerace/gfold

# mise x or exec can be used for one-off commands using specific tools
mise x python@3.12 -- ./myscript.py
## if you want to run a script with python3.12

# Install a tool and run one command with the tool
mise use dotnet@8
mise x -- dotnet --version

# Generate the lockfile
mise lock

# Install tools using locked versions
mise install

# Update tools and lockfile
mise upgrade

```

### mise.toml

Regular and other backends like pipx, cargo, and go

``` toml

[tools]
terraform = "1.9"
terramate = "0.9"
pre-commit = "3"
awscli = "2"
github:nickgerace/gfold
"pipx:detect-secrets" = "1.4"
"cargo:eza" = "latest"
"go:github.com/containerscrew/tftools" = "0.9.0"

```

## Environments

``` shell

# Set environment variables
mise set NODE_ENV=development

# Unset environment variables
mise unset NODE_ENV

# Run command with environment variables
mise exec -- echo $NODE_ENV

# Show environment variables
mise env

# Show only redacted environment variables
mise env --redacted

```

### mise.toml

Set environment variables, whether they are required and run tasks with
them

Redact environment variables with `redact = true`

``` toml

[env]
NODE_ENV = 'production'
SECRET = { value = "my_secret", redact = true }
_.file = { path = ".env.json", redact = true }

---

redactions = ["SECRET_*", "*_TOKEN", "PASSWORD"]
[env]
SECRET_KEY = "sensitive_value"
API_TOKEN = "token_123"
PASSWORD = "my_password"

---

API_KEY = { required = true }
DATABASE_URL = {
  required = "Set DATABASE_URL to your PostgreSQL connection string (e.g., postgres://user:pass@localhost/dbname)",
}

[tasks.print]
run = "echo $MY_VAR"
env = { _.file = '/path/to/file.env', "MY_VAR" = "my variable" }

```

## Tasks

``` shell

# Run a tasks from selection list
mise run

# Run a task when the source changes
mise watch build

# Extra arguments will be passed to the task, for example, if we want to run in release mode
mise run build --release

# Job control
mise run --jobs 8 test        # Use 8 parallel jobs
mise run -j 1 test            # Force sequential execution

# List tasks
mise tasks ls

# Clear remote tasks cache
mise cache clear

```

### mise.toml

Set or reference files for tasks.

``` toml

[tasks.build]
description = "Build the CLI"
alias = 'b'
run = "cargo build"
[tasks."lint:eslint"] # using a ":" means we need to add quotes
run = "eslint ."
[tasks."lint:prettier"]
run = "prettier --check ."
[tasks.lint]
depends = ["lint:*"]
wait_for = ["render"] # does not add as a dependency, but if it is already running, wait for it to finish

[tasks.python_task]
run = '''
#!/usr/bin/env python
for i in range(10):
    print(i)
'''

[tasks."tf.apply"]
alias = "tfa"
description = "`terraform apply` with pre-generated plan file (terraform plan should be generated in advance)"
run = """
#!/usr/bin/env bash

cmd="terraform apply tfplan $@"
read -p "$cmd\n\nAre you sure? (Y/n) " choice
[ "$choice" = "n" ] || ($cmd; tput bel)
"""

# Specific shell to run in
[tasks.lintb]
shell = 'bash -c'
run = "cargo clippy"

# Set dependencies of tasks with =depends=
[tasks.run]
depends = ['build']

[tasks.azlogin]
run = [
  'az config set core.login_experience_v2=off',
  'az login',
  'az account set --subscription "$TF_VAR_subscription_id"',
]

# Specify an alternate command to run on Windows by using the =run_windows key=
[tasks.test]
run = 'cargo test'
run_windows = 'cargo test --features windows'

# Set directory with =dir=
# MISE_ORIGINAL_CWD is set to the original working directory and will be passed to the task
[tasks.test-in-dir]
run = 'cargo test'
dir = "{{cwd}}"

# Specify a file to run as a task
[tasks.release]
description = 'Cut a new release'
file = 'scripts/release.sh' # execute an external script

# Remote tasks
[tasks.build]
file = "https://example.com/build.sh"

```

1.  mise-tasks/plan

    Make sure `plan` file is executable with `chmod +x plan` and run
    with `mise run plan`

    ``` shell

    #MISE description="Login to Azure, Format and Validate Terraform files and Plan"

    # Login to Azure
    az login
    az account set --subscription "$(ARM_SUBSCRIPTION_ID)"
    # Format and validate Terraform files
    terraform fmt
    terraform validate
    ## Plan Terraform deployment and output plan
    terraform plan -out=tfplan

    ```
