---
filetags: ":microsoft:tech:azure:cloud:paas:epubnote:"
id: 82cd7fee-3e7c-4c71-ae88-7f6b6ce9cfdc
title: Microsoft Azure
---

## Azure Monitor

### Log Analytics Workspace (LAW)

- Check resources with logs flowing to the LAW: Go to LAW, Monitoring \>
  Insights \> Usage tab

### Learning

1.  Reading

    - [Azure monitor
      overview](https://docs.microsoft.com/en-us/azure/azure-monitor/overview)
    - [Azure platform
      logs](https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/platform-logs-overview)
    - [Azure activity
      log](https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/activity-log) with
      sample queries

2.  Tutorials

    - [Log Analytics
      Tutorial](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/log-analytics-tutorial) -
      you can do everything in your browser
    - [Get started with log queries in Azure
      Monitor](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/get-started-queries) -
      you can do everything in your browser
    - [Collect and analyze resource logs from an Azure
      resource](https://docs.microsoft.com/en-us/azure/azure-monitor/essentials/tutorial-resource-logs) -
      this tutorial can be tried out using the dashboard's development
      environment

3.  Implementation

    - [Log analytics usage, cost, data volume
      management](https://docs.microsoft.com/en-us/azure/azure-monitor/logs/manage-cost-storage)

4.  Related learning

    - [Kusto Query Language
      tutorial](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/tutorial?pivots=azuremonitor)
    - [Kusto operator
      reference](https://docs.microsoft.com/en-us/azure/data-explorer/kusto/query/)
    - [Microsoft Learn: Azure monitor related
      courses](https://docs.microsoft.com/en-us/learn/browse/?roles=administrator%2Cai-engineer%2Cdata-analyst%2Cdata-engineer%2Cdata-scientist%2Cdatabase-administrator%2Cdeveloper%2Cdevops-engineer%2Csecurity-engineer%2Csolution-architect&resource_type=learning%20path&wt.mc_id=esi_lxp_webpage_wwl&expanded=azure&filter-products=monitor&products=azure-monitor)
    - [Analyze your Azure infrastructure by using Azure Monitor
      logs](https://docs.microsoft.com/en-us/learn/modules/analyze-infrastructure-with-azure-monitor-logs/)
    - [Microsoft Learn: Monitor Azure Resources
      course](https://docs.microsoft.com/en-us/learn/modules/design-monitoring-strategy-on-azure/1-introduction)

5.  Architecture

    - [Unified logging for microservices
      applications](https://docs.microsoft.com/en-us/azure/architecture/example-scenario/logging/unified-logging)

## Azure Open Source Day 2022-02-15

- Can use VS Code in browser and full experience in GitHub codespaces
- Use ports tabs in VS Code to open running programs locally. In
  Codespaces, open remote applications using ports list

## Azure Demo on Demand

2021-07-17

[Video](https://azure.microsoft.com/en-us/get-started/webinar/on-demand/)
with Eric D. Boyd

Agenda:

1.  Azure portal overview and cost management
2.  Build an Azure Virtual Machine with Windows
3.  Build a web app and deploy it to Azure App Service
4.  Create an Azure SQL Database - server and database

### Portal Overview

Home screen with:

- Left - menu of services:
  - Use "All Services" \> filter to find specific ones. Hover over
    service and star to favourite
  - Create resources, Marketplace
  - Cost Management and Billing - see subscriptions and account, can
    configure spending limit
- Top - recent services
- Bottom - tools, learning
- Settings (Gear) to change views, language preferences
- ? - help for support requests, shortcuts
- Search
  - "Free services" to see them for trial and always free

### Virtual Machines

Create a resource using marketplace pre-built images or configure a new
one.

- Search marketplace for Windows Server
- Use [Azure
  Geographies](https://azure.microsoft.com/en-ca/global-infrastructure/geographies/)
  to find a region near you and features, availability zone, upcoming
  places. [3D Global
  infrastructure](https://infrastructuremap.microsoft.com/explore).
  Consideration:
  - User locations
  - Compliance, data regulations
  - Available services by region
- Set admin credentials and later on join to Azure AD
- Set up Network Security Group (NSG) and deny all for RDP/SSH and then
  allow your IP to RDP/SSH and set allow rule as higher priority
- Create VM, then explore:
  - Its resource to connect (RDP, SSH, Bastion), stop, capture an image
    of it
  - Left menu - Export template JSON

### Build an Deploy Azure App Service (Web apps)

Can be done from IDE, like [VS Code to Azure
deployment](https://code.visualstudio.com/docs/azure/deployment)

Automation? use PowerShell or Azure CLI

### Create an Azure SQL Database — server and database

- Creates a DB server automatically with nodes
- SQL Database created based on your admin configuration and performance
  (vCore, DTU (older model but valid), server-less vs provisioned
  (persistent) etc.)
  - Least expensive option is vCores with server-less - good for
    development
  - Server name has a FQDN
  - Add your client address to the SQL *server* firewall
  - Use SQL Studio or VS Code MSSQL extension to login

### Resources

- [Azure Documents](https://docs.microsoft.com/en-us/documentation/) -
  getting started, architecture, DevOps, service documentation
- [Microsoft Learn](https://docs.microsoft.com/en-us/learn/)
- [Azure
  Advisor](https://portal.azure.com/?quickstart=true#blade/Microsoft_Azure_Expert/AdvisorMenuBlade/overview)
- [Azure Pricing](https://azure.microsoft.com/en-us/pricing/) -
  estimates
- [Azure Status Dashboard](https://status.azure.com/en-us/status) -
  monitor all Azure services
- [Support Plans](https://azure.microsoft.com/en-us/support/plans/)

## See Also

- [Microsoft Technologies](../005-tech-microsoft) section: [Microsoft
  Azure Technologies](id:d54649b7-e39b-4974-bab4-e32abbb37d32)

### Resources

- [Microsoft Azure Well-Architected
  Framework](https://docs.microsoft.com/en-us/azure/architecture/framework/)
