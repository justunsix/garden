---
filetags: ":linux:snippets:arch:epubnote:"
id: ede4ca2a-ec67-4c86-ab79-71cc7a62584f
title: pacman Snippets
---

``` shell

# Search a package
pacman -Ss <package>

# Install a package if it is not already installed
pacman -S --needed <package>

# Remove a package(s) and all dependencies and configuration files
pacman -Rns <package>

# Upgrade Packages, install packages which have an older version already installed
sudo pacman -Syu --noconfirm
## -Sy : update and install
## -u : upgrade
## --noconfirm : accept all prompts

# List installed packages
pacman -Q

```

## Arch User Repository (AUR) Helpers

``` shell

# Build from manually downloaded AUR repository
makepkg -si

# Interactively search and install <target>
paru <target>

# Alias for paru -Syu
paru

# Install target package
paru -S <target>

# Upgrade AUR packages
paru -Sua

# Print available AUR updates.
paru -Qua

# Download the PKGBUILD and related files of <target>.
paru -G <target>

# Print the PKGBUILD of <target>
paru -Gp <target>

# Print the AUR comments of <target>
paru -Gc <target>

```

## See Also

### Resources

- See more usage at
  [pacman/Rosetta](https://wiki.archlinux.md/title/Pacman/Rosetta) which
  translates common package manager commands from pacman to other
  commands
- [AUR Helpers - archlinux
  wiki](https://wiki.archlinux.md/title/AUR_helpers)
