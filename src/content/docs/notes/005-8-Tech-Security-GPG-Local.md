---
filetags: ":gpg:security:encryption:epubnote:"
id: 1e2d6314-1c66-4ee9-8127-2d85ded47e4e
title: GPG Local Security
---

## Local GPG Settings

Get keys from encrypted storage

or

Rebuild from scratch

``` shell

cd ~/.ssh

# Create an OpenSSH key (used for cloning the Git Repo), create public and private key
## Name key with date to identify generation date
ssh-keygen -t ed25519 -C "myemail@domain.com"

# Upload public key to repository like GitHub, format is like ssh-ed25519 long-key-string myemail@domain.com
cat ~/.ssh/id_ed25519.pub

```

### Other Key generation methods

``` shell
# Generate new GPG keys for encryption
# Generate a new key pair, for options:
# - Kind of key: ECC and ECC (Elliptic curve cryptography)
# - elliptic curve: Cure 25519 (ed25519)
# - Key expiry date: 2 years
# - User ID information: name, email, comment (do not enter comment)
gpg --expert --full-gen-key

# Export your public key, give this file to people you want to communicate with
gpg --armor --export user-id-or-email > pubkey.asc

# Import any you get from others
gpg --import <public key>

## Sign someone's public because you know it is from them and trust them locally
gpg --sign-key <keyID>

```

## Git Credential Management - SSH Option (command line friendly)

``` bash

ssh-keygen -t ed25519 -C "myemail@domain.com"

```

- Copy public key to Github from `cat ~/.ssh/id_ed25519.pub`
- Replace ~/.gitconfig with my gitconfig or:

``` bash

git config --global user.name "My Name"
git config --global user.email "myemail@domain.com"
git config --global pull.rebase false

```

### Windows

``` powershell

# This single command will generate Git SSH keys and copy them into clipboard so can easily setup Git and GitHub on a new computer
# source: Windows 11 dotfiles by https://github.com/nikitarevenco/dotfiles

New-Item -ItemType Directory -Path $env:USERPROFILE\.ssh -Force; ssh-keygen -t ed25519 -f"$env:USERPROFILE\.ssh\id_ed25519" -N '""' ; type "$env:USERPROFILE\.ssh\id_ed25519.pub" | clip

```
