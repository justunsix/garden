---
filetags: ":wsl:snippets:powershell:windows:epubnote:"
id: 135e45be-b456-4c86-a5cb-fee47064b77a
title: Windows WSL Snippets
---

``` powershell

# Start
wsl

# List all installed distros
wsl --list --verbose
wsl -l -v

# List available distros for installation
wsl.exe --list --online

# Install specific distribution
wsl --install --distribution Ubuntu-26.04
wsl --install --distribution FedoraLinux-44

# Shutdown all distros
wsl --shutdown

# Remove a distro
wsl --unregister <distro name>

```

## References

- [Install WSL \| Microsoft
  Learn](https://learn.microsoft.com/en-us/windows/wsl/install)
