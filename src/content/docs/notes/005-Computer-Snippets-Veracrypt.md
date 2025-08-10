---
filetags: ":veracrypt:snippets:epubnote:"
id: 15f6ccb4-c2c4-492f-bbed-5baef9050f30
title: Veracrypt Snippets
---

Veracrypt CLI on Linux

``` bash

# Create a container using interactive prompts
sudo veracrypt --text --create vcdrive.vc

# Create container in current directory using a randomdata text file
## --text : start in text mode
## --create : create a container
## --size : M for megabytes, G gigabyters, K kilobytes
## --password : password, could be passed using script or prompted
## --volume-type : options: normal, hidden
## --filesystem : use FDAT for compatibility with Linux, MacOS, Windows, requires exfat utilities, can use ext4 for just Linux
## --pim 0 : default of 0
## --random-source : need for VeraCrypt to randomize hashes, minimum 320 and can be more characters
## --keyfiles : can be used with/without password, empty means disable interactive requests for keyfiles

# Create container in current directory using a randomdata text file
sudo veracrypt --text --create vcdrive.vc --size 10G --password=MySuperSecurePassword1! --volume-type=normal --encryption AES --hash sha-512 --filesystem ext4 --pim=0 --random-source randomdata.txt --keyfiles ""

# Mount the Veracrypt volume
## --text : text mode and not GUI
## --mount : container to use and mount point
## --protect-hidden: no or yes if there is a hidden partition in the volume
## --slot : optional, can specific volumes always mount in a specific slot and slout number can be used during dismount

# Mount the volume, make sure mount is available first
sudo mkdir /media/vc2
sudo veracrypt --text --mount vctest.vc /media/vc2 --password MySuperSecurePassword1! --pim 0 --keyfiles "" --protect-hidden no --slot 1 --verbose

# Listing mounted volumes
sudo veracrypt --text --list

# Dismount volumne using slot
sudo veracrypt --text --dismount --slot 1
# Dismount using directory
sudo veracrypt --text --dismount /media/vc2
# Dismount using Volume File Name
sudo veracrypt --text --dismount vctest.vc
# Dismount using Volume File Name Full Path - most reliable
sudo veracrypt --text --dismount /home/user1/Documents/vctest.vc

# Dismount all volumes
sudo veracrypt --text --dismount

```

## See Also

### Resources

- [Veracrypt on Command Line for Ubuntu
  Linux](https://arcanecode.com/2021/06/21/veracrypt-on-the-command-line-for-ubuntu-linux/)
- [VeraCrypt - Free Open source disk encryption with strong security for
  the Paranoid](https://veracrypt.io/en/Command%20Line%20Usage.html)
