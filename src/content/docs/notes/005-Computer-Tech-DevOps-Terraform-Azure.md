---
filetags: ":devops:terraform:epubnote:"
id: 1a54acd2-4463-4917-bb08-dfcb4a0e8ced
title: Terraform - Azure
---

## Azure Terraform Example

``` powershell

az login
# set to ADDS DEV Azure subscription azrdevod0156wrk
az account set --subscription "my-sub-id"

az ad sp create-for-rbac --role="Contributor" --scopes="/subscriptions/my-subscription-id"
Creating 'Contributor' role assignment under scope '/subscriptions/my-subscription-id'

# Need this information for Terraform set up
Creating 'Contributor' role assignment under scope '/subscriptions/...'
The output includes credentials that you must protect. Be sure that you do not include these credentials in your code or check the credentials into your source control. For more information, see https://aka.ms/azadsp-cli
{
    "appId": "xxxxxx-xxx-xxxx-xxxx-xxxxxxxxxx",
    "displayName": "azure-cli-2022-xxxx",
    "password": "xxxxxx~xxxxxx~xxxxx",
    "tenant": "xxxxx-xxxx-xxxxx-xxxx-xxxxx"
}

# Create a Terraform configuration file in the current directory
# hconfig.tf see below

# Initilize the terraform project
terraform init

# Format and validate the configuration
terraform fmt
terraform validate

# Plan changes and output to a plan
terraform plan -out=tplan

# Apply the plan
terraform apply tplan

# Inspect state
terraform show

# See state file and list resources
terraform state list

```

``` hcl

# We strongly recommend using the required_providers block to set the
# Azure Provider source and version being used
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

# Configure the Provider for Microsoft Azure
provider "azurerm" {
  features {}

  subscription_id = "my-subscription-id"
}

resource "azurerm_resource_group" "rg" {
  name     = "myterraformtestrg"  
  location = "canadacentral"
}

```

\>

## See Also

### Resources

- [terraform-provider-azurerm/examples](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples)
- [Build Infrastructure - Terraform Azure Example \| Terraform \|
  HashiCorp
  Developer](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build)
