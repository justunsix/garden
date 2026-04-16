---
filetags: ":snippets:epubnote:dnf:yum:"
id: 06be5e52-b445-4bc5-99e0-9b93993d9b5b
title: DNF, YUM Snippets
---

Source: [Using the DNF software package manager :: Fedora
Docs](https://docs.fedoraproject.org/en-US/quick-docs/dnf/)

`dnf` can be used exactly as `yum` to search, install or remove
packages.

``` shell

# To search the repositories for a package type
dnf search packagename

# Install the package
dnf install packagename

# Remove a package
dnf remove packagename

# Removes packages installed as dependencies that are no longer required by currently installed programs.
dnf autoremove

# Checks the repositories for newer packages and updates them and confirm (-y)
dnf upgrade -y

# Upgrade but ignore updates for a package
sudo dnf upgrade --exclude=packagename

```

## See Also

### Resources

\[\[[https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/](https://docs.fedoraproject.org/en-US/quick-docs/upgrading-fedora-offline/)\]\[Upgrading Fedora Linux Using DNF System Plugin  
Fedora Docs\]\]
