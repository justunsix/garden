---
filetags: ":nix:nixos:package-manager:linux:epubnote:"
id: 768b191b-bb1e-48c6-93c1-e6d757ea28f0
title: Nix Guides and Information
---

## Nix Language basics

- [Nix Language Basics](https://nixos.org/guides/nix-language.html)

> The Nix language is used to declare packages and configurations to be
> built by Nix. It is a domain-specific, purely functional, lazily
> evaluated, dynamically typed programming language.

Uses of Nix language:

- Nixpkgs: software distribution
- NixOS: Linux distribution that can be configured declaratively and
  based on Nix and Nixpkgs

## Use Cases of NixOS and Beginning Install

Source: [NIX OS: the BEST package manager on the MOST SOLID Linux
distribution - The Linux Experiment -
YouTube](https://www.youtube.com/watch?v=DMQWirkx5EY)

- Install with Live ISO, graphical install
- Can modify `/etc/nixos/` configuration files - `configuration.nix`
  - Functional descriptions (everything is declared) of
    - hardware
    - bootloader
    - operating system, managers
    - options, services, users, apps
  - File can be used rebuild system with `sudo nixos-rebuild switch`
    - New "generation" is created
    - Rebuild will check for issues in configuration file
- Packages can use different channel like stable, unstable has newer
  packages with some risks
  - Update channel: `sudo nix-channel --update`
  - Rebuild to upgrade: `sudo nixos-rebuild switch`

Other Cases

- Flakes - reproducible environments
- Home Manager - declarative configuration for user directory

## NixOS: Everything Everywhere All at Once

Source: [NixOS: Everything Everywhere All at
Once](https://www.youtube.com/watch?v=CwfKlX3rA6E)

- Hardware and system configurations are separated to allow reuse of
  system configurations on multiple hardware platform
- System configuration can configure things like:
  - Packages and their configuration
  - Variables
  - Bootloader
  - EFI
  - Networking
  - Timezone
  - Users
  - File system
  - Fonts
  - Sound
  - Hardware
  - and more
- Portability and reproducibility: can be used to roll back to previous
  generations, customize a live NixOS USB

### NixOS Rebuild Script - Allows easily visible changes and error handling to configuration changes

`./rebuild`

``` bash

#!/bin/bash
set -e
pushd ~/dotfiles/nixos/
# Edit changes
nvim oatman-pc.nix
# Format nix file with alejandra
alejandra . &>/dev/null
# Show what changed
git diff -U0 *.nix
echo "NixOS Rebuilding..."
# Make changes, show relevant errors
sudo nixos-rebuild switch &>nixos-switch.log || (
 cat nixos-switch.log | grep --color error && false)
gen=$(nixos-rebuild list-generations | grep current)
# Check in configuration change under the Nix generation name
git commit -am "$gen"
popd

```

### Channel Use

1.  All Unstable

    ``` bash

    $ nix-channel --add \
    https://nixos.org/channels/nixos-unstable nixos
    $ nixos-rebuild switch --upgrade

    ```

2.  Some Unstable

    ``` nix

    environment.systemPackages = with pkgs; [
      unstable.neovim  # bleeding-edge nvim
      emacs            # stable emacs
    ];

    ```

### Auto Upgrade in Background on Schedule, Run linked executables, Systemd services,

``` nix

# Auto Upgrade in Background on Schedule
system.autoUpgrade = {
  enable = true;
  flake = inputs.self.outPath;
  flags = [
    "--update-input"
    "nixpkgs"
    "-L"
  ];
  dates = "09:00";
  randomizedDelaySec = "45min";
};

# LD Fix, Allow NixOS to run dynamically linked executables \
# and binaries for Generic Linux

programs.nix-ld.enable = true;
programs.nix-ld.libraries = with pkgs; [
  # Add any missing dynamic libraries for unpackaged
  # programs here, NOT in environment.systemPackages
];

# Configure systemd services

systemd.services.irc = {

  serviceConfig = {
    Type = "simple";
    User = "oatman";
    ExecStart = "screen -dmS irc irssi";
    ExecStop = "screen -S irc -X quit";
  };

  wantedBy = ["multi-user.target"];
};

```

### Reproducible, Dotfiles, Condition Config, Packages

- nix flakes = package.lock for reproducible environment
- home manager = dotfiles management
- Turing-complete config = use if statements etc
- All packages get their own independent dependency tree
- Nix good for development setup

## NixOS Guide, Flakes, Home-manager, Config Structuring

Source: [Ultimate NixOS Guide \| Flakes \|
Home-manager](https://www.youtube.com/watch?v=a67Sv4Mbxmc)

### NixOS Guide

- Uses declarative configuration (default at `/etc/nixos/*.nix`), allow
  reuse across different systems, allows roll back

- Use `man configuration.nix` to discover/search for configuration
  settings

- All Nix packages, info stored in `/nix/store`

- sudo nixos-rebuild switch does not update packages, updates are
  relative to a system's channel's commit

### Flakes

- `flake.nix` declarative configuration of packages and versions with
  flake.lock
  - It will have a reproducible environment that will not depend on a
    system's channel
- Use of flakes requires activation of experimental feature
- Starter configuration for integrating flakes into NixOS:
  <https://github.com/vimjoyer/flake-starter-config>

### About Nix Modules

- Nix modules = like a function that takes in input and specifies output
  - For example, set up users in a main-user.nix and specific options
    and its config
  - Can be imported / reused in other nix configuration files

### Home-Manager Use Case

- Install user programs, user programs' config, font, theme, shell
- Set up /home/user directory
- Read home-manager options with `man home-configuration.nix`
- Works on Unix, Linux distributions

### Config Structuring

- /etc/nixos - could be moved to user's home directory
  - configuration.nix
  - hardware-configuration.nix
  - home.nix
  - flake.nix
  - flake.lock
  - modules/ - reusable modules, for example to configure specific
    programs, parts of system
    - nixos/
      - nvidia.nix
    - home-manager/
      - neovim.nix
      - terminals/
      - alacritty.nix
      - kitty.nix
  - hosts/ - different system configurations
    - default/
      - configuration.nix
      - hardware-configuration.nix
      - home.nix
    - workmachine:
      - configuration.nix
      - hardware-configuration.nix
      - home.nix
- Reference default configuration in flake.nix modules, then add
  additional configurations for specific machines in modules
- Choose which configuration to use with
  `sudo nixos-rebuild switch --flake /etc/nixos/#workmachine`

## What Nix Can Do (Docker Can't)

Source: [Matthew Croughan - What Nix Can Do (Docker Can't) - SCaLE
20x](https://www.youtube.com/watch?v=6Le0IbPRzOE). Taught by Matthew
Croughan from Nix Camp

### What Nix Can Do

Use case: "Anyone should be able to compile my code"

- Other users can use the same code
  - CI/CD, different user machines all run the same
  - Manage dependencies and prevent conflicts with them
  - Use old programs that may be difficult to run

1.  Features

    - Infrastructure as Code
    - Reproducibility
    - Software supply chain security
    - Software Bill of Materials

    1.  Example Usage

        - Servers, personal devices defined by nix:
          <https://github.com/MatthewCroughan/nixcfg>
        - Nix flake for running AI: <https://nixified.ai/>
        - Could replace other package managers, dotfiles, dockerfiles,
          makefiles, helper scripts, version managers

2.  About

    - Example companies using nix: replit, Anduril, Target
      - Some companies use Nix and view as a competitive advantage
    - Nix is a small C++ program
      - Can be copied to another machine to use just the binary
    - Functional programming language
    - Package manager
    - Method of compiling software from source

    1.  Communicating

        - nixpkgs repository
        - [NixOS Discourse](https://discourse.nixos.org/)

### Nixpkgs

- A repository, collection of packages
  - Nix code of reproducible recipes (derivations)
  - Automated
  - Largest and most up to date collection of packages compared to other
    package managers
- Packaging can be done by writing nix instructions for building the
  program and patching any non-Nix specific items like an output
  directory in a Makefile

### NixOS

- Built from Nix language, packages and nixpkgs
- Declarative

### Container Images

- Nix can build OCI compliant images

### Demonstrations

1.  nix-shell and python3.withPackage

    ``` bash

    # Start repl
    nix repl
    # Load nixpkgs. a path to repository
    :l <nixpkgs>
    # See derivation of python3
    python3
    # See function
    python3.withPackages
    # See python with packages
    python3.withPackages (p: [p.numpy])
    python3.withPackages (p: [p.jupyter])

    # Exit repl

    # See configurations
    cd /etc/nixos
    ls
    # Edit configuration.nix and activate changes
    nixos-rebuild switch
    # Observe what is being built

    ```

2.  Flakes

    - All inputs and outputs are defined
    - Exampe: make reproducible shell for projects with exact same
      version of all tools, stack
    - nix will use nix cache if the requested output has been built
      before and stored
    - Can use to override existing build attributes like
      pkgs.packagename.overrideAttrs (old : ….)

    ``` bash

    # Edit flake.nix

    # See changes
    nix flake show
    # Go into shell
    nix develop .#devShell.x86_64-linux

    # Cross compilations, see tab for architectures
    nix build nixpkgs#pkgsCross.<tab>
    # Binary can be run with nix emulated architectures enabled
    # using: boot.binfmt.registrations
    # e.g. boot.binfmt.emulatedSystems = ["risc64..."]

    # Run programs
    nix run <https:/...>

    # Run VM with QEMU
    nix-shell -p nixos-shell
    # In vm.nix, specific state, Linux kernel services
    nixos-shell vm.nix

    ```

3.  Tests

    - Using nix, specific creation of VMs with services
    - Start VMs, run tests, check results

4.  Docker

    - Enable in configuration.nix with
      `virtualization.docker.enable = true;`
    - Using a nix file, build Docker image, docker load the image for
      running using Nix's dockerTools build.

## See Also

### Resources

- [Learn Nix](https://nixos.org/learn.html)
- [Nix Tutorials](https://nix.dev/tutorials/)
