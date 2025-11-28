---
date: 2025-07-26
filetags: ":linux:apple:mac:mac-mini:epubnote:"
id: 6701e52e-d877-4256-bbf0-4657b2d2d4bd
title: Install Linux on Mac Mini
---

The following describes steps to install Ubuntu GNU/Linux on [Mac mini
(Late 2014), also called Mac mini
7,1](https://support.apple.com/en-us/111931) as of July 26, 2025.

The install works with the [Ubuntu install
instructions](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)
with the Ubuntu 24.04 LTS release. Based on internet posts, older
versions of Ubuntu Linux and Manjaro/Arch Linux can work for the Mac
mini Late 2014 model.

The install works mostly out of the box with the Ubuntu 24.04 LTS
installer except for steps required for the Broadcom Wireless network
driver which will require a Ethernet cable connection before the WIFI is
available. [^1] [^2]

The installation assumes using an HDMI monitor. As of writing, the
Ubuntu image does not recognize an Apple Thunderbolt monitor until after
updates are made to the system.

More detailed instructions with screenshots for the steps below are at
\[\[<https://linuxsimply.com/linux-basics/os-installation/dual-boot/ubuntu-on-mac/>\]\[Install
Ubuntu on Mac \[Dual Boot\] - LinuxSimply\]\].

## Prepare Boot Media and MacOS

- Follow the [Ubuntu install
  instructions](https://ubuntu.com/tutorials/install-ubuntu-desktop#1-overview)
  to create an bootable USB.
- On MacOS, back up your data.
- To keep MacOS installed, create a separate partition using the Disk
  Utility. This partition will be used to install Ubuntu.
- Insert the USB with Ubuntu

## Reboot into Ubuntu Installer

- Reboot the Mac mini
- Hold down the Option key (Alt key on US keyboards). Wait until you see
  the boot disk selection screen and choose EFI.
- If having troubles with getting the selection screen to come up, try
  turning off the Mac mini and turning it back on and holding the Option
  key

### Rebooting back into MacOS

If you need to ever boot back into MacOS before or after installing
Linux, you can repeat the steps above:

- Reboot the Mac mini
- Hold down the Option key (Alt key on US keyboards). Wait until you see
  the boot disk selection screen and choose the MacOS disk.
- If having troubles with getting the selection screen to come up, try
  turning off the Mac mini and turning it back on and holding the Option
  key

## Install Ubuntu

- Once in the Ubuntu installer, follow the [Install Ubuntu Desktop \|
  Ubuntu](https://ubuntu.com/tutorials/install-ubuntu-desktop#5-installation-setup)
  instructions.
- In the installer, choose the Manual Installation. The following are
  disk partition settings based on a 500 GB partition that is free:
  - 10 GB to `swap`, chosen to be more than 8 GB RAM on the Mac mini
  - Rest of space as ext4 mounted to `/`
  - The above is just a suggestion.
- Make sure to select the main disk with the name "APPLE" on it for the
  boot loader location.
- Continue with the installation and reboot into Ubuntu when ready.

## Update Ubuntu, Activate Broadcom Wireless driver

- Assuming you have a Ethernet cable connection to the internet, update
  Ubuntu using the Software Updater or using the terminal.
  - If using the terminal, the follow commands will get the latest
    updates and install them

``` shell

sudo apt update
sudo apt upgrade -y
# Reboot
sudo reboot

```

- Reboot the Mac mini and log into Ubuntu again
- Per steps explained in the footnotes, install the Broadcom Wireless
  Drivers from Ubuntu packages [^3] [^4] :

``` shell

sudo apt install bcmwl-kernel-source

```

- Reboot the Mac mini and log into Ubuntu again
- Configure wireless networking settings in Ubuntu's Wi-Fi settings if
  needed

## Wi-Fi, Thunderbolt Display, Booting back into MacOS

After the updates, the Wi-Fi should work.

An Apple Thunderbolt display initially did not work during the operating
system install and first logins. Testing shows after the updates listed
above, plugging in the display with no other displays allows the
Thunderbolt display to work. Both display and sound on the Apple
Thunderbolt monitor work. For sound, it may be required to set Ubuntu's
sound to use the Thunderbolt display audio instead of the built-in Mac
mini audio.

To boot back into MacOS, reboot the Mac mini and hold the Option key
(Alt key on US keyboard) until you see the disk selection screen and
select MacOS.

## See Also

### Resources

[^1]: [Installing Broadcom Wireless Drivers - Ask
    Ubuntu](https://askubuntu.com/questions/55868/installing-broadcom-wireless-drivers)

[^2]: [Linux on an old Mac
    mini](https://medium.com/@woodywang2013/linux-on-an-old-mac-mini-f8cb63b7657f)

[^3]: [Installing Broadcom Wireless Drivers - Ask
    Ubuntu](https://askubuntu.com/questions/55868/installing-broadcom-wireless-drivers)

[^4]: [Linux on an old Mac
    mini](https://medium.com/@woodywang2013/linux-on-an-old-mac-mini-f8cb63b7657f)
