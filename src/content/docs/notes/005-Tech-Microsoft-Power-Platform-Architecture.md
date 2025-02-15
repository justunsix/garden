---
date: 2023-02-23
description: Well-Architected Power Platform Solutions
filetags: ":microsoft:power:platform:epubnote:"
id: bd35fa4e-5acc-4d48-a223-b078412bca8c
title: Microsoft Power Platform Architecture
---

Source: My notes from Microsoft session led by Sravani Seethi on
2023-02-23

## Agenda

- Power Platform pillars and solutions
- Design:
  - Selection of applications, automation, data storage
  - Applications classification

## Pillars and Solutions

- Pillars: Power Pages, Power Apps, Power Automate, Power BI, Power
  Virtual Agents
- Tools: Connectors, Dataverse, [Power
  Fx](https://github.com/microsoft/Power-Fx/tree/main), AI Builder
- Pro developers can also use all Azure and data services

### Solutions

- Packages all Power Platform pieces into one place, packaged as a unit

- Types:

  - Managed
    - Solution is locked, cannot be edited
    - Used for deployments
  - Unmanaged
    - Open folder so more things can be added like flows, Power Platform
      assets

- Solutions help with migration, collaboration, consistency

- Lifecycle: Make changes, export, install, patch, roll up patches and
  start changes again

## Designing

### Application Selection

1.  Canvas vs Model-driven Apps

    - Canvas:
      - For user experience
      - Visually appealing
      - Mobile and table apps
      - Can use all connectors
      - Limited capabilities are included in Office 365 licenses
      - Security and access is managed on data source
      - Can use entities in Dataverse
    - Canvas pros and cons
      - Good for business and pro developers
      - Personal to enterprise use
      - Data source flexibility
      - Custom UX
      - Gaps and alternatives:
        - Reporting - use PowerBI
        - Performance - use multiple canvas/model apps
        - Time to build - use reusable components, containers, generate
          apps from images/figma file/API
        - Delegation - use with data model design
        - Limited UX controls, though purposely limited for
          accessibility - use custom Power Apps Custom Framework (PCF)
          with Typescript
        - External non-guest users - use with Power Pages
    - Model-driven:
      - Start with Dataverse database
      - App building using set components
      - Web and mobile apps
      - Tied to Dataverse tables
      - No capabilities within Office 365 licenses
      - Security is role based and row level security to data
      - Can use business process flows, code add-ins. real time work
        flows
    - Model-drive pros and cons
      - Business and pro developers
      - Out of box controls, rules and processes
      - Data ETL tools
      - Built in Excel and Word generation
      - Hybrid canvas/model
      - Needs Dataverse
      - Gaps and alternatives
        - Large data volumes - virtual entities
        - Limited UI modification - custom controls, canvas app, JS, PCF
        - Limited to Dataverse - use canvas app
        - External non-guest users - Power Pages

2.  Selection Guide

    - Non-dataverse, use canvas app
    - Complex data, use model driven
    - Minimal licensing, use canvas app

### Power Virtual Agents

- Low code
  - SaaS hosted low/no-code
  - Using Azure bot service
  - Voice channels
- Pro code
  - Open source framework
  - Build bots from code
  - Composer offers visual authoring

### Automation Selection

1.  Power automate and custom connectors

    - Flows
      - Like automations, work flows, validations
      - Alternatives to meet gaps:
        - Logic Apps
        - Dataflows
    - Custom connectors
      - For pro developers
      - Reuse API, use APIs
      - Alternatives to meet gaps:
        - Azure API, functions

2.  Power Automate Flows

    Use different triggers

    - Cloud flows:
      - Uses different triggers
      - Automated, instant, scheduled
      - Use case: process automation and batch processing
    - Desktop
      - Use case: UI and desktop automation
    - Business process flow (BPF)
      - Use case: Business process automation
      - Works with Dataverse
    - Can be limited by licensing for calls. Consider logic apps for
      high volume of calls

### Data Selection

1.  Data Flows

    - ETL tool to extract data, tranform data, and load to destination
      like Dataverse
    - Use DAX language

2.  Scalable Data

    Evaluate security, capacity, complexity to choose data sources.
    Common ones are:

    - SharePoint
    - Dataverse
    - On premise data
    - Cloud storage

    1.  Sample Use Cases

        - Simple team app: SharePoint or Dataverse with canvas app
        - Small organization app: Dataverse or SharePoint with smaller
          data with canvas or model app
        - Complex business application: Dataverse, SQL with canvas/model
          app
        - Enterprise, large applications: SQL with canvas/model app

3.  Power Apps Delegation for Data

    - Power Apps will delegate data processing to the data source rather
      than doing processing locally
    - Power Apps is limited to 500-2000+ records to local device /
      browser

## Solution Complexity Drivers

Drivers:

- Number of:
  - Users and stakeholders
  - Customizations
  - Business rules
- Organization(s)
- Requirements maturity
- Data volume
- Testing needs
- Deployment
- Support model (app owner to large technical team)
- Delivery model like citizen developer, pro developer, to team
  development
- Development cycle
- Time allowed for MVP
- Change frequency
- Return on investment / "payback"
- Suitability to Power Apps use cases
- App criticality to business based on above drivers
