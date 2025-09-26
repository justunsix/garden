---
filetags: ":azure:arm:bicep:epubnote:"
id: 5011a880-eca6-4b02-85a6-52a465d0dbd1
title: Azure Resource Management (ARM) and Bicep
---

## Introduction to infrastructure as code using Bicep

Source: [Introduction to infrastructure as code using Bicep - Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/introduction-to-infrastructure-as-code-using-bicep/)

- IAC can create infrastructure and give advantages of automation,
  accuracy, efficiency and consistency.
  - The deployments are easily repeatable, scalable to more environments
    using declarative approach with audit trails, secrets management,
    and system of controlling infrastructure
  - Using Azure CLI to implement concepts

Example bicep

``` bicep

resource storageAccount 'Microsoft.Storage/storageAccounts@2203-05-01' = {
  name: 'mystorageaccount'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
}

```

### ARM

- ARM is a service to deploy and manage Azure resources
- Has a control plane with authentication and data plane where requests
  are sent to an endpoint in an Azure subscription
- Two types of ARM templates:
  - JSON
  - Bicep - a Domain Specific Language (DSL) using an easier syntax than
    JSON

### What is Bicep

- Bicep is a DSL used only to create Resource Management templates
- It covers all resource types, API versions, and properties

Benefits of Bicep over JSON for template creation:

- Simpler syntax - less code and complex expressions
- Templates can be split into smaller module files to be references in
  main template
- Dependency management - Bicep usually detects dependencies between
  resources
- Type validation and Intellisense integration with editor and Azure
  resource type API definitions

Example Bicep template for an Azure Storage Account

``` bicep

param location string = resourceGroup().location
param namePrefix string = 'storage'

var storageAccountName = '${namePrefix}${uniqueString(resourceGroup().id)}'
var storageAccountSku = 'Standard_RAGRS'

resource storageAccount 'Microsoft.Storage/storageAccounts@2203-05-01' = {
  name: storageAccountName
  location: location
  kind: 'StorageV2'
  sku: {
    name: storageAccountSku
  }
  properties: {
    accessTier: 'Hot'
    supportsHttpsTrafficOnly: true
  }
}

output storageAccountId string = storageAccount.id
```

### How Bicep Works

- Tools working with Bicep will automatically convert Bicep to ARM JSON
  templates, process is transpilation
  - Done automatically during deployment

Same Azure CLI commands are used for deployment as ARM JSON templates

``` shell

az deployment group create --template-file main.bicep --resource-group storage-resource-group

# View the JSON template that's submitted to Resource Manager
# by using the bicep build command

bicep build main.bicep

```

### When to use Bicep

- Azure native and integration
- Supported by Microsoft
- No state management, Bicep deployments will compare the state of Azure
  resources with state in the template

Considerations on not using Bicep:

- Existing tools, knowledge, and financial investments
- Multiple clouds used in an organization as other cloud providers don't
  support Bicep

## Build a Bicep Template

Source: [Build your first Bicep template - Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/build-first-bicep-template/)

- Use case: A toy company needs to quickly create a new website using
  Azure App Service and a storage account for file

Approach:

- Resource definitions to deploy resources

  - Define storageAccount, appServicePlan, appServiceApp resources in
    Bicep
    - Relate the appServiceApp with the appServicePlan.id

- Parameters to make template reusable

- Variables and expressions to make it easier to write and deploy the
  template

- Modules to help structure the template into multiple files.

- Outputs to send data from the template and modules back to whoever or
  whatever is deploying your infrastructure

- Tools: VS Code, Azure CLI or PowerShell

### Create a Template and Deploy

`main.bicep`

``` bicep

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: 'toylaunchstorage'
  location: 'eastus'
  sku: {
    name: 'Standard_LRS'
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: 'toy-product-launch-plan-starter'
  location: 'eastus'
  sku: {
    name: 'F1'
  }
}

resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
  name: 'toy-product-launch-1'
  location: 'eastus'
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

```

``` powershell

# Go to location of the template, main.bicep
# Sign into Azure
Connect-AzAccount

# Look up subscriptions
Get-AzSubscription
# Set default subscription for later commands
$context = Get-AzSubscription -SubscriptionId {Your subscription ID}
Set-AzContext $context

# Deploy template to Azure - run the command again if template has changed
New-AzResourceGroupDeployment -TemplateFile main.bicep

# Verify deployment
Get-AzResourceGroupDeployment -ResourceGroupName [sandbox resource group name] | Format-Table

```

### Add flexibility by using parameters and variables

- Use parameters to allow reuse of template files with different
  parameters
- Parameters can call functions like to create unique names, specify
  permitted values

`main.bicep` with parameters defined first, then resources defined next
using the parameters

The environmentType conditional will use an if/then/else logic, so if
the environment is prod the first setting will be used, else, the other
setting

``` bicep

param location string = 'eastus'
param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'
param appServiceAppName string = 'toylaunch${uniqueString(resourceGroup().id)}'

@allowed([
  'nonprod'
  'prod'
])
param environmentType string

var appServicePlanName = 'toy-product-launch-plan'
var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'
var appServicePlanSkuName = (environmentType == 'prod') ? 'P2v3' : 'F1'

resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
  name: storageAccountName
  location: location
  sku: {
    name: storageAccountSkuName
  }
  kind: 'StorageV2'
  properties: {
    accessTier: 'Hot'
  }
}

resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
  name: appServicePlanName
  location: location
  sku: {
    name: appServicePlanSkuName
  }
}

resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
  name: appServiceAppName
  location: location
  properties: {
    serverFarmId: appServicePlan.id
    httpsOnly: true
  }
}

```

``` powershell

# Deploy the updated Bicep template selecting the nonprod environment
New-AzResourceGroupDeployment -TemplateFile main.bicep -environmentType nonprod

```

### Group related resources by using modules

- Outputs from the deployment are available, for example public IP
  address of created VMs and application names
  - Outputs should show secret values like connection strings and keys
  - Example
    `output ipFqdn string = publicIPAddress.properties.dnsSettings.fqdn`
- Templates can be split into modules like modules for a solution or
  resource specific modules like app, database, network

``` bicep

 module myModule 'modules/mymodule.bicep' = {
  name: 'MyModule'
  params: {
    location: location
  }
}

```

1.  Good practices for Modules

    - Module has a clean purpose like part of a solution
    - Module can combine resources or separate it out for a complex
      resource definition
    - Self contained - include variables in a module if they define part
      of a module
    - Have clear parameters and outputs and not output secrets

2.  Module approach of previous main.bicep

    `main.bicep`

    ``` bicep

    param location string = 'eastus'
    param storageAccountName string = 'toylaunch${uniqueString(resourceGroup().id)}'
    param appServiceAppName string = 'toylaunch${uniqueString(resourceGroup().id)}'

    @allowed([
      'nonprod'
      'prod'
    ])
    param environmentType string

    var storageAccountSkuName = (environmentType == 'prod') ? 'Standard_GRS' : 'Standard_LRS'

    resource storageAccount 'Microsoft.Storage/storageAccounts@2023-05-01' = {
      name: storageAccountName
      location: location
      sku: {
        name: storageAccountSkuName
      }
      kind: 'StorageV2'
      properties: {
        accessTier: 'Hot'
      }
    }

    module appService 'modules/appService.bicep' = {
      name: 'appService'
      params: {
        location: location
        appServiceAppName: appServiceAppName
        environmentType: environmentType
      }
    }

    output appServiceAppHostName string = appService.outputs.appServiceAppHostName

    ```

    `appService.bicep`

    ``` bicep

    param location string
    param appServiceAppName string

    @allowed([
      'nonprod'
      'prod'
    ])
    param environmentType string

    var appServicePlanName = 'toy-product-launch-plan'
    var appServicePlanSkuName = (environmentType == 'prod') ? 'P2v3' : 'F1'

    resource appServicePlan 'Microsoft.Web/serverfarms@2023-12-01' = {
      name: appServicePlanName
      location: location
      sku: {
        name: appServicePlanSkuName
      }
    }

    resource appServiceApp 'Microsoft.Web/sites@2023-12-01' = {
      name: appServiceAppName
      location: location
      properties: {
        serverFarmId: appServicePlan.id
        httpsOnly: true
      }
    }

    output appServiceAppHostName string = appServiceApp.properties.defaultHostName

    ```

    Deployment is similar to previous steps

    ``` powershell

    New-AzResourceGroupDeployment `
      -TemplateFile main.bicep `
      -environmentType nonprod

    ```
