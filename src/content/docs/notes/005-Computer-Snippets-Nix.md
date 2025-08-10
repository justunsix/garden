---
filetags: ":nix:nixos:package-manager:linux:snippets:epubnote:"
id: 70ae2a4f-f340-45b8-b3eb-63d2faa0e987
title: Nix Snippets
---

## nix-env - system wide programs

``` shell

# View packages and search for firefox
# or search at Nix https://search.nixos.org/packages
nix-env -qaP firefox

# Install package like Firefox
nix-env -iA nixpkgs.firefox

# List installed packages
nix-env -q

# Update all nix packages
nix-env -u

# Install a package
nix-env -iA nixpkgs.<package>

# Rollback packages to a previous generation (last set of upgrades)
nix-env --rollback

# Uninstall package
# Note name is a regular name and not with nixpkgs prefix
nix-env -e firefox
# or
nix-env --uninstall firefox

# Uninstall all nix-env packages, Warning, removes itself as well
nix-env --uninstall '*'

```

## nix-channel, nix-collect-garbage, nixos-rebuild - updates and clean

``` bash

# Update Nix index
nix-channel --update

# List current channel
nix-channel --list

# Add the current stable channel as of 2024-08
nix-channel --add https://channels.nixos.org/nixos-24.05 nixpkgs
# Add unstable channel
nix-channel --add https://nixos.org/channels/nixpkgs-unstable

# Remove a channel using its alias, in this case nixpkgs
## Common fix for "Warning: name collision in input Nix expressions,  skipping"
## Is to remove the channel causing the collision for a user
## since the channel is duplicated in the root
## as root, check nix-channel --list
nix-channel remove nixpkgs

# NixOS Rebuild from updated configurations
sudo nixos-rebuild switch

# Clean up old generations and packages to prevent space issues
nix-collect-garbage

# Clean up generations older than 30 days
nix-collect-garbage --delete-older-than 30d

# NixOS garbage collection
sudo nix-collect-garbage --delete-older-than-30d

```

## nix

``` shell

# Active repl for commands, :q or Ctrl + d to exit
nix repl

## Flakes

### Update
nix flake update

```

## nix-shell

Reproducible shell environments

source:
<https://nix.dev/tutorials/first-steps/ad-hoc-shell-environments.html>

- See also: [Automatic environment activation with direnv — nix.dev
  documentation](https://nix.dev/guides/recipes/direnv) and [Setting up
  a Python development environment — nix.dev
  documentation](https://nix.dev/guides/recipes/python-environment)

``` shell

# Activate shell with several programs
nix-shell -p git neovim nodejs

# Specific version of programs
## --run execute in bash, the command
## --pure discard most environment variables set on your system
## -I source of package declarations
nix-shell -p git --run "git --version" --pure -I nixpkgs=https://github.com/NixOS/nixpkgs/archive/2a601aafdc5605a5133a2ca506a34a3a73377247.tar.gz

```

### shell.nix

Example at: <https://github.com/rust-lang/rustlings>

``` shell

# Run nix-shell with shell.nix file below
# to get a reproducible environment
nix-shell

```

- Install software, set environment variables, and run commands before
  shell with `shellHook` with everything in `mkShell`
- `shell.nix` sets up a rust environment

``` nix

let
  nixpkgs = fetchTarball "https://github.com/NixOS/nixpkgs/tarball/nixos-23.11";
  pkgs = import nixpkgs { config = {}; overlays = []; };
in

pkgs.mkShell {
  packages = with pkgs; [
    cargo
    rustc
    rust-analyzer
    rustfmt
    clippy
    vim
  ];

  GIT_EDITOR = "${pkgs.neovim}/bin/vim";

  shellHook = ''
    git status
  '';
}

```

- To pin a version of nixpkgs, use `fetchTarball` to get a specific
  version of nixpkgs:

  ``` nix

  { pkgs ? import (fetchTarball "https://github.com/NixOS/nixpkgs/archive/06278c77b5d162e62df170fec307e83f1812d94b.tar.gz") {}

  }:

  ...

  ```

## Home Manager

``` shell

# Update home manager and create back up files if overwritting files
home-manager switch -b backup

```

## See Also

- [NixOS and Nix functional package manager](../005-tech-nix-nixos) -
  [NixOS and Nix functional package
  manager](id:0a783446-b951-448b-87a6-5897c26f85da)
