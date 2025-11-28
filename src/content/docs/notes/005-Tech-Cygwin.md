---
filetags: ":cygwin:windows:epubnote:"
id: be40f6ad-ba59-47de-9d3b-2f361d24cb4e
title: Cygwin
---

## Useful packages

``` bash

# Install atuin and import fish history
# Install cargo-update to allow future updates
cargo install atuin cargo-update
atuin import fish

# Commands for reference

# Run the setup program with switches per:
# https://www.cygwin.com/faq/faq.html#faq.setup.cli
# -B = no admin
# -q = quiet
# -n = no shortcuts
# -N = no start menu shortcuts
# -d = no desktop shortcut
# -v = verbose
# -R = root directory of cygwin
# -s = site to get packages (do not use it for now due to problems), should be -s https://mirror.csclub.uwaterloo.ca
# -l = local package directory
# -P <comma-separated list of packages to install>
cmd /c %USERPROFILE%/scoop/apps/cygwin/current/cygwin-setup.exe -B -q -n -N -d -v -R %USERPROFILE%\scoop\persist\cygwin\root -l %USERPROFILE%\scoop\persist\cygwin\packages -P git,openssh,inetutils,p7zip,python3,fzf,fish,fzf-fish,fzf-bash,fzf-bash-completion,lynx,wget,rsync,tmux,stow,vim,make
# optional: ,dolphin
# or cmd:
cd C:\Users\username\scoop\apps\cygwin\current
.\cygwin-setup.exe -B -q -n -N -d -v -R c:\tools\cygwin -l C:\tools\cygwin -P git,openssh,inetutils,p7zip,python3,fzf,fish,fzf-fish,fzf-bash,fzf-bash-completion,lynx,wget,rsync,tmux,stow,vim,make
```

## Example Installed packages

- git
- SSH
- OpenSSH
- inetutils
- p7zip (Unix port of 7zip)
- emacs
- python3
- fish - [fish shell](https://fishshell.com)
- fzf with bash/fish key bindings and completion
- lynx - text browser or use Emacs eww instead
- rysnc
- wget

## Fish on Cygwin

### Cygwin on Windows

If `fish_config` does not work, try the following:

To get fish<sub>config</sub> to work, follow instructions at [Error
starting the fish<sub>config</sub> web ui in
WSL](https://unix.stackexchange.com/questions/597118/error-starting-the-fish-config-web-ui-in-wsl?newreg=d3076992e9c64dc09e353a517f4119ef)

``` bash

# switch to fish help
help
# observe the URL in your browser
# copy the part in front of /usr....
# e.g. /C:/usr/bin/ptbl/PortableApps/CygwinPortable

cd /usr/share/fish/tools/web_config
sudo chmod 777 webconfig.py
# modify webconfig.py
chmod 644 webconfig.py

# Run fish config
fish_config
# Open the URL provided
# Press enter to end sessions
```

``` python
# Change line to
# Open temporary file as URL
# Use open on macOS >= 10.12.5 to work around #4035.
fileurl = "file://" + f.name
# To something like
fileurl = "file:///C:/usr/bin/ptbl/PortableApps/CygwinPortable" + f.name
```

## Get Git credential manager set up for Git in Cygwin

Install latest release of [git-credential-manager: Secure,
cross-platform Git credential storage with
authentication](https://github.com/git-ecosystem/git-credential-manager)
Follow instructions to do `git config` for the manager or configure
individual repositories.
