---
filetags: ":termux:android:terminal:epubnote:"
id: 917e0b31-da04-4c4f-bcca-a706dcf597cc
title: Termux
---

## Install

Use [F-Droid](https://www.f-droid.org/) store (do not use Google Play).

In Termux, to hide keyboard: You can show/hide the virtual keyboard, by
swiping right (in from the left of the screen) to open the "drawer",
then pressing the button labeled "keyboard" (might need to try it a
couple times), then swiping left to close the drawer.

### Install SSHD

Follow [Termux Wiki Remote
access](https://wiki.termux.com/wiki/Remote_Access), OpenSSH option.

``` bash
# Upgrade all packages
pkg update
pkg upgrade
# Install Openssh packages
pkg install openssh
# Get username of Termux
whoami
# Set password of user
passwd
# Get IP of phone
ifconfig | grep "inet "
# Start SSHD server
sshd
```

Follow [Termux:Boot](https://wiki.termux.com/wiki/Termux:Boot) to enable
SSHD on start up

Switch to your SSH client machine

``` bash
ssh -p 8022 username_from_termux@phone_IP
# Accept known hosts
```

If issues check the following:

- Deactivate VPNs on client/server
- Deactivate mobile phone's mobile network

### Install Termux API

[Follow Termux wiki API page](https://wiki.termux.com/wiki/Termux:API)

Install on F-Droid and use

``` bash
# Install in terminal
pkg install termux-api
# Check API installed ok and can read from phone
termux-battery-status
```

### Use Magisk to Control Superuser rights

In the Magisk app, switch to the "shield" tab to grant individual apps
`su` rights.
