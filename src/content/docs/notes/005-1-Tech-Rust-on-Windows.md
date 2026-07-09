---
filetags: ":rust:windows:msys2:epubnote:"
id: 06fcfe47-81b3-4717-9a77-bb261b3b7376
title: Rust on Windows
---

Source: [RUST 02: Installing RUST on Windows Without Visual Studio -
YouTube](https://www.youtube.com/watch?v=pdqPNTL6uDk) and adapted with
less dependencies and [Workflow build - Magniquick/atuin-win ·
GitHub](https://github.com/Magniquick/atuin-win/blob/main/.github/workflows/build.yml),
[Rust on Windows, No Visual Studio,
link.exe](https://dev.to/realacjoshua/-ditching-visual-studio-how-i-built-rust-on-windows-the-open-source-way-4m9e),
and [rustup on Windows - Rust up
docs](https://rust-lang.github.io/rustup/installation/windows.html)

## Installing Rust on Windows without Rustup or Visual Studio

Before shell steps below, install [MSYS2](https://www.msys2.org/) which
does not require administrator rights. If you have administrator rights,
install with [Rustup](https://rustup.rs/) instead.

For detailed steps, see the source video.

``` powershell

# Open a Windows terminal like in PowerShell or cmd
# Go into the UCRT64 system of MSYS2
ucrt64

```

Then install [rust tool chain in
MSYS2](https://packages.msys2.org/packages/mingw-w64-ucrt-x86_64-rust):

``` shell

# Install rust toolchain
pacman --noconfirm -Syu mingw-w64-ucrt-x86_64-rust
# --noconfirm - do not prompt for confirmation
# mingw-w64-ucrt-x86_64-rust - installs rust compiler rustc, cargo

# Optionally, install rust-analyzer, a compiler frontend useful for development
pacman --noconfirm -Syu mingw-w64-ucrt-x86_64-rust-analyzer

```

Tool chain includes [rustc, clippy, cargo, and other tools explained in
the package
files](https://packages.msys2.org/packages/mingw-w64-ucrt-x86_64-rust).

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

# In a new PowerShell session, check rust compiler and cargo installed
Get-Command rustc
Get-Command cargo

```

## Installing with Rustup

### Install Visual Studio Tools

This option only installs the command line tools which is smaller
instead of the full Visual Studio suite.

- Go to [Download Visual Studio Tools - Install Free for Windows, Mac,
  Linux](https://visualstudio.microsoft.com/downloads/)
- Scroll down and check Windows and C++
- Scroll down to Build Tools for Visual Studio 2026 or current year and
  download and install it
- Start the installation, and choose Desktop C++ for the install tools

### Install with Rustup

- Install with [rustup.rs - The Rust toolchain
  installer](https://rustup.rs/)

### Optional: Install Tools

Install a rustfmt (formatter), clippy (linter), and rust-analyzer
(language server) to support development:

`rustup component add rustfmt clippy rust-analyzer`
