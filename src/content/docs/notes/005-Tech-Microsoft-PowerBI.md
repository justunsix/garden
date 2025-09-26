---
date: 2019-05-03
filetags: ":powerbi:microsoft:epubnote:"
id: a624927c-e3c0-4019-9a29-55fa523ec621
title: Microsoft PowerBI
---

Source: Microsoft training led by Krishna Mohan

## Course Summary

1.  Power Query, Pivot, View
2.  Data sources: import, direct query
3.  Data model, relationships, hiding info
4.  Measures, column management, shaping data
5.  Calculations, DAX, M, SQL server analysis services tabular
6.  Reports, visualizations
7.  Sharing: PowerBI desktop files or online, security (roles, data
    models, data sensitivity)
8.  Moving to operations: datasets, roles, workflow

## Requirements & Examples

- Development
  <http://sascha-kasper.com/dax-syntax-highlighting-for-notepad/>
- Near real time data: use direct query from start
- Online web data: Connect to a URL and choose data like tables to
  import. During refresh, PowerBI will get latest
- Complex DAX – import vs direct access functionality

## PowerBI Online

- PowerBI online workspaces: <https://app.powerbi.com/home>
- Dashboard – collection of visualizations – can be seen on mobile, web
- Hierarchy: PowerBI file
  - Reports
    - Pages
      - Visualizations
- Settings and Dashboard features
  - Comments
  - Q&A on data
  - Data dependencies
  - Usage metrics (for owners)
- Need governance on updates to pbix files, how dashboards are updated,
  users are informed
- Data classification: from high confidential to public.
- Alerts based on data

## Data

- Dataflows - Reusable data sets
  - Stored in Workspace, can store in Azure Data Lake for reuse
  - SQL datawarehouse – like SQL in Hadoop massive distributed
    architecture:
    - SQL master
      - SQL
      - SQL
      - SQL
      - SQL
- Refresh is set a data set level
- Datasets – can configure connection settings
  - Gateways – can be local on desktop, enterprise gateway on premise
    server. Gateway in production should be enterprise
  - Set up data sets, connections to files, databases, etc. Can test
    connections

## Viewing

- Bookmark – captures settings / page with filters, etc. applied
- Sharing:
  - P2P - personal workspaces like single dashboard and reports
  - Team workspace, Office 365 groups
  - Apps – a set of dashboards, reports, data
  - Other formats – web, SharePoint, email

## User Licensing

### Licensing

See PowerBI licensing online

### External Users

- Power BI + **Azure AD B2B** helps **seamlessly distribution** of Power
  BI Apps and dashboard to external users
- External users **can be licensed in three ways**
  - Premium Capacity
  - Assigned Power BI Pro license
  - Brings their own Pro license
  - Mobile App **is also supported**

## Governance & Deployment

- Online portal
- PowerShell scripts
- Governance - Distribution to Self Service Teams (Small) Teams which
  need more customization and analytical capabilities. Source Data
  Source Data Power Bl Desktop Queries Datasets Reports On -Premises
  Data Gateway Power BI Service Create/Collaborate My Workspace App
  Workspace Distribute Ad-hoc Sharing Content Packs Power BI Apps Power
  Bl Mobile Applications Analyze in Excel Shared Datasets
- Security:
  - Can work with ExpressRoute, encrypted connections
  - Microsoft Entra ID (aka AzureAD) integration
  - Row level – define security on desktop = role based filters
