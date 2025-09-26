---
filetags: ":logic:app:api:management:azure:epubnote:"
id: c0f4f9c9-a550-46c1-965a-43e6ccbf3348
title: Azure Logic App
---

## Example Demonstration of Using Logic App for Sending Notifications

Using Postman application for testing the logic app

- Sending binary image
- Sending notifications for SD-WAN operations

Logic app designer example within Azure portal

- When a HTTP request is received
  - JSON post
  - HTTP POST URL is long
- Describe image
  - Computer vision AI recognition of images (free tier)
    - Configure API call and selected computer vision service
- For each
  - Take output from previous step, in this case, the image descriptions
  - Use adaptive card to post information to Teams
- Execute SQL

Security options for IAA

- Basic authentication
- Key
- OAuth2.0, OpenID connect
- Certificate

## Front Logic app endpoint behind API management

- For development use, use consumption tier
- Using developer tier with less security, network, SLA features - good
  enough for simple use case
- Provides a static URL to front the logic app to increase accessibility
- Restrict calls for example by frequency and IPs
- Key vault integration
- Security?
  - Can be presentation tier, security behind APIs
- Created product for subscriptions to allow users to be access API
  - Manage products
    - Manage versions
    - Has git repository
  - Policy fragments - reusable fragments to be reused in other
    policies, still `xml`
