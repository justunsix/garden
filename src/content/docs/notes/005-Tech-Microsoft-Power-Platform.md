---
filetags: ":microsoft:power:platform:ai:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: 3a07fa69-d143-48f4-bcda-e2c6222aeeb9
title: Microsoft Power Platform
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

## Introduction to Microsoft Power Platform

### Learning Goals

- Know components and features of Power Platform and value
- Identify when to each component to create business solutions
- Understand connectors

### Introduction

Vision: All people can create business solutions to use data from
different technologies. Data can be used to gain insights and automate
to save time and improve efficiency.

1.  Power Platform Products

    Power Platform is made of several products. All are suitable for
    users and developers.

    - Power Apps
      - Low code development environments
      - Custom Apps
      - Services, connectors, scalable data service and app platform
        (Microsoft Dataverse)
      - Platform can integrate with existing data
      - Web and mobile applications for all devices
    - Power Automate
      - Allows creation of automated workflows between apps and services
      - Automate repetitive business processes like:
        - Communication
        - Data collections
        - Approvals and decision tracking
      - Good for individuals and enterprise automation
    - Power BI (Business Intelligence)
      - Business analytics service for getting insights for analyzing
        data
      - Share data visualizations like reports, dashboards for decision
        Support
      - Scalable with governance and security in the service
      - Use case: dashboard replaces a standing meeting to report on
        organizational metrics
    - Power Virtual Agents
      - Creation of chatbots using a guided, no-code graphical interface
        that does not require data science or development skills
      - Allows subject matter experts to build and support their own
        conversational solutions
      - Connectors provide integration and can call Power Platform
        products, for example flows in Power Automate

2.  Features

    - AI Builder
      - AI capabilities can be added to workflows and Power Apps
      - Turnkey solution without code
    - Microsoft Dataverse
      - Scalabe data service
      - Can secure and manage data from multiple sources in a common
        data model for ease of use and user consistency
      - Allow data to be used in Power Platform's products for
        consolidation, display and changing of data
    - Connectors
      - Connect apps, data, and devices in cloud
      - Examples like Salesforce, Office 365, Social media, Dropbox,
        Google services
    - Most development can be done in a web browser, no additional tools
      required

### Business Value of Power Platform

- Business challenges:
  - Modernization: tailored experiences and social media
  - Insufficient people, skills and resources
    - Custom application development has high cost and time requirements
  - Demand for targeted applications is higher than capabilities
    - Apps need to be agile due to challenges
  - Need to enable "citizen developers" (power users) to create hybrid
    teams

Power Platform's goals are to enable to organization to meet those
challenges.

- Low code tools that can meet enterprise level development tools
- Collaborative solution for power users and professional developers
- Enable creation and support and applications

1.  Example Use Case

    - A field technician wants to know parts inventory
    - The technician can prototype a Power App that can check inventory
      levels
    - With the prototype, professional developers can develop APIs to do
      the checking of the inventory system and do other custome
      functions
    - The APIs are added to the Power App and Automate Flows
    - The app is built collaboratively and know nas "Fusion" development
      allowing the people best suited to the task to do the work

    Fusion development approach:

    ``` plantuml

    [End Users] --> [Citizen developers] : Feedback
    [Citizen developers] --> [Professional developers] : Power Apps
    [Professional developers] --> [End Users] : Power Apps with Custom Functionality

    ```

    - Low/no code approach minimizes development time spent on things
      like screens and automation so advanced parts of the solution can
      be addressed by people with those skills
    - Connectors reduce integration requirements between solutions
    - Prototypes can be built in order of hours or days
    - A catalog of applications can be built and shared for operations

### Data Connectors

Connectors enable Power Platform to use data and integrate different
parts of business solutions. Data sources are two types:

- Tabular data
  - Data in a structured table format
  - Power Apps can read and display these tables through galleries,
    forms, and controls
  - If supported, Power Apps can create, edit, and delete data from the
    data source
  - Examples: Microsoft Dataverse, SharePoint, SQL Server
- Function-based data
  - Uses functions to interact with the data source
  - Functions can return table of data and also offer more actions like
    send an email, update permissions, or a create a calendar event
  - Examples: Office 365 Users, Project Online, Azure Blob Storage

1.  Types and Sources

    Connectors are standard and premium. Premium connectors require
    additional licensing for the app and/or users:

    - Standard examples: SharePoint, Outlook, YouTube
    - Premium examples: SQL Server, Survey Monkey, Mail Chimp

    You can also use AppSource to source and install connectors to
    non-Microsoft services.

2.  Example Use Cases

    - Using Dynamics 365 apps like customer services, use Power Automate
      to notify users where customer types are added
    - Use a SharePoint document library to store files that are fed to
      Power Apps to manage and distribute
    - Connectors to Azure services to use AI techniques to do tasks like
      reading text off images or cognitive services to recognize faces
      in images
    - Power Platform solutions can be used and implemented into
      Microsoft 365 apps like Teams. Users can use Power Apps in Team
      and run Power Automate from actions and events in Teams

3.  Triggers and Actions

    Once a data source is set and a connector is configured, triggers or
    actions can be used.

    - Triggers are only used in Power Automate
      - Can be time based such as a flow schedule every day
      - Can be action based like on modification of a table or email
      - A trigger is required to tell when a workflow runs
    - Actions can be used in Power Automate and Apps
      - Prompted by the user or a trigger and allow interaction with a
        data source
      - Example action: sending an email in a workflow or app, change a
        data source

4.  Custom Connectors

    - There are many reusable connectors and you can also build a custom
      connector
    - Easily extend your app by calling a public API or custom API.
      Connectors can use multiple APIs using functions and operate on
      data.
    - Custom connectors can be used in different platforms like Power
      Apps/Automate and Azure Logic Apps

    1.  Creating Custom Connectors

        You can create custom connectors using 3 different approaches:

        - Using a blank custom connector
        - From an OpenAPI definition
        - From a Postman collection

        See [Data Connectors - Training \| Microsoft
        Learn](https://learn.microsoft.com/en-us/training/modules/introduction-power-platform/3-data-connectors)
        and [Use custom connectors in a Power Apps canvas app \|
        Microsoft
        Learn](https://learn.microsoft.com/en-us/training/modules/use-custom-connectors-in-powerapps-canvas-app/)
        for details.

### Data loss prevention, compliance, privacy, and accessibility

1.  Data Loss Prevention Policies

    Users and apps may overlook data loss and sharing risks.

    - Data loss prevention (DLP) policies can be created to prevent
      users from unintentionally exposing data

    - DLP policies can be scoped at:

      - Environment level
      - Tenant level
        - Tenant level policies can be scoped for selected/all
          environments and environments can be excluded

    - Scopes balance protection and productivity

    - Connectors can be classified as:

      - Business
        - Connectors hosting business-use data should be classified as
          business
      - Non-Business (default for new connectors)
        - Connectors hosting personal-use data should be classified as
          non-business
      - Blocked
        - Connectors that have restrictions across certain environment

    - Connector management and DLP policy can be done in the Microsoft
      Power Platform admin centre which affect Power Platform canvas
      apps and Automate flows. DLP policies are managed by tenant or
      environment admin roles

2.  Compliance and Data Privacy

    - Microsoft provides a set of compliance offerings (including
      certifications and attestations)

3.  Data Protection

    - Connections between users and Microsoft data centres are encrypted
      and public endpoints are secured using TLS
    - API access is also secured

4.  Accessibility

    - Power Platform is accessible
    - An accessible canvas app allows users with vision, hearing and
      other impairments to use the app
    - The [Review a canvas app for accessibility in Power Apps - Power
      Apps \| Microsoft
      Learn](https://learn.microsoft.com/en-us/powerapps/maker/canvas-apps/accessibility-checker),
      accessibility checker, can review accessibility issues in an app.
    - See more at [Create accessible canvas apps - Power Apps \|
      Microsoft
      Learn](https://learn.microsoft.com/en-us/powerapps/maker/canvas-apps/accessible-apps)

### Pulling it all together

An example inventory tracking app that helps employees and track assets.

- Power Apps allows us to build an app that has all equipment listed,
  the status of that equipment, and even instructions
- Employees can check out available equipment, walk to IT at a specified
  pickup time where the equipment will be ready, and access instructions
  or flag an equipment malfunction from mobile devices
- Power Automate can read when equipment needs to be returned and send
  out reminder emails, or even a warning that the equipment is late
  being checked in.
- Users can see when equipment is booked through the app and request
  check-out for a future date at which time Power Automate can send them
  a reminder to pick up the equipment and IT a reminder to have it
  ready.
- Power BI can take all the data generated from the app and analyze it
  for user and equipment usage trends. Reports help decide if more
  equipment is needed and where.

## Power Platform Security

Source: My notes from Microsoft session for OPS Hackathon 2023 led by
Sravani Seethi in 2023-02

### Power Platform Security Layers

Ordered outside to inside:

- Tenant - secured access by Azure Active Directory (AAD)
  - Like logging into Office 365 organization's tenant
  - Conditional access policies, security group (if then, else
    condition), example if users is logging in from Canada, then require
    multi-factor authentication, else require additional authentication
  - Share apps with external users with AAD B2B
  - Tenant isolation supported, restrictions supported:
    - Outbound only
    - Inbound restricted from other tenants
    - Open data sharing
  - Collection of environment. At least 1 default environment is
    required and present in a tenant.
- Environment
  - Container to separate apps that may have different roles, security,
    audiences
  - Required for an app
  - Bound to a geographical region
  - Dataverse is available
  - Creation/management is restricted
  - Environment strategy:
    - Default - all have access
    - Developer - selected development users have access
    - Dedicated - dev/test/prod environments. For production, end users
      only have end user access to the production solution and no one
      can modify the apps
    - Shared - dev/test/prod environments can be shared across teams
- Resource permissions
  - Access to edit, share, use resources
  - Can co-own components
    - Co-own means the owner is giving another user edit access to the
      app instead of just viewing the front end of the app
  - Flow sharing also shares connections in flow implicitly with owners
  - Access to run
  - Power Apps, Automate, and Virtual Agents **only provide access to
    data assets users already have access to**. Only the front-end is
    being shared. Data has to be shared separately.
    - For example, if you are using Dataverse, users must be given
      access to relevant Dataverse tables
- Connector access and data loss policies
  - Like OneDrive, Office 365 applications
  - Data policies:
    - Prevent exposing data unintended
    - Scoped at environment and tenant level
    - Rules based on connector classification as business, non-business,
      and blocked
    - Applies to built in and custom connectors
    - Block connectors and their actions that are not yet approved
- Dataverse security
  - Authentication, authorization
  - Role-based security
  - Audit
  - Table, column level security
  - See also [Microsoft
    Dataverse](id:cc998824-a24c-43fa-a060-0dbc98a7183d)
    ([Dataverse](../005-tech-microsoft-dataverse))

### Environment and Dataverse Security

1.  Business Units

    - Business units work with security roles to determine security that
      a user has
    - Child business units can be created to separate users
    - Every user assigned to an environment belongs to a business unit
    - Example hierarchy:
      - Root business unit
        - Division A
          - Business unit 2
            - Business unit 3
        - Division B
      - Users in division A only see their division's records
      - Users can belong to be multiple business units, like matrix
        organization

2.  Teams

    - Teams in sense of Azure security groups
    - A recommendation is map business units to AAD security groups to
      help with user administration and role assignments

3.  Security Roles

    - Roles are used to configure environment access to all resources in
      an environment
    - There are out of box roles:
      - Environment/System admin - can use admin centre
      - System customizer - usually developers
      - Environment maker - resource management
      - Basic user - app users

4.  Example Security in Dataverse

    - Root Business Unit (BU)
      - Separate BUs per teams
        - Security roles assigned based on user's functions as described
          above

### Demonstration

- Create a new solution

- Create a new table

- Input example rows of data

- Create model-driven app using table

  - Choose table to use in app
  - View rows in table

- Create new custom security role

  - Give permissions on table we created
    - Give users edit on records they manage and created, but no delete

- Admin centre

  - Manage a test user
  - Give them the basic security role and role we created

- As test user, we observe user only sees the rows they created and not
  other rows created by the admin users

- What about canvas app?

  - Process is similar. However, in model-driven app, the interface
    users security automatically. For canvas app, the interface like
    buttons requires custom security logic.

### How to use Power Platform Security?

- Education of users and developers
- In agile way, develop security model. Build gradually.

## How to Improve, Monitor, and Modernize any Process using Tasks, Approvals, and the Power Platform

Led by Michael Patril from XRM Vision (Microsoft experts)

### See also

- [Get started with Power Automate approvals - Power Automate \|
  Microsoft
  Learn](https://learn.microsoft.com/en-us/power-automate/get-started-approvals)

### Use Case

Challenges to productivity:

- Work distractions
- Disconnected system
- Security and compliance risks

People were frequently context switching, breaking their flow and
creating small gaps in work.

### Tasks in Microsoft 365

- Organize work and life

- Optimize business processes

- Security and privacy

- Unified role based experience

  - See all tasks in one place
  - Tasks are integrated in all Microsoft applications

### A unified task system

- Accept tasks
- Hand out tasks
- Asks: "all tasks are ask, but not all asks are tasks"
  - We want people to contribute to tasks or comment.
  - Directed asks: For example in email using `@` to call someone

1.  Asks and Tasks relative to Formality (y-axis) and Accountability
    (x-axis)

    ``` txt

    Formality
    |
    |      x     T
    |      x     T  Tasks
    |      x     T
    |      x     T
    |      x     TTTTTTTTTTTTTTTTTTTT
    |      x
    |      x  @ Directed Asks
    |      xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
    |
    |  General asks
    |
    +------------- Accountability -------------

    ```

### Task Management Flow

- Group tasks, like in categories
- View tasks in Outlook calendar, Teams, Microsoft apps
  - Tasks can be dragged onto calendar to schedule them
  - Teams - has a notes app and can assign tasks to people in notes
  - Word - comments in document can be used to call tasks
  - Microsoft To do - mobile app to see tasks
  - Power Platform tasks integration
- Q: do we need to use power automate for creating a workflow with
  selected tasks created in the Tasks planner or we can create task
  workflow from the planner itself ?
  - A: Tasks can be created from both like Power Automate
- Approach - think about different personas and automation steps before
  the tools and then think how existing applications can be used to
  complete the process - for example use Outlook and to do to manage
  people's work

### Centralized Information and Collaboration

- Common process and project information are tasks and approvals

- Use Teams as the central place to manage information and collaborate

  - Approvals tab in left hand rail
    - Approvals app has audit trail, monitor approvals
    - Integration with PowerBI reports possible, like see approval
      trends, times
    - Approval templates
    - Flow and notifications can be sent to Outlook mail
    - Any documents can be approved, status column can be added in Team
      file browser

### Try Tasks, Approvals

- In Power Automate, browse available templates for flows
- Tips:
  - Set `body content type` as HTML
  - Use VIVA topics to help with tags

## See Also

- [Microsoft Technologies](../005-tech-microsoft) section [Microsoft
  Power Platform Notes](id:2acf1ed4-0099-4810-9ed4-3bba5c688490)

### Resources

- [Introduction to Microsoft Power Platform \| Microsoft
  Learn](https://learn.microsoft.com/en-us/training/modules/introduction-power-platform/)
- [My Power Platform Introduction Collection \| Microsoft
  Learn](https://learn.microsoft.com/en-us/users/justintung/collections/rqxnayen8407x2)
