---
filetags: ":it:domain:epubnote:"
id: 11ede8b0-a261-4eb3-99bd-753b985c6179
title: Free Domains
---

## Instructions from Article Above

- Register accounts on [https://nic.eu.org](https://nic.eu.md) (domain
  registrar) and Hurricane Electric <https://dns.he.net/> (DNS Provider)

- Apply for a new domain, for example under the Canadian subdomain
  (\<new subdomain\>.ca.eu.org)

- When applying for the name, under the Name1, Name2, … fields, put the
  name servers for the provider. For example using Hurricane Electric
  would be:

  Name1: ns1.he.net IP1 \<blank\> Name2: ns2.he.net IP2 \<blank\> Name3:
  ns3.he.net IP3 \<blank\> …

- Submit and you will receive an output like below

- Await approval which may be up to couple weeks or less

### Sample Registration

``` txt

---- Servers and domain names check

Getting IP for NS1.HE.NET: 216.218.130.2
Getting IP for NS1.HE.NET: 2001:470:100::2
Getting IP for NS2.HE.NET: 216.218.131.2
Getting IP for NS2.HE.NET: 2001:470:200::2
Getting IP for NS3.HE.NET: 216.218.132.2
Getting IP for NS3.HE.NET: 2001:470:300::2
Getting IP for NS4.HE.NET: 216.66.1.2
Getting IP for NS4.HE.NET: 2001:470:400::2
Getting IP for NS5.HE.NET: 216.66.80.18
Getting IP for NS5.HE.NET: 2001:470:500::2

---- Checking SOA records for SWIFTIRIS.CA.EU.ORG

SOA from NS1.HE.NET at 216.218.130.2: serial 2023080506 (12.452 ms)
SOA from NS1.HE.NET at 2001:470:100::2: serial 2023080506 (14.122 ms)
SOA from NS2.HE.NET at 216.218.131.2: serial 2023080506 (12.966 ms)
SOA from NS2.HE.NET at 2001:470:200::2: serial 2023080506 (14.242 ms)
SOA from NS3.HE.NET at 216.218.132.2: serial 2023080506 (13.302 ms)
SOA from NS3.HE.NET at 2001:470:300::2: serial 2023080506 (17.064 ms)
SOA from NS4.HE.NET at 216.66.1.2: serial 2023080506 (11.792 ms)
SOA from NS4.HE.NET at 2001:470:400::2: serial 2023080506 (16.625 ms)
SOA from NS5.HE.NET at 216.66.80.18: serial 2023080506 (18.106 ms)
SOA from NS5.HE.NET at 2001:470:500::2: serial 2023080506 (18.073 ms)

---- Checking NS records for SWIFTIRIS.CA.EU.ORG

NS from NS1.HE.NET at 216.218.130.2: ok (14.053 ms)
NS from NS1.HE.NET at 2001:470:100::2: ok (17.815 ms)
NS from NS2.HE.NET at 216.218.131.2: ok (13.634 ms)
NS from NS2.HE.NET at 2001:470:200::2: ok (16.255 ms)
NS from NS3.HE.NET at 216.218.132.2: ok (13.324 ms)
NS from NS3.HE.NET at 2001:470:300::2: ok (19.943 ms)
NS from NS4.HE.NET at 216.66.1.2: ok (13.824 ms)
NS from NS4.HE.NET at 2001:470:400::2: ok (17.392 ms)
NS from NS5.HE.NET at 216.66.80.18: ok (18.249 ms)
NS from NS5.HE.NET at 2001:470:500::2: ok (19.572 ms)


No error, storing for validation...
Saved as request 20230805161128-arf-29148

Done
```

## References

- [Get Permanent Free Domain Name from EU.ORG & Integrate with
  Cloudflare – Cybersecurity
  Memo](https://www.51sec.org/2021/04/04/apply-permanent-free-domain-name-from-eu.org/?expand_article=1)
