---
filetags: ":power:platform:microsoft:automate:artificial-intelligence:ai:epubnote:"
id: 4cf22ee7-9fe5-4a7b-bece-bfef0e60e374
title: Microsoft Power Automate
---

## Introduction to Power Automate

- Power Automate is used to automate repetitive business processes
- It can handle work flows like:
  - Send reminders on tasks
  - Move data between systems on schedule
  - Connect to different data sources and APIs
  - Automate tasks on a local computer like Excel workbook calculations
- Power Automate was formerly known as Microsoft Flow

### What is Power Automate and the value it brings to you

Example scenarios Power Automate can help with:

- Regular downloads from emails and uploads to database
- Getting approvals for new items
- Regular log into a website to get data and save it in another system

Common scenarios and capabilities of Power Automate:

- Automating of repetitive tasks like moving data from one system to
  another
- Guiding a user through a process so they can complete the different
  stages
- Connecting to external data sources via one of the hundreds of
  connectors or directly via an API
- Automating desktop based and website processes with robotic process
  automation (RPA) capabilities

1.  Example: Purchase order approval

    - User uses a Power App to create a purchase order request
    - Flow evaluates requests and routes it based on criteria like
      approval from user's manager in AAD
    - Conditional logic for further approvals is done

2.  Work with Data Where it Lives

    Use connectors to connect to one or many existing data and services
    like:

    - Microsoft Dataverse
    - Salesforce
    - Dynamics 365
    - Google Drive
    - Office 365
    - Custom data source provided in a custom connector

3.  Types of Flows

    - Cloud flows
      - Runs on a trigger and then one or many actions like emails or
        mentions
      - Team flows are owned by a group while "my flows" are owned by
        you
    - Business process flows
      - Used with Model-driven apps and Microsoft Dataverse to create a
        guided experience
    - Desktop flows
      - These robotic process automation (RPA) flows allow you to record
        yourself performing actions on your desktop or within a web
        browser.
      - You can trigger flow to perform that process for you.
      - You can also pass data in or get data out of the process,
        letting you automate "manual" business processes

4.  Add Artificial Intelligence (AI) to your Flows without Code

    - A wizard based interface at <https://make.PowerApps.com> allows
      building and training a model and using Azure Machine Learning and
      Cognitive services

5.  Security and Administration

    - Manage security at the Power Platform admin centre to manage
      environments, policies, data integrations, licenses, and quotas
    - Power Automate also offers PowerShell cmdlets
    - Power Automate has flows to help manage itself like a scheduled
      job to discover all flows and apps daily and add co-owners

6.  Driving Value

    - Users can only use flows to do things they already have access to
    - Automation can be driven from the business instead of IT

### Customer Case Study - TruGreen

- They build a new AI enabled virtual agent bot without writing code and
  used Power Virtual Agents to do routine customer requests and take
  action on customer intent. It allowed interactions with back-end data
  using Power Automate.
- For systems without APIs, they used desktop flows to mimic onscreen
  actions that customer service did via robotic process automation
  (RPA).
- See more at [Microsoft Customer
  Stories](https://customers.microsoft.com/story/759484-trugreen-partner-professional-services-power-virtual-agents)

### Power Automate in Action

Video demonstration for different types of flows:

- Start with a template flow, browse or search

- Read about flow, connectors

- Reuse an existing form, start an approval, and design conditional
  responses

- Choose additional actions

- Example flow triggers: schedule, pressing a button, on a certain
  trigger

## Getting Started with Power Automate 2024-02-07

My notes from OPS Hackathon 2024 session with Sravani Seethi, Microsoft
Cloud Solution Architect

Content includes info from [Microsoft Power Platform Virtual Training
Day - Automate Business
Processes](../005-tech-microsoft-power-automate-business-processes) -
[Microsoft Power Platform Virtual Training Day - Automate Business
Processes](id:e54cbe89-e3f0-4aa2-adb3-305b83d9e698)

- All Power Platform (PP) tools can work together
- Copilot AI authoring assistant available in all PP tools
- Power Automate - built on Azure logic apps

### Demo

1.  Build FLow

    - Access <https://make.powerautomate.com/>

    - Use environment where your items are built

    - Pinned all visible items

    - Create from trigger type or desktop flow

    - Search templates for type of flow you are building

    - Link to solutions across PP

    - Build cloud flow

      - Build on inventory management app, model driven app with a
        Dataverse table
      - Canvas app with gallery of items
        - Can submit new requests
      - Using a SharePoint list with approvers, and a flow to allow
        approvers to approve items

    - Create instant flow, triggers can be changed later

    - Add inputs:

      - itemID
      - itemType

    - Add operation

    - Save and reopen to edit in "New Designer"

    - Add an action, approver

      - Search SharePoint and choose "Get items"
      - Choose site and list name
      - Filter query using inputs, using ODATA filter
        - `Title eq "itemType"`

    - Add an action, approval

      - Start and wait for an approval
      - Choose "Approve or reject" option
      - For approver, get from previous step's approver data

    - Add condition

      - If response is equal to approve - update Dataverse row
        - Use Dataverse connector
        - Use itemID in input
        - Update approval status to "Approved"

    - Replace manual trigger with PowerApps(V2) trigger

    - Add inputs:

      - itemID
      - itemType

    - In Canvas app, add a button to trigger flow

      - On submit button, on select, add "Power Automate" flow, add the
        flow we created

2.  Test flow

    - Use "Test" button
    - Input itemID and itemType
    - Approval can be email or in Teams
    - View approvals in Power Automate portal

## See Also

- [Microsoft Power Platform Virtual Training Day - Automate Business
  Processes](../005-tech-microsoft-power-automate-business-processes) -
  [Microsoft Power Platform Virtual Training Day - Automate Business
  Processes](id:e54cbe89-e3f0-4aa2-adb3-305b83d9e698)
- [Microsoft Power Automate
  Snippets](../005-computer-snippets-microsoft-power-automate) - :roam:

### Resources

- [Introduction to Power Automate - Training \| Microsoft
  Learn](https://learn.microsoft.com/en-us/training/modules/introduction-power-automate/)
- [Power Automate on Microsoft
  Learn](https://learn.microsoft.com/en-us/training/powerplatform/power-automate)
- [Microsoft Power Automate](https://make.powerautomate.com/)
