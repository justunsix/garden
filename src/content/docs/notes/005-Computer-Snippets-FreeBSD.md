---
date: 2026-08-23
filetags: ":snippets:epubnote:freebsd:unix:bsd:"
id: 5b7e09a7-3a72-4200-b6f6-fd0d4fb2d377
title: FreeBSD Snippets
---

``` shell

# Check or install pkg
pkg

# Find a package
pkg search curl

# Read the manual page for pkg install
pkg help install

# Update the local package repositories catalogues for the Latest branch:
pkg update -f

# Install a package like curl and confirm (-y)
pkg install -y curl

# Install a package as regular user with doas
doas pkg install ghostty

# Remove a package
pkg remove curl

# Upgrade a package
pkg upgrade <pkgname>

# Upgrade all available packages
pkg upgrade

# Audit packages for vulnerabilities
pkg audit -F

# Update ports repository as needed
git -C /usr/ports pull

```

## User Operations

See FreeBSD virtual machine provisioning scripts at [Justin Tung /
DevOps Tests - GitLab](https://gitlab.com/justunsix/devops-tests)

``` shell

# Get root access
su

```

## Installing FreeBSD using pkg(8)

Follow [Chapter 2. Installing FreeBSD \| FreeBSD Documentation
Portal](https://docs.freebsd.org/en/books/handbook/bsdinstall/)

- Use freebsd installer
- Use defaults
- Add local user to `wheel` group to give them administrative access

## References

- [Chapter 8. Desktop Environments \| FreeBSD Documentation
  Portal](https://docs.freebsd.org/en/books/handbook/desktop/#desktop-environments)
- [Chapter 16. Security \| FreeBSD Documentation
  Portal](https://docs.freebsd.org/en/books/handbook/security/index.html)
- [pkg(8) FreeBSD Manual
  Package](https://man.freebsd.org/cgi/man.cgi?query=pkg&sektion=8&format=html)
