---
filetags: ":linux:epubnote:"
id: a5c9c331-d295-420c-9376-4cfe20224216
title: GNOME Tips
---

## Switch Audio Outputs

- Open pavucontrol-qt, GUI for Pulse Audio

## Nautilus File Manager Tips

Source: [13 Quick Tips to Make Linux File Manager Nautilus Even Better -
It's FOSS](https://www.youtube.com/watch?v=Ia2CaItxTEk)

- Recent files are accessible from top item of left menu
- Open terminal in folder with context menu

``` bash
# Configure Nautilus to create new documents in right click menu
# Add files in the `~/templates` folder and Nautilus will automatically read them
cd ~/Templates
touch "New Text Document.txt"
# Add any other file templates you want to add to the menu

# Preview files with spacebar, requires:
sudo apt install gnome-sushi -y
```

Other tips:

``` bash
# Resize images from context menu, requires:
sudo apt install imagemagick nautilus-image-converter -y

# Change colours of folders, then choose colours you want
sudo apt install folder-color -y

# Open files as administrator in context menu, requires:
sudo apt install nautilus-admin -y

# Check hashs with context menu, requires:
sudo apt install nautilus-gtkhash -y
```

- Bookmark files and folders in the left menu

## Desktop Entries

Like application shortcuts and binaries

[Application
entry](https://wiki.archlinux.org/title/Desktop_entries#Application_entry):

> Desktop entries for applications, or .desktop files, are generally a
> combination of meta information resources and a shortcut of an
> application. These files usually reside in *usr/share/applications* or
> *usr/local/share/applications* for applications installed system-wide,
> or ~/.local/share/applications/ for user-specific applications. User
> entries take precedence over system entries.

## Keyboard

The key combination for ç in US international with dead keys layout was
there all along, but unlike the other Latin diacritics it does not
involve a dead key:

AltGr+,+c=ç

AltGr+Shift+,+C=Ç

AltGr is simply `right alt`

## PDF Reader

In GNOME, use Evince (default) and use settings to choose night mode

## See Also

- [Linux GNOME Ubuntu
  Shortcuts](../005-computer-shortcuts-linux-gnome-ubuntu) - [Linux
  Ubuntu GNOME Shortcuts](id:4b892508-403a-42ad-b2f1-63eff470fb74)
