---
date: 2026-03-03
description: Data science flows and artificial intelligence platforms
  and AI building full stack application
filetags: ":microsoft:event:artificial-intelligence:training:epubnote:"
id: 21ab993d-0a72-465f-b2d7-3c5a10f7db16
title: Microsoft Developer Day 2026 at Work
---

Source: My personal notes from a developer day with Microsoft at work

## Artificial Intelligence (AI) Technology Platform Design Concepts

### Service functionality

- Managed infrastructure
- Configuration, less code
- Multiple clouds available (Azure, AWS, GCP)
- Secure
- Good defaults: selection of models

### Interfaces for clients

- API access for all services
- Agent
  - Catalogue with different task types like document generation and
    management, research, validation, forms, data queries
  - Model Context Protocol (MCP) open standard for LLM to tool
    communication described in [Develop AI agents on
    Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-agents) -
    [Agents in Azure AI
    Solutions](id:eae5da2e-f013-42af-8128-cc2ae5c28b0f)
- Model connectors - vendor and open source models
  - Model configuration, version controlled
- Data and Storage - vaults, repositories, cache, search
  - Search, filtering
  - Caching, response caching
  - [Retrieval Augmented Generation
    (RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag) -
    [Retrieval Augmented Generation
    (RAG)](id:4a445fad-74c1-42c9-bba8-fe0c067b6d23)
- Governance - security and administration
  - Token quotas, content safety, security mitigation in place,
    identity, client secrets
  - Security team

## GitHub Copilot to Build a Full Stack Application

See [GitHub Copilot, Building a Full Stack
Application](/garden/notes/006-3-tech-ai-microsoft-github-copilot-building-a-full-stack-application) -
[GitHub Copilot, Building a Full Stack
Application](id:df455313-58fd-4658-ab23-76597a349174)

## Azure Databricks and Fabric, Data Analytics and AI

Use case: Start with data, securely transform, structure, and share data
for use. Enable data science work while preserving data ownership.

### Platform options

Azure Databricks \<– mirror functions –\> Microsoft Fabric

Azure Databricks:

- [Data Warehouse vs Data Lakehouse vs Data
  Lake](/garden/notes/005-tech-database-vs-data-warehouse-lakehouse-lake) - [Data
  Warehouse vs Data Lakehouse vs Data
  Lake](id:b3f202ea-9b8a-434b-b5ad-096a321e117e) (OneLake)
- Data catalog, data models and governance (Unity Catalog (UC))

Microsoft Fabric:

- Data Factory - ETL, data transformations
- Analytics - Azure Synapse, Power BI
- Databases
- Governance - Purview
- AI - Copilot

### Using the Platforms' Tools

Use Case followed by Tool

- Data analysis with building agents - Use DataBricks, Fabric, Copilot
  Studio
- Analytics AI assistant - DataBricks AI/BI Genie
- Data access and application management - Azure AI Foundry
- Semantic models and ontology (defined relationships and definitions)
  to allow for reports and self service - Fabric IQ

## Power Platform for Developers

Overview of [Microsoft Power
Platform](/garden/notes/005-tech-microsoft-power-platform) - [Microsoft Power
Platform](id:3a07fa69-d143-48f4-bcda-e2c6222aeeb9) for low code, vibe
code, and pro code development of analytics, apps, workflows, agents,
and AI.

### Solution Development Cycle

Demonstration: provide requirements within Power Apps vibe code
interface to build app. Development is done in web interface. Could
connect to SharePoint, Dataverse for data and files.

Integrate with VS Code Power Platform plugin to build and manage app.

In Azure DevOps, there are Power Platform pipelines where solution
packages can be deployed to different environments.

- Artifact: Power Platform solution
- Task: Deployment to specified environment

## See Also

- [GitHub](/garden/notes/005-computer-tech-github)
- [Microsoft Power Platform](/garden/notes/005-tech-microsoft-power-platform)
- [Microsoft Technology](/garden/notes/005-tech-microsoft) - [Microsoft
  Technology](id:fd8af895-8c3f-483c-80a9-e082b1e62581)
