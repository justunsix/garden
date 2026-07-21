---
date: 2026-07-11
filetags: ":nix:nixos:package-manager:linux:epubnote:"
id: 236612e5-bcff-4090-8ab5-1e9401da136e
title: Install NixOS
---

Instructions and examples from Tony \[fn:1\].

- Download ISO, select graphical installer or manual install
- Before installs, create manual partitions `cfdisk /dev/devicename`,
  select `gpt` label type
  - 1G - gpt EFI system
    - Mount: /boot
    - Label: boot
  - 8G to 32+G - Linux swap
    - Mount (if required) /swap
    - Label: swap
  - 8 MB - unformatted partition - required for GPT partition table
    - Label: bios-grub
  - Rest of space - LUKS2 encryption - / (can create manually in NixOS
    graphical installer)
    - Label: root
  - Install boot loader: on same disk as /boot and NixOS
- See [NixOS from Scratch for partition
  setup](https://github.com/tonybanters/nixos-from-scratch)

``` shell

sudo -i
lsblk
cfdisk /dev/vda

# gpt labels
# 1G type: EFI
# 4G type: swap
# remaining space, type: Linux Filesystem

mkfs.ext4 -L nixos /dev/vda3 # root at /
mkswap -L swap /dev/vda2 # swap
mkfs.fat -F 32 -n boot /dev/vda1 # /boot

# Mount drives to generate nix files
mount /dev/vda3 /mnt
mount --mkdir /dev/vda1 /mnt/boot
swapon /dev/vda2

# Generate initial hardware-configuration.nix config
nixos-generate-config --root /mnt

# Use flake and home-manager nix configuration
cd /mnt/etc/nixos
touch flake.nix home.nix

# Make file changes below

# Make changes
nixos-install --flake /mnt/etc/nixos#nixos-btw

# Set user password
nixos-enter --root /mnt -c 'passwd user1'

# Reboot
reboot

# Create version controlled dotfiles to store dotifles
mkdir ~/nixos-dotfiles
cp -r /etc/nixos/* ~/nixos-dotfiles
cd /etc/nixos
sudo chown -R justin:users .

# Get dotfiles, make changes to home.nix

# Make changes
sudo nixos-rebuild switch --flake ~/nixos-dotfiles#nixos-btw

```

## flake.nix

``` nix

{
  description = "NixOS from Scratch";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
    home-manager.url = "github:nix-community/home-manager/release-26.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations.nixos-btw = nixpkgs.lib.nixosSystem {
        inherit system;
        modules = [
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.justin = import ./home.nix;
            home-manager.backupFileExtension = "backup";
          }
        ];
      };
    };
}

```

## Configure configuration.nix

- Change hostname, `nixos-btw`
- Update timezone
- xserver settings, including window manager (optional)
- Change user name
- Add system level packages `environment.systemPackages`, fonts
- Enable flakes

``` nix

time.timeZone = "America/Toronto";

user.users.justin = {
  # defaults
}

environment.systemPackages = with pkgs; [
  vim
  wget
  git
  alacritty
]

fonts.packages = with pkgs; [
  nerd-fonts.jetbrains-mono
]

nix.settings.experimental-features = [ "nix-command" "flakes" ];

```

## home.nix

``` nix

{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/Code/dotfiles-nix/bm";
  create_symlink = path: config.lib.file.mkOutOfStoreSymlink path;
  configs = {
    nvim = "nvim";
    alacritty = "alacritty";
  };
in

{
  home.username = "user1";
  home.homeDirectory = "/home/user1";
  home.stateVersion = "26.05";

  # Pick up fonts
  fonts.fontconfig = {
    enable = true;
  };

  xdg.configFile = builtins.mapAttrs (name: subpath: {
    source = create_symlink "${dotfiles}/${subpath}";
    recursive = true;
  }) configs;

  home.packages = with pkgs; [
    # System and Files
    git
    topgrade
    curl
    btop
    # Fonts
    jetbrains-mono
    # DevOps
    neovim
    # Browser
    firefox
    # Shell, Terminal
    alacritty
    nushell
  ];
}

```

## Windows Dual Booting

For time clock issues config, see [Dual Booting NixOS and Windows -
nixos wiki](https://nixos.wiki/wiki/Dual_Booting_NixOS_and_Windows)

``` nix

# /etc/nixos/configuration.nix

# Autodetection with os-prober (GRUB), os-prober is a tool to autodetect which other systems are present on the machine. Grub can be told to use os-prober to add a menu-entry for each of them.
# https://nixos.wiki/wiki/Dual_Booting_NixOS_and_Windows

{ config, pkgs, ... }: {
  # ...
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "nodev";
  boot.loader.grub.useOSProber = true;

  # Setting RTC time standard to localtime, compatible with Windows in its default configuration:
  time.hardwareClockInLocalTime = true;
  # ...
}


```

## References

- \[fn:1\] [How to Install NixOS From Scratch (2026 Edition), Flakes,
  Home Manager Full Guide - YouTube -
  tony](https://www.youtube.com/watch?v=2QjzI5dXwDY)
