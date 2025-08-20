---
filetags: ":apt:snippets:epubnote:"
id: 80abb3ba-7e85-4ef4-8a87-f6e2f9b8d3cb
title: APT Advanced Package Tool Snippets
---

``` shell

# Show information about a package
apt info <package>
# Show information about a package from cache
apt-cache show <package>

# Update, upgrade, and clean packages
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y
# Optional upgrade apt flagged unsafe packages
sudo aptitude safe-upgrade

# Install deb package
sudo dpkg -i /path/to/deb/file
sudo apt-get install -f
## or
sudo apt install ./name.deb

# Combined
sudo apt update && sudo apt upgrade -y && sudo apt autoremove -y; sudo aptitude safe-upgrade -y

# List all repositories used or added to apt
grep ^ /etc/apt/sources.list /etc/apt/sources.list.d/* > apt-repos.txt
less apt-repos.txt

# Search for a package
apt search <package>

# List installed packages
apt list --installed

# Install a .deb file
sudo dpkg -i <package>.deb

```

## See Also

### Resources

- See more usage at
  [pacman/Rosetta](https://wiki.archlinux.md/title/Pacman/Rosetta) which
  translates common package manager commands from pacman to other
  commands
