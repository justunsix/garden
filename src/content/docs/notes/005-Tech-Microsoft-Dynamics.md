---
filetags: ":microsoft:dynamics:epubnote:"
id: ffe5c447-66a0-4bf7-b566-a0c54d95e4cf
title: Microsoft Dynamics
---

Source: My notes from a demonstration of Dynamics by Microsoft

## Introduction to Microsoft Dynamics Offerings

Power Platform:

- Low/no code - with Office, Dynamics, Azure, standalone applications

- Power Apps - application development

- Power Automate - process automation

- Power BI - business analytics

- Power Virtual agents - intelligent, chat bots

- Power pages - external website

  - JS, Liquid Template

- Integrations:

  - Data connectors
  - AI builder
  - Microsoft Dataverse - data source for Power Platform
  - Power Fx - language used for low code
    - JavaScript supported
    - C# - for components for model driven app, canvas
  - Management tools

- Integrates with Office 365, Azure

- Apps:

  - Rapid web and mobile front end development, drag and drop
  - Types
    - Canvas app
    - Model driven app
  - Allows low/no code, developers also welcome

Dynamics 365:

- Key functions:

  - Supply chain
  - Marketing
  - Sales
  - Field & Service
  - Customer Service
  - Project Operations
  - Finance
  - Operations
  - Commerce

- Dynamics can integrate with Power Platform

- Security:

  - Microsoft Entra, formerly Azure Active Directory
  - Licensing: users
  - Authorization: Security groups
  - Logical / role based security is available in apps.
    - Uses Dataverse. Apps use specific data and metadata in Dataverse
      - e.g. Dataverse Environment A, Dataverse Environment B
      - Model Drive App, Canvas App, Portal use Dataverse logical
        security model

- Pre-built connectors

  - Built-in connectivity to cloud services, content, servies, database,
    APIs (many API connectors available)
  - Hybrid connectivity to on-premise via data gateway
  - Custom connectors supported
  - Connect to other data sources

- High level demo

  - Choose Environments
  - Create canvas app
  - Dataverse:
    - Tables, connections, gateways, etc.
    - There are standard tables, can be reused, enhanced
    - Changing data layer
    - No access to direct database. If needed, can use Azure SQL
    - Each Dynamics 365, brings its own standard tables
  - Model driven app
    - App is tied to Dataverse
  - Canvas
    - Can be used freely, does not need to tied to Dataverse
    - Data can come from anywhere
  - Example: Inspections - model driven app

- Power Platform Admin Centre

  - Set up environment, permissions, policies
  - User roles
    - e.g. user role is configured with specific permission from
      "Dataverse generic role" and configure what they can edit
  - Dataverse security

## Health Sector Use Case Context

- Possible flows focusing on Case Intake and Triage, Investigation and
  Inspections
- Public Sector examples
  - Dynamics 365 Customer Service / Case Management
    - Case Management
  - Dynamics Field Service
    - Food Inspections
    - Public Health
    - Natural Resources
    - Correctional Services
  - Power Platform
    - Various levels of government
- Demo
- Low code, point & click configuration
- Integration options
- Next steps

## Demo

- Incident - patient pick up with stretcher, patient on stretcher is
  dropped by accident.

## Customer Service

- Complainant: Complaints can log into a public portal on government
  site to view and report information. Anonymous use is permitted and
  external logins work too.
  - Power Pages/ Power Apps portal that is seamlessly connected with the
    Dynamics 365 Customer Service.
  - During complaint, knowledge article linking is possible so users can
    read relevant articles.
    - Pre-population of information is possible with logged in accounts.
    - Fill in form with incident details, attach media supported
    - Incident form, you can add any field or details behind the scenes
      with the Dataverse forms configuration.
- Incident intake officer: view queue and see new case (incident),
  assign incident to himself
  - Dynamics Customer Service module
  - Get notification on Teams
  - Team integration like chat with case collaborators
  - Queue management logic supported
  - Customers: Accounts, Contacts, Social Profiles
    - See their contact information, recent cases
  - Knowledge: knowledge articles, search support
  - Business process flow - Complaint \> Intake & Processing \>
    Investigator assigned \> Investigation \> Report back to Complainant
    - Tracked, can correspond to SLA
  - Q: Can cases be divided amongst a team?
    - A: Yes
  - Q: What if intake system is a third party system, handwritten, PDF?
    - A: [Forms processing model can be trained on
      inputs](https://docs.microsoft.com/en-us/ai-builder/create-form-processing-model)
      and do data extraction
  - Case management reports supported
- Incident manager: view team performance
  - See IM dashboard - out of the box in Dynamics. PowerBI dashboards
    also supported.
  - Forecasting and trend analysis is supported

## Field & Service (Inspections)

- Dynamics modules can be integrated with each other and PowerBI

- Support mobile app with offline capabilities

- Inspector: accesses mobile app to see schedule

  - Look at specific appointment
  - Organization being inspected - contacts, interaction history
  - Change status to inspection: in progress
  - Start inspection: checklist, note compliance issues
  - Q: Can different inspection types be pre-loaded for an inspector to
    conduct at a single site? Also, can there be items (non-compliances)
    already noted for the inspector to look at based on the output of
    previous inspections?
    - A: Multiple inspections can be done on a single site and assigned
      to inspector(s). Compliance settings can be set before for
      inspector to look at by using inspections. Corrective actions can
      be logged with inspection request - contact, organization, relate
      to events (follow up, inspection)
  - Select inspection completion status: pass, fail
  - If offline, can upload changes to server

- Back office web

  - Look at inspections, make changes, modify questionnaire
  - Inspections templates can be managed
  - Client can adjust questionnaire at any time

- Inspections dashboard with reports

## Stakeholder Management (Contacts) / Certifications

- Contact resources can have certifications - skills, past cases,
  certifications, expiry
- Contact's information can be seen across all Dynamics modules
- Contacts are a hub of all other modules
- Power Platform comes with Stakeholder Management out of box

## Low code, point & click configuration

How demo was built? all was built using point & click configuration

- Technology: Power Platform and Portal
- All shown was configured
- Dataverse:
  - Case table created
    - Create column, data type - data is validated or data look up
- Case management
  - Configure case entity and form, point and click only
