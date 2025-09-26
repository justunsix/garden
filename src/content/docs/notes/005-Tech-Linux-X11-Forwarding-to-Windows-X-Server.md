---
date: 2025-09-18
filetags: ":linux:windows:x11:forwarding:epubnote:"
id: f444201a-136a-4af2-a15f-1fc7fb10bc92
title: X11 Forwarding on Linux to GUI Programs on Windows
---

Article describes how to set up a new Ubuntu machine for X11 forwarding
to run graphical application remotely and display them on a Windows
machine. Steps done on Windows can be used on other machines with X
Servers for a similar experience.

Source: [Forward X Over SSH -
Baeldung](https://www.baeldung.com/linux/forward-x-over-ssh)

It assumes you start with a new Ubuntu installation and need to install
programs on Windows.

## Set up Ubuntu Linux Operating System


    sudo apt update -y
    # Install packages required for x11 forwarding
    sudo apt install xauth x11-apps openssh-server
    # xauth: authentication
    # x11-apps: basic X11 apps for testing (optional)
    # openssh-server: for SSH access
    # Some of these packages may already be installed

    # Configure SSH for X11 Forwarding using the lines below
    sudo nano /etc/ssh/sshd_config

    # Restart the SSH service
    sudo systemctl restart ssh

In the `/etc/ssh/sshd_config` , verify these lines at set:

``` text
X11Forwarding yes
X11DisplayOffset 10
X11UseLocalhost yes
```

X11Forwarding allows the forwarding. X11DisplayOffset setting makes sure
the remote display does not interfere with the main X11 display on
Linux. X11UseLocalhost no will set set all displays to be remote or not,
while yes allows local displays.

### Troubleshooting

If the SSH service does not restart successfully, reboot the Linux
machine.

## Set up Windows and Connect to Linux

Install an X Server like VcXsrv or Xming. Run the X Server setup using
the X Launcher. Starter settings for VcXsrv's X Launcher are:

- Display setting: Multiple Windows
- Display number: leave at the default
- Client start: Start no client

### Setting up SSH Client

Install and setup a SSH client PuTTY to enable X11 forwarding under the
"Connection \> SSH \> X11 \> Enable X11 forwarding". The PuTTY setting
is similar to modifing an SSH's client to use the following:
`ssh -X username@host`. If using key authentication, set it up under SSH
\> Auth. Import or create new keys using the key generator included with
PuTTY.

### X Server Connection and Seeing X11 Applications

Connect to the Ubuntu machine and run a test with `xeyes`. A graphical
window of the application should appear on the Windows machine with a
pair of eyes that follow the mouse.
