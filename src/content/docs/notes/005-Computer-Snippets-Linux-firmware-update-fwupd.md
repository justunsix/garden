---
date: 2026-08-20
filetags: ":snippets:epubnote:fwupd:firmware:update:linux:"
id: a6f591f2-bdc7-4812-995b-033f545ce657
title: Linux firmware update fwupd Snippets
---

``` shell

# To display all devices detected by fwupd
fwupdmgr get-devices
# Listed devices may not be updatable through fwupd (e.g. Intel integrated graphics). Alternative vendor solutions may be provided instead.

# To download the latest metadata from the Linux Vendor firmware Service (LVFS)
fwupdmgr refresh
# Enable automatically by enabling fwupd-refresh.timer

# To list updates available for any devices on the system
fwupdmgr get-updates

# To install updates
fwupdmgr update

```

## References

- [fwupd - ArchWiki](https://wiki.archlinux.org/title/Fwupd)
