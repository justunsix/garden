---
filetags: ":azure:arm:bicep:epubnote:"
id: 6e157bf9-523b-4774-b068-9381031866a3
title: Azure Resources Manager (ARM)
---

## Deploy Azure Resources with Arm Templates & PowerShell

Video taught by Navika Chhauda

### What are Azure Resources Manager (ARM) Templates and Why Use Them

Use case: Create infrastructure from code instead of manually and record
infrastructure as code (IaC).

Benefits: reuse, time efficiency, continuous deployment and integration,
track deployments

1.  Parts of an ARM Template

    - Input: JavaScript Object Notation File (JSON)
    - Configure a resource
    - Declarative syntax

### ARM Template Structure

Properties:

- schema: template version
- contentVersion: version of content
- parameters: inputs from user
- functions: methods
- variables dynamic values
- resources: what to deploy
- outputs: what to generate after ARM template is applied

### Demos: Deployment Resources using AR

- Use VS Code, use ARM extension
- Create ARM template from scratch using structure elements from above
- Using ARM! snippet in VS Code, create a blank template

``` json

{
    "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
    "contentVersion": "1.0.0.0",
    // Parameters are to get input from user
    "parameters": {
        // example
        // "storagename": {
        //     "type": "string",
        //     "metadata": {
        //         "description": "Name of the storage account"
        //     }
        // }
    },
    "functions": [],
    // Optional variables can be reused
    "variables": {
        // Create storage account name from a
        // unique string generated from numbers 2,6,4
        "stname": "[concat('storage',uniqueString('264'))]"
    },
    // Most Azure resources are available for creation
    // In VS Code, see templates using arm- and C-Space
    "resources": [
        {
            // Refer to stname specificed in variables
            "name": "[variables('stname')]",
            "type": "Microsoft.Storage/storageAccounts",
            "apiVersion": "2023-04-01",
            "tags": {
                "displayName": "[variables('stname')]"
            },
            "location": "[resourceGroup().location]",
            "kind": "StorageV2",
            "sku": {
                "name": "Premium_LRS",
                "tier": "Premium"
            }
        }

    ],
    "outputs": {}
}

```

### PowerShell Scripting

- Use Case: Need software to automate, deploy, and manage Azure
  resources

- PowerShell: Command line tool, helps with automation, scripting
  language, can do deployment of resources

- Steps of deployment resources using PowerShell

  - Connect to Azure
  - Get/Set subscription
  - Create
    - Create resource group (RG) if needed
  - Deploy resources
    - During deploy, you can observe progress in Azure portal under
      resource group \> Deployments

- Commands may require Cmdlets to be installed from PowerShell gallery

- Usage:

  - Scripts of PowerShell commands
  - Dynamic scripts
  - Loops, conditions, error handling
  - Define variables like \$var, can add numbers and concatenate strings

### ARM Templates and PowerShell

- Deploy ARM json using CLI, like PowerShell, can run like in terminal
  or PowerShell ISE

``` powershell

# Connect to Azure
Connect-AzAccount
# Check subscription
Get-AzSubscription
# Can reuse existing RG or create new one like:
New-AzResourceGroup -Name "test1" -Location "CanadaCentral"
# Deployment the resource using an existing RG called test1
# Point to filled in ARM template file
New-AzResourceGroupDeployment -ResourceGroupName test1 -TemplateFile "/path/to/ARM-file.json"

# Get virtual machines
Get-AzVM
$totalVM=Get-AzVM
$count=0

foreach($vm in $totalVM) {
    $count = $count + 1
}
$count

Write-Host("Total VMs in subscription is $count")

if ($count -gt 1) {
    Write-Host("Sorry, no more VMs can be deployed, maximum 1 VMs reached")
}
else {
    # vm.json below has
    # - storage account
    # - public IP
    # - network
    # - NSG
    # - VNet
    # - Sub network
    # - VM
    #   - Password is specified as well
    New-AzResourceGroupDeployment -ResourceGroupName test1 -TemplateFile "vm.json"
    Write-Host("New VM deployed")
}

```

- You can retrieve a template from an existing resources using export
  template in the Azure Portal from the resource

1.  vm.json

    - Make sure the VM name is unique

    ``` json

    {
        "$schema": "https://schema.management.azure.com/schemas/2019-04-01/deploymentTemplate.json#",
        "contentVersion": "1.0.0.0",
        "parameters": {
            // specific relevant parameters below
        },
        "functions": [],
        "variables": {
            // specific relevant variables below
        },
        "resources": [
            {
                "type": "Microsoft.Storage/storageAccounts",
                "apiVersion": "2023-04-01",
                "name": "[variables('storageAccountName')]",
                "location": "[parameters('location')]",
                "sku": {
                    "name": "Standard_LRS"
                },
                "kind": "Storage"
            },
            {
                "type": "Microsoft.Network/publicIPAddresses",
                "apiVersion": "2023-11-01",
                "name": "[parameters('publicIpName')]",
                "location": "[parameters('location')]",
                "sku": {
                    "name": "[parameters('publicIpSku')]"
                },
                "properties": {
                    "publicIPAllocationMethod": "[parameters('publicIPAllocationMethod')]",
                    "dnsSettings": {
                        "domainNameLabel": "[parameters('dnsLabelPrefix')]"
                    }
                }
            },
            {
                "type": "Microsoft.Network/networkSecurityGroups",
                "apiVersion": "2023-11-01",
                "name": "[variables('networkSecurityGroupName')]",
                "location": "[parameters('location')]",
                "properties": {
                    "securityRules": [
                        {
                            "name": "default-allow-3389",
                            "properties": {
                                "priority": 1000,
                                "access": "Allow",
                                "direction": "Inbound",
                                "destinationPortRange": "3389",
                                "protocol": "Tcp",
                                "sourcePortRange": "*",
                                "sourceAddressPrefix": "*",
                                "destinationAddressPrefix": "*"
                            }
                        }
                    ]
                }
            },
            {
                "type": "Microsoft.Network/virtualNetworks",
                "apiVersion": "2023-11-01",
                "name": "[variables('virtualNetworkName')]",
                "location": "[parameters('location')]",
                "properties": {
                    "addressSpace": {
                        "addressPrefixes": [
                            "[variables('addressPrefix')]"
                        ]
                    },
                    "subnets": [
                        {
                            "name": "[variables('subnetName')]",
                            "properties": {
                                "addressPrefix": "[variables('subnetPrefix')]",
                                "networkSecurityGroup": {
                                    "id": "[resourceId('Microsoft.Network/networkSecurityGroups', variables('networkSecurityGroupName'))]"
                                }
                            }
                        }
                    ]
                },
                "dependsOn": [
                    "[resourceId('Microsoft.Network/networkSecurityGroups', variables('networkSecurityGroupName'))]"
                ]
            },
            {
                "type": "Microsoft.Network/networkInterfaces",
                "apiVersion": "2023-11-01",
                "name": "[variables('nicName')]",
                "location": "[parameters('location')]",
                "properties": {
                    "ipConfigurations": [
                        {
                            "name": "ipconfig1",
                            "properties": {
                                "privateIPAllocationMethod": "Dynamic",
                                "publicIPAddress": {
                                    "id": "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIpName'))]"
                                },
                                "subnet": {
                                    "id": "[resourceId('Microsoft.Network/virtualNetworks/subnets', variables('virtualNetworkName'), variables('subnetName'))]"
                                }
                            }
                        }
                    ]
                },
                "dependsOn": [
                    "[resourceId('Microsoft.Network/publicIPAddresses', parameters('publicIpName'))]",
                    "[resourceId('Microsoft.Network/virtualNetworks', variables('virtualNetworkName'))]"
                ]
            },
            {
                "type": "Microsoft.Compute/virtualMachines",
                "apiVersion": "2023-03-01",
                "name": "[parameters('vmName')]",
                "location": "[parameters('location')]",
                "properties": {
                    "hardwareProfile": {
                        "vmSize": "[parameters('vmSize')]"
                    },
                    "osProfile": {
                        "computerName": "[parameters('vmName')]",
                        "adminUsername": "[parameters('adminUsername')]",
                        "adminPassword": "[parameters('adminPassword')]"
                    },
                    "storageProfile": {
                        "imageReference": {
                            "publisher": "MicrosoftWindowsServer",
                            "offer": "WindowsServer",
                            "sku": "[parameters('OSVersion')]",
                            "version": "latest"
                        },
                        "osDisk": {
                            "createOption": "FromImage",
                            "managedDisk": {
                                "storageAccountType": "StandardSSD_LRS"
                            }
                        },
                        "dataDisks": [
                            {
                                "diskSizeGB": 1023,
                                "lun": 0,
                                "createOption": "Empty"
                            }
                        ]
                    },
                    "networkProfile": {
                        "networkInterfaces": [
                            {
                                "id": "[resourceId('Microsoft.Network/networkInterfaces', variables('nicName'))]"
                            }
                        ]
                    },
                    "diagnosticsProfile": {
                        "bootDiagnostics": {
                            "enabled": true,
                            "storageUri": "[reference(resourceId('Microsoft.Storage/storageAccounts', variables('storageAccountName')), '2022-05-01').primaryEndpoints.blob]"
                        }
                    },
                    "securityProfile": "[if(equals(parameters('securityType'), 'TrustedLaunch'), variables('securityProfileJson'), null())]"
                },
                "dependsOn": [
                    "[resourceId('Microsoft.Network/networkInterfaces', variables('nicName'))]",
                    "[resourceId('Microsoft.Storage/storageAccounts', variables('storageAccountName'))]"
                ]
            },
            {
                "condition": "[and(equals(parameters('securityType'), 'TrustedLaunch'), and(equals(variables('securityProfileJson').uefiSettings.secureBootEnabled, true()), equals(variables('securityProfileJson').uefiSettings.vTpmEnabled, true())))]",
                "type": "Microsoft.Compute/virtualMachines/extensions",
                "apiVersion": "2023-03-01",
                "name": "[format('{0}/{1}', parameters('vmName'), variables('extensionName'))]",
                "location": "[parameters('location')]",
                "properties": {
                    "publisher": "[variables('extensionPublisher')]",
                    "type": "[variables('extensionName')]",
                    "typeHandlerVersion": "[variables('extensionVersion')]",
                    "autoUpgradeMinorVersion": true,
                    "enableAutomaticUpgrade": true,
                    "settings": {
                        "AttestationConfig": {
                            "MaaSettings": {
                                "maaEndpoint": "[variables('maaEndpoint')]",
                                "maaTenantName": "[variables('maaTenantName')]"
                            }
                        }
                    }
                },
                "dependsOn": [
                    "[resourceId('Microsoft.Compute/virtualMachines', parameters('vmName'))]"
                ]
            }

        ],
        "outputs": {}
    }

    ```

### When to choose BICEP vs ARM

- You can use both, no wrong choice
- Bicep is more concise and easier to read
- Export in Azure Portal uses ARM template and underneath a BICEP
  approach uses ARM for deployment

## See Also

- [Azure Resources Manager and
  Bicep](/garden/notes/005-computer-tech-devops-azure-resources-manager-arm-bicep) -
  [Azure Resource Management (ARM) and
  Bicep](id:5011a880-eca6-4b02-85a6-52a465d0dbd1)

### Resources

- [Deploy Azure Resources with Arm Templates &
  PowerShell](https://www.youtube.com/watch?v=__I3jQfZ5gg)
