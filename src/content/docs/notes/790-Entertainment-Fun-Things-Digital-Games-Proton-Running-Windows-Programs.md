---
date: 2025-11-16
filetags: ":game:epubnote:steam:proton:"
id: dfa9ea92-4b56-4ded-9949-839511a987e1
title: Running Windows Programs with Steam Proton
---

Source: [Install EA App under Steam/Linux/Proton ·
GitHub](https://gist.github.com/cannable/846c4500550f7814378b8d8a02eb1c1c)
describing installation of the EA Games' Application for managing their
games.

## Installation

1.  Create the directory `/home/your_username/Games/myprogram/pfx`
    - Directory is the Proton prefix for the program(s) and can be used
      for troubleshooting in future.
    - The directory must be in a location with sufficient disk space for
      installing the program. If the your `/home` mount is small,
      consider creating a directory on a mount with enough space.
2.  Download the application
3.  Add non-Steam game and find the installation `exe` file
4.  Edit the app's settings in Steam
    1.  Rename the app to "Name of Application" so it is easy to find in
        the Steam Library in the future
    2.  Remove contents of the "Start In" field
    3.  Set the launch options to
        \`STEAM<sub>COMPATDATAPATH</sub>="/home/your<sub>username</sub>/Games/myprogram/pfx"
        %command%\`. Feel free to add other options like
        \`RADV<sub>PERFTEST</sub>=gpl\`.
    4.  In the program's compatibility and force a version of Proton
        known to work with the program. For example, as of 2025-11-16,
        The EA App works with Proton Experimental.
5.  Launch and install the application and complete remaining setup like
    logins, granting permissions, and other things.
6.  Exit the app.
7.  Go back into the program's settings in Steam and change the Target
    to the actual executable of the program. For example, the EA App on
    Windows would be
    `/home/your_username/Games/ea/pfx/pfx/drive_c/Program Files/Electronic Arts/EA Desktop/EA Desktop/EADesktop.exe`
    - If you forget this step, every time you launch the app, it will
      run the installer instead of the target application.
8.  Launch the program again and confirm it works.

EA App workaround: If changing the target does not work after
installation, keep using the installer exe file and choose repair.
However, this step means you have to keep the installer exe file around
for using the EA App in Steam.

If having trouble launching games or find files, changes the "Target" to
explorer and start the program. A Windows Explorer window should open
for you to check files and run other programs described at [Wine
Snippets](/garden/notes/005-computer-snippets-wine) - [Wine
Snippets](id:d74e20b9-f1b8-4d8d-8747-71366f9ab90a)

## Adding Direct Launchers for Other Programs in the Proton prefix

1.  Add the exes to Steam via the add non-Steam game feature.
2.  After adding the title, edit the launch options and make them
    consistent with the program:
    1.  Set the same launch options so that the title runs in the same
        Proton prefix
    2.  Force the same Proton version under compatibility options

## See Also

- [How to Install Google Ads Editor on
  Wine](/garden/notes/005-tech-linux-wine-install-google-ads-editor) - [How to
  Install Google Ads Editor on
  Wine](id:e2427220-20d3-4fc9-8039-0c7729de49c5)
