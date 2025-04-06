---
filetags: ":security:network:epubnote:"
id: b8d7927c-a93b-45da-a622-a91f7c0b4945
title: Safing Portmaster
---

Source [Safing Portmaster Wiki](https://wiki.safing.io/)

The use case for Portmaster is to improve privacy and security by
blocking trackers and advertisements and managing connections on the
device. Security can be improved with [secure
DNS](https://wiki.safing.io/en/Portmaster/Feature/SecureDNS), firewall,
and monitoring.

When making changes in Portmaster, it is recommended to use default and
global settings for all applications and slowly make small
configurations if needed.

# User Interface Features

- Status of protection
- [Safing Privacy Network
  (SPN)](https://wiki.safing.io/en/Portmaster/App/SPN) - multiple
  identities for each app, geo unblocks
- Navigation - information, notifications, menu, tools, start/shutdown
- Side dashboard - view of applications
- Network activity
  - Filter, menus
  - Connections and their details
- Settings

# Set up

- Install
- Set up DNS server from CIRA

``` shell

# CIRA Malware and phishing protection
dot://protected.canadianshield.cira.ca
# or
doh://149.112.121.20?verify=protected.canadianshield.cira.ca&name=CIRAProtected1
# 2nd IP
doh://149.112.122.20?verify=protected.canadianshield.cira.ca&name=CIRAProtected2
# CIRA DNS Resolution only
dot://private.canadianshield.cira.ca

```

- Choose most filter lists:
  - \[x\] Ads & Trackers
  - \[x\] Malware
  - \[x\] Deception
  - \[x\] Mixed Ads/Trackers/Malware
  - [x] Big Tech as needed
  - \[x\] Unbreak Popular Websites
- If using Portmaster and Secure DNS with an application like Firefox,
  you can disable it in the application
