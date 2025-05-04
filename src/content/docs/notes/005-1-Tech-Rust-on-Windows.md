---
filetags: ":rust:windows:msys2:epubnote:"
id: 06fcfe47-81b3-4717-9a77-bb261b3b7376
title: Rust on Windows
---

## Installing Rust on Windows without Rustup or Visual Studio

Source: [RUST 02: Installing RUST on Windows Without Visual Studio -
YouTube](https://www.youtube.com/watch?v=pdqPNTL6uDk) and adapted with
less dependencies and [atuin-win/.github/workflows/build.yml at main ·
Magniquick/atuin-win ·
GitHub](https://github.com/Magniquick/atuin-win/blob/main/.github/workflows/build.yml)

Before shell steps below, install [MSYS2](https://www.msys2.md/). For
detailed steps, see the source video.

``` powershell

# Open a Windows terminal like in PowerShell or cmd
# Go into the UCRT64 system of MSYS2
ucrt64

```

Then install rust toolchain in MSYS2

``` shell

# Install rust toolchain
pacman --noconfirm -Syu mingw-w64-ucrt-x86_64-rust
# --noconfirm - do not prompt for confirmation
# mingw-w64-ucrt-x86_64-rust - installs rust compiler rustc, cargo

# Optionally, install rust-analyzer, a compilar frontend useful for development
pacman --noconfirm -Syu mingw-w64-ucrt-x86_64-rust-analyzer

```

To access the rust executables from Windows, add them to your user's
path. Find the MSYS2 binaries for the UCRT64 system. For example, if
MSYS2 was installed:

- With standard installer, the binary folder is `C:\msys64\ucrt64\bin`
- By scoop, the binary folder is
  `C:\Users\yourusername\scoop\apps\msys2\current\ucrt64\bin`

``` powershell

# Add to user's path, use the path to the correct folder for your MSYS2 install
[Environment]::SetEnvironmentVariable("Path", $Env:Path + ";C:\Users\yourusername\scoop\apps\msys2\current\ucrt64\bin;C:\Users\yourusername\.cargo\bin", "User")
# Also adds the cargo binaries folder
# Close the shell session to see the new path

# In a new PowerShell session, check rust is installed
Get-Command rustc
Get-Command cargo

```
