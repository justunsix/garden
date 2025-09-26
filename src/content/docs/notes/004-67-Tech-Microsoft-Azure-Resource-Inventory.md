---
date: 2025-09-23
filetags: ":microsoft:tech:azure:devops:epubnote:"
id: 83fd5c28-14e6-4f7b-b9db-6baaeb64f3bb
title: Azure Resource Inventory
---

Source: [GitHub - microsoft/ARI: Azure Resource Inventory - It's a
Powerful tool to create EXCEL inventory from Azure Resources with low
effort](https://github.com/microsoft/ARI)

Use case: Track resources to help manage them.

## Example usage

Get an Excel of resources matching a tenant, subscription, resource
group and tag.

``` powershell

Invoke-ARI `
-TenantID <id> `
-SubscriptionID <id> `
-ResourceGroup <rg> `
-TagKey DeploymentKey `
-TagValue <mytag> `
-Debug -SkipDiagram -Lite

```
