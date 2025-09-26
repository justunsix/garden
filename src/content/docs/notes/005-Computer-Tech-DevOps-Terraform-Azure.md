---
filetags: ":devops:terraform:epubnote:"
id: 1a54acd2-4463-4917-bb08-dfcb4a0e8ced
title: Terraform - Azure
---

## Steps to Learn and Apply Terraform to Cloud Resources Using an Azure Example

Summary: Learn about the cloud provider and the resource you want to
create. Create a resource manually in the cloud provider. Observe or
export the results of the resource(s) created. Read the relevant
Terraform provider in the Terraform registry and cloud provider's
documentation on the resource. Use the registry and cloud provider
documentation/examples to create a Terraform configuration to recreate
the resource.

### Applying to Steps to Creating an Azure Shared Dashboard

1.  Learn [Fundamentals of Terraform on
    Azure](https://learn.microsoft.com/en-us/training/paths/terraform-fundamentals/)
    to learn concepts of Infrastructure as Code (IaC) and how to use
    Terraform's declarative syntax to manage Azure resources. Create an
    example Terraform workflow. Go through the [Azure with
    Terraform](https://learn.microsoft.com/en-us/azure/developer/terraform/overview)
    documentation.
2.  Follow [Create a dashboard in the Azure
    portal](https://learn.microsoft.com/en-us/azure/azure-portal/azure-portal-dashboards)
    to manual build a dashboard and its tiles in the Azure portal. A
    task for use with Terraform later is learning to export the
    dashboard to JSON.
3.  Using the [Terraform registry:
    azurerm<sub>portaldashboard</sub>](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/portal_dashboard)
    specifications and the Microsoft Azure documentation, start to
    create the Terraform configuration. Export the JSON of the manually
    created Azure dashboard. Place the JSON in the Terraform HCL files.
4.  THe [Microsoft.Portal
    dashboards](https://learn.microsoft.com/en-us/azure/templates/microsoft.portal/dashboards?pivots=deployment-language-terraform)
    reference has Bicep, ARM template & Terraform examples. It describes
    each configuration of the cloud resource that might be seen in the
    registry and used in the HCL files.
5.  Create the Terraform project, for example with files
    - `main.tf` - main configuration
    - `variables.tf` - input variables, for example locations, resource
      groups
    - `providers.tf` - provider for Terraform
    - `outputs.tf` - output variables

## Azure Terraform Example to Create a Resource Group

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

- [GitHub - trussworks/terraform-layout-example: Example of a Truss
  Terraform
  project](https://github.com/trussworks/terraform-layout-example) -
  organization and environment template
- [terraform-provider-azurerm/examples](https://github.com/hashicorp/terraform-provider-azurerm/tree/main/examples)
- [Build Infrastructure - Terraform Azure Example \| Terraform \|
  HashiCorp
  Developer](https://developer.hashicorp.com/terraform/tutorials/azure-get-started/azure-build)
