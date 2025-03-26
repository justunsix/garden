---
date: 2024-11-20
filetags: ":amazon:aws:training:epubnote:"
id: a890041d-1d82-4f44-91e7-c88fd16a296d
title: AWS Databases
---

Source: My personal notes from AWS training courses and cloud training
at work

## Overview of Database Migrations to AWS

- Migration of databases to AWS: use cases, options, examples
  - Tools and processes used

### Use Case

Business goals might be:

- Cost reduction:

  - Consolidation
  - Reducing capital costs
  - Outsource functions like:
    - Database failover, backup/recovery, compliance, patching
    - Infrastructure monitoring, maintenance
  - Simplify licensing
  - Use open source instead of commercial licenses with enterprise
    service levels
    - Example: Amazon Aurora
    - Case study: Amazon.com migrated from 7500 Oracle database to
      different AWS databases including DynamoDB, Aurora, RDS, Redshift

- Security and availability

  - Service levels

- Faster to deploy, destroy

- Allow teams to focus on functions like:

  - Increase database administrator productivity to allow them to
    concentrate on other work
  - Application development
  - Schema design, query optimization
  - Business innovation and functionality

### Options

- Re-platform: Relational and non-relationship databases available as
  Managed database services
  - Example: Columnar Amazon Redshift, Amazon RDS
- Re-host: Compute/container based hosting using EC2 or Container
  Services
- Re-factor: Change database
- Re-architect: Choose database types that fit business needs

### Journey in Migrations

3 steps:

- Assess
  - Business case
    - Costs
    - Assets
  - Sponsor
  - AWS guidance through support people, training
- Mobilize
  - Plan option, destination
  - Additional training
  - Operations, security, migration model
- Migration
  - Determine people/skills needed and get support if needed
  - Implement and transition to operations

Common issues:

- No business case
  - One time effort, cost
  - Organization not ready
- Technology complexity
- Data volume and attributes

### Building a Business Case

- Can use templates of common calculations "Directional Business Case":
  - Financial impact, savings
  - Database instance changes
  - Storage details
  - Assumptions
- Licensing Assessment
  - Assess existing environment
  - Provide recommendations on technology/business priorities
  - Calculate total cost of ownership and options of changes
  - Common outcome is reduce unneeded CPU/licenses or licensing
    levels/features
