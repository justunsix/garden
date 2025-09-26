---
filetags: ":microsoft:fabric:epubnote:"
id: 74adb143-2282-4633-a6ec-ae28df638881
title: Microsoft Fabric
---

## Introduction to Microsoft Fabric

Source: Training session by Microsoft on 2025-09-08

### Use case

Need to analyze data in different data sources and provide reports for
various user needs

Analytics capabilities: Data integration, engineering, warehouse, real
time analytics, data science, business intelligence

### Fabric Features

Microsoft Fabric integrates analytics capabilities using secure
technologies with governance and service management. It is compatible
with AI platforms and open data lake. "Like Microsoft Office" and
Software as a Service (SaaS) for data by managing data sources to users.

Fabric features:

- Data extraction, loading, transformation: Data Factory
  - Connectors provide integration, built in transformations
- Real time intelligence
- Databases
  - Encryption enabled
- Analytics: data engineering, warehouse, data science with AI Models,
  Synapse
  - Apache Spark for pipelines
  - Machine learning
- Data visualization and analytics: PowerBI
- AI: Copilot
- Data storage: OneLake, Data warehouse
- Governance, Security, Compliance: Purview
- Infrastructure: compute and storage is shared by workloads, billing by
  usage in Microsoft Fabric capacity

For infrastructure (Fabric capacity), capacity management is centralized
and allows scaling and cost management. It is defined in capacity units
(CUs) which is compute power. See [Fabric
Licensing](https://learn.microsoft.com/en-us/fabric/enterprise/licenses)

Users and developers have access to graphical user interfaces (GUI), low
code, and programmming interfaces.

### Demonstrations

Central interface in Fabric to access all its features.

- Create workspaces, manage databases, pipelines, and other Fabric items
- Create a new item, select a semantic model for use in a new report.
- Use monitor to track activities like pipeline runs and their details
- Admin: manage settings, users, logs
- Security and privacy settings and viewing in Purview
- Data storage: create lakehouse and choose connector/shortcut to data
  sources. Example, use shortcut to link to AWS S3 images. OneLake
  integrates with Windows like OneDrive. Add tables from a databases
  into the data lake
  - Allows integration with SQL, notebooks
  - Assign relationships, row level security
- Users: can access tables for PowerBI reports, manage table
  relationships and DAX queries and then create a report.
  - AI Copilot can help with data analysis for report creation and
    answer questions on data
  - Reports can be shared and exports to Microsoft Office

### Managing Fabric Items

- Data integration options
  - Shortcuts: referencing data sources without copying
  - Mirroring: read only replication to data lake
- Access levels:
  - Platform
    - Domain
      - Workspace
        - Compute
        - Item level access
- Generative AI
  - Monitoring of data, user interactions

## See Also

- [Data Basics and Use Cases with Microsoft
  Fabric](../004-data-processing-tech-data-science-use-cases-microsoft-fabric) -
  [Data Basics and Use Cases with Microsoft
  Fabric](id:444c1c69-ea8b-4858-a008-2ce3a61ae4ee)
- [Data Warehouse vs Data Lakehouse vs Data
  Lake](../005-tech-database-vs-data-warehouse-lakehouse-lake) - [Data
  Warehouse vs Data Lakehouse vs Data
  Lake](id:b3f202ea-9b8a-434b-b5ad-096a321e117e)
