---
id: fda4035c-d254-4532-9833-952d8041038b
title: Azure CLI Snippets
---

\#filetags: :azure:snippets:epubnote:

- Use help and portal UI for help with values like types and resource
  IDs

``` shell

# Log in with interactive prompt
az login

# Disable the subscription selector feature [1]
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

### Azure Kubernetes Service

``` shell

# Set cluster subscription, get cluster credentials and use kubectl commands
az account set --subscription sub1
az aks get-credentials --resource-group rg-1 --name aks-c1 --overwrite-existing
kubectl get deployments --all-namespaces=true

```

## See Also

- [KQL Snippets](/garden/notes/005-computer-snippets-kql)

## References

- \[1\] [Sign into Azure interactively using the Azure
  CLI](https://learn.microsoft.com/en-us/cli/azure/authenticate-azure-cli-interactively?view=azure-cli-latest)
