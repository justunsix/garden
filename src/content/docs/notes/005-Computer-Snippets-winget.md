---
filetags: ":winget:snippets:epubnote:"
id: 03a386df-b8a7-43fa-9048-30ce9ea28a0e
title: Winget Snippets
---

``` powershell

# Silently (-h) install the exact package (-e) called firefox and accept agreements
winget install -e -h --accept-source-agreements --accept-package-agreements Mozilla.Firefox

# Install a package
winget install emacs

# Update all installed winget packages
winget upgrade --all --silent

# Search for a package
winget search emacs

# List applications with upgrades
winget upgrade

# Upgrade a specific application
winget upgrade powertoys --version 0.15.2
# Upgrade with application ID
winget upgrade --id Microsoft.PowerToys

# Upgrade all applications (--all) and silently (-h) upgrade to suppress UI
winget upgrade -h --all
# Upgrade all applications silently and accept agreements
winget upgrade -h --accept-source-agreements --accept-package-agreements --all

```

## References

- [Winget Documentation - Microsoft
  Learn](https://learn.microsoft.com/en-us/windows/package-manager/winget/)
