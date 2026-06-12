---
id: fda4035c-d254-4532-9833-952d8041038b
title: Azure CLI Snippets
---

\#filetags: :azure:snippets:epubnote:

- Use help and portal UI for help with values like types and resource
  IDs

``` shell

# Log in with interactive prompt
az logi n

# Disable the subscription selector feature
az config set core.login_experience_v2=off
az login

# Log in using a device code from web browser
az login --use-device-code

# Change subscriptions
az account set --subscription <subscription>
az account set --subscription 34342sdd-353-2428-cc453432ref3

# Show account information
az account show

```

## See Also

- [KQL Snippets](/garden/notes/005-tech-snippets-kql)
