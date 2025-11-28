---
filetags: ":nix:nixos:package-manager:linux:epubnote:"
id: 0a783446-b951-448b-87a6-5897c26f85da
title: NixOS and Nix functional package manager
---

## Use Cases

- Unique package installations, trying out packages, multiple
  dependencies and version

- Multiple versions of packages, complete with dependencies

  - Reuse of common package versions

- Multiple user support

- Reproducible build environments / packages / operating system

  - Defined by configuration file
    - Avoid long reinstall and config
  - Environments can include only declared packages or merge of declared
    packages and user's own environment
  - Declared environment setting
  - Dockerfiles
  - Package files

- Roll back easy with generations

- Good for reproducibility, stability, frequent system changes

### Disadvantages

- Requires command line and configuration files

### Nix as a Package Manager

[How to use NixOS package
manager](https://linuxhint.com/how-to-use-nixos-package-manager/)

Examples

- Install using Nix shell script

### Supports

- Atomic upgrades and rollbacks
- Nix store, stores packages
- Garbage collection
- Functional package language
  - Nix expressions describe everything that goes into a package build
    action (a derivation)
- Linux and macOS
- NixOS is a Linux distribution using Nix for package management and
  system configuration like `/etc` files

## Usage

- Install using [quick start
  instructions](https://nixos.org/manual/nix/stable/quick-start.html)

### Environment Variables

- PATH should include nix binaries
- During install, Nix installer will use proxy environment variables

### Commands

``` bash

# List all packages available in installed channels (repositories)
nix-env -qaP

# Install package
nix-env -iA nixpkgs.<package>
 # Test packages with `which <package>`

# uninstall package
nix-env -e <package>

# Build an download dependencies in your Nix store and start bash shell with required environment variables
nix-shell
# Install package and go into shell with it, package only exists in that shell
nix-shell -p <package>
# Nix-shell can use a default `shell.nix` file first and set up a base for other nix-shells in addition to packages specified by `-p`

# --pure` flag makes sure that the bash environment from your system is not inherited, useful for CI environments and reproducible builds/executables
nix-shell --pure

# List installed nix packages
nix-env -q
```

``` bash
# `--pure` can be used inside reproducible scripts in shebangs like:
#! /usr/bin/env nix-shell
#! nix-shell --pure -i python -p "python38.withPackages (ps: [ ps.django ])"
#! nix-shell -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz

import django

print(django)
```

[Upgrade
Nix](https://nixos.org/manual/nix/stable/installation/upgrading.html):

Single-user installations of Nix should run this:
`nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert`

Multi-user Nix users on Linux should run this
`sudo nix-channel --update; nix-env -iA nixpkgs.nix nixpkgs.cacert; systemctl daemon-reload; systemctl restart nix-daemon`

1.  Updates

    `nix-channel --update nixpkgs` - update channels

    and

    `nix-env -u '*'` - update packages

2.  Rollbacks

    `nix-env --rollback` - rollback to previous version of packages

3.  Garbage Collection

    `nix-collect-garbage -d` - remove old versions of packages, should
    be run periodically since other Nix commands do not delete old items

### Security

Different [user
modes](https://nixos.org/manual/nix/stable/installation/nix-security.html)
are available.

- Single user mode = similar to other package management tools, a single
  user like root does all package management operations, others can use
  packages, but not do package management
- Multiple user mode = every user can do package management operations,
  software installs do not require root privileges

### Appendix - Possible packages for Nixos

- VS Code
- drawio
- openrgb
- peazip - not available yet
- emacs - available, but not native compilation?
- fsearch
- microsoft-edge
- vlc
- keepassxc
- firefox-… versions

## See Also

- [Nix Guides and Information](../005-tech-nix-nixos-guides) - [Nix
  Guides and Information](id:768b191b-bb1e-48c6-93c1-e6d757ea28f0)
- [Nix and Poetry for Python App
  Packaging](../005-tech-nix-and-poetry-for-python-app-packaging) - [Nix
  and Poetry for Python App
  Packaging](id:b8f60b30-8bf6-4e81-a7df-c25730c83e16)

### Resources

- [Nix Manual](https://nixos.org/manual/nix/stable/)
- [Nix Guides](https://nixos.org/learn.html)
- [GitHub - Misterio77/nix-starter-configs: Simple and documented config
  templates to help you get started with NixOS + home-manager + flakes.
  All the boilerplate you
  need](https://github.com/Misterio77/nix-starter-configs?tab=readme-ov-file)
  - [Configuration Collection - NixOS
    Wiki](https://nixos.wiki/wiki/Configuration_Collection)
