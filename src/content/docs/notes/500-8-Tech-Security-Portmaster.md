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

## User Interface Features

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

## Example Set up

- Install
- See documentation on [Portmaster DNS
  Configuration](https://docs.safing.io/portmaster/guides/dns-configuration)
  and [CIRA DNS Encryption with DNS over TLS (DoT)
  help](https://www.cira.ca/en/canadian-shield/configure/dns-tls/)
- Set up DNS server using CIRA below or using "Quick Settings" for
  cloudflare with malware protection

``` shell

# CIRA Malware and phishing protection example
dot://protected.canadianshield.cira.ca?ip=149.112.121.20&name=cira&blockedif=zeroip
dot://protected.canadianshield.cira.ca?ip=149.112.122.20&name=ciratwo&blockedif=zeroip

# Cloudfare malware protection
dot://cloudflare-dns.com?ip=1.1.1.2&name=Cloudflare&blockedif=zeroip
dot://cloudflare-dns.com?ip=1.0.0.2&name=Cloudflare&blockedif=zeroip

```

- Choose most filter lists:
  - \[x\] Ads & Trackers
  - \[x\] Malware
  - \[x\] Deception
  - \[x\] Mixed Ads/Trackers/Malware
  - [x] Big Tech as needed
  - Experimental
    - [x] Windows Spy Blocker
  - \[x\] Unbreak Popular Websites
- If using Portmaster and Secure DNS with an application like Firefox,
  you can disable it in the application
