---
filetags: ":devops:security:microsoft:epubnote:"
id: 583e4050-964c-4a68-b736-6ae27cb5aaff
title: Service Connections for Microsoft DevOps
---

## Workforce Identity Federation (WIF)

### Use case

- Using WIF, allows access to Microsoft Entra protected resources
  without managing secrets
  - Avoid disadvantages of secrets and certificates like expiration and
    synchronization
  - Allows trust with an external identity provider
  - Works with user-assigned managed identity or app registration in
    Microsoft Entra ID to trust tokens from an external identity
    provider (IdP), such as GitHub or Google
- Examples include use in GitHub actions, Kubernetes, and compute
  platforms outside Azure

### Example of Migrating from Service Principle Name (SPN)

- If using SPNs with Azure DevOps, the SPNs can be migrated to WIFs
- An option is to convert SPNs. Another option is having a WIF created
  and moving pipelines to use the WIF while keeping the SPN until you
  are satisfied the WIF is working [using ARM service
  connection](https://learn.microsoft.com/en-us/azure/devops/pipelines/library/connect-to-azure?view=azure-devops)
  \[cite:@ramimsftUseAzureResource\].

## References

<div id="refs">

</div>
