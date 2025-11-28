---
date: 2025-11-24
descriptions: Instructions on installing Google Ads Editor on Wine
filetags: ":wine:tech:linux:windows:epubnote:google-ads-editor:"
id: e2427220-20d3-4fc9-8039-0c7729de49c5
title: How to Install Google Ads Editor on Wine
---

Follow the instructions below with Wine which use the MSI installer,
install extra fonts with `winetricks`, and run the editor executable.
Requires 64-bit install of `wine` and `winetricks`.

``` shell

# Create a new directory to store a Wine prefix just for the editor so it's easier to troubleshoot issues, any empty directory works
mkdir /path/to/WinApps/GoogleAdsEditor/pfx

# Set Wine prefix location and 64-bit architecture environment variables
export WINEPREFIX="/path/to/WinApps/GoogleAdsEditor/pfx"
export WINEARCH="win64"

# Download latest MSI version of the Google Ads Editor
curl https://dl.google.com/adwords_editor/google_ads_editor.msi -o ~/Downloads/google_ads_editor.msi
# URL and unability for msi to upgrade itself explained https://support.google.com/google-ads/thread/43692618/is-there-am-msi-installer-google-ads-editor?hl=en

# Open config and set to latest version of Windows
wine winecfg
# Install corefonts in case of issues viewing text
winetricks corefonts
# Install the editor
wine msiexec /i ~/Downloads/google_ads_editor.msi

# Run the editor, change the version number to the appropriate one for your installation
cd "/path/to/WinApps/GoogleAdsEditor/pfx/drive_c/users/yourusername/AppData/Local/Google/Google Ads Editor/14.11.4.0"
wine start google_ads_editor.exe

```

## Issues with Adding a Google Account in the Google Ads Editor

Click add account. If the sign in screen appears blank or black, click
around the black window to get the sign in to open in the Linux native
browser. After sign in, the accounts should work like normal.

The "Welcome" and "Sign In" screens may appear blank or black, possibly
due to missing things in the Wine prefix, but not sure.

## Why use the MSI Installer?

When running the `exe` version of the installer from the Google ad
editor website, it consistently gives an error
"FAILED<sub>TODEELEVATEMETAINSTALLER</sub>" when running with Wine and
installation cannot be finished. No fix for this error found yet.
