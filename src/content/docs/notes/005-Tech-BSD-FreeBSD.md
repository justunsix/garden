---
filetags: ":bsd:unix:epubnote:"
id: b0d13824-4d3b-4afe-adcf-efd4d8b8d299
title: FreeBSD
---

## Install

- Use dvd1 ISO which contains all packages
- Use text installer, mostly select defaults unless you have different
  keyboards
- For disk partitioning, select default or choose your own
  - If using AutoZFS, can use stripe and select main disk
- Set up automatic Networking, Time
- Select OS options
- Add user account. For users that will do administrative functions,
  make sure to add user to `wheel` group to allow sudo/doas command use

### Software and packages

Choose scripts at [justunsix/devops-tests FreeBSD provisioning scripts -
GitLab](https://gitlab.com/justunsix/devops-tests/-/tree/main/2-operating-system-and-linux/virtualization/provisioner/freebsd)
for example for additional packages and installing GNOME.

## References

- [FreeBSD Handbook](https://docs.freebsd.org/en/books/handbook/)
- [How to Install and Configure FreeBSD (2027 Edition) - tony -
  YouTube](https://www.youtube.com/watch?v=TmFl7QTvWPs)
