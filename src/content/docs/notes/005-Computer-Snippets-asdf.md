---
filetags: ":command:cli:asdf:snippets:epubnote:"
id: 45f7089c-d0e6-4383-8aa1-66c10a02101f
title: asdf Snippets
---

``` shell

# List all available plugins
asdf plugin list all

# Install a plugin:
asdf plugin add name

# List all available versions for a package with packagename
asdf list all packagename

# List install packages with packagename
asdf list packagename

# Install a specific version of a package
asdf install packagename version

# Uninstall a specific version of a package
asdf uninstall packagename version

# Set global version for a package
asdf set -u packagename version

# Set global version for a package, for example ProtonGE, to the latest
asdf set -u protonge latest

# Example: Install Proton Glorious Eggroll (GE) with unofficial plugin
asdf plugin add protonge
# Or install a version from a tag (Eg.: GE-Proton8-25)
asdf install protonge latest
# and set protonge at latest version
asdf set -u protonge latest

# Update all plugins to latest commit on default branch
asdf plugin update --all

# See the current version used for a package
asdf current name

```
