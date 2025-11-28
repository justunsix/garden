---
FILETAG: ":cloud:framework:epubnote:"
id: 661671e6-5811-4e12-85e0-06e99018716f
title: Cloud Adoption Framework (CAF)
---

Source: My personal notes from Microsoft course with cloud team

## Cloud Adoption Framework (CAF) Introduction

Business needs:

- Improved availability
- Priority is reliability
- Stability
- Automation

### Why is Cloud Adoption Important?

- Goal: digital transformation affecting:
  - Customers
  - Transform products to meet users
  - Operations optimization
- Areas for digital transformation:
  - Vision
    - People, Process, Technology
    - Transformation balance stability with speed and results
  - Culture
  - Organization's unique selling point
  - Capabilities
    - Security
    - Monitoring

### Microsoft Cloud Adoption Framework for Azure

Framework is on top of all work; not project or application specific.

Phases:

- Strategy
- Plan
  - Assets
- Ready
  - Cloud
  - Landing areas
  - Practice, training
- Adopt
  - Migration
  - Best practices
  - Improvements

Supports:

- Governance
  - Methods
- Manage
  - Baseline
  - Maturity

### Cloud Adoption Motivations

- Organization changes
- Leave data centres
  - Migrate existing workloads
  - Reduce infrastructure footprint
- Reduce capital costs
- End of support of technologies
- Compliance
  - Security
- Service improvements
  - Increased availability
  - Staff productivity
  - Availability

## CAF Phases

### Strategy

Build business case

- Motivation
- Business reasons
  - Check KPIs of business
    - Example: Increased observability, DR options, faster changes
- Financial, technical benefits
  - Check your costs/benefits and measure the "transformation value" of
    cloud adoption
- Microsoft has tools and templates to support planning

### Plan

- Rationalize
- Align with organization
- Skills gap and readiness plan
- Cloud adoption plan, maturity

### Ready

Understand:

- Operating model
- Design area
- Implementation options
  - Greenfield (new), Brownfield (mixed)
- Azure landing zones
  - Azure multi-subscription environment that is designed for:
    - Scale
    - Security
    - Network
    - Practices
  - Design principles:
    - Subscription freedom and delegate responsibility
    - Policy driven governance
    - Single control and management plane
    - Application centric, archetype neutral
    - Azure native design and platform roadmap alignment
  - Azure Landing Zone Design Areas:
    - Billing
    - Identity access management
    - Resource organization
    - Network
    - Security
    - Governance
    - Management
    - Automation
    - OPS specific: Many of the landing zone areas looks controlled by
      ITS. There are areas we share with ITS like resource organization,
      security and automation.

### Adopt

- Assess workloads –\> Deploy –\> Release

- Migration in releases

- Migration patterns:

  - Re-host (forklift)
  - Refactor
  - Re-architect
  - Rebuild
  - Replace

- App and data modernization

### Secure

- Access, Asset security and governance
- Foundation and continuous improvement
- Develop in an agile/sprint way due to large scope, minimum viable
  product

### Govern

- Current vs future state governance
  - Roadmap 3-5 years
- Governance tools
  - Azure native tools for cost, security, identity, resource
    consistency, deployment like Azure services:
    - Cost
    - Security
    - Blueprints
    - Advisor
    - RBAC
    - AD
    - Directory
    - Policy
    - Monitor
    - Change tracking
    - DSC
    - ARM Templates
    - Automation
    - Policy
    - Resource tagging
    - DevOps
    - Site Recovery
    - Backup
- Iteratively add controls to address risks

### Manage

- Methodology to enable cloud management
- Culture and organization
  - Cloud "Centre of Excellence" for innovation, implementation

## Azure Well-Architected Framework

- Cost optimization
- Operations
- Performance efficiency
- Reliability
- Security

Microsoft consult is available to apply the Azure Well-Architected
Framework to an example solution.

## See Also

### Resources

- [Microsoft Cloud Adoption Framework for Azure - Cloud Adoption
  Framework \| Microsoft
  Learn](https://learn.microsoft.com/en-gb/azure/cloud-adoption-framework/)
- [Get started: Build new products and services in the cloud - Cloud
  Adoption Framework \| Microsoft
  Learn](https://learn.microsoft.com/en-gb/azure/cloud-adoption-framework/get-started/innovate)
- [Azure migration guide - Cloud Adoption Framework \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/migrate/azure-migration-guide/?tabs=MigrationTools)
