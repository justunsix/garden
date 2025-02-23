---
filetags: ":microsoft:power:platform:epubnote:"
id: e6a3c89b-e48f-449a-a816-ee6ac46c3912
title: Microsoft Power Apps
---

Source: [Introduction to Power Apps - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/introduction-power-apps/?source=docs),
[What is Power Apps? - Power Apps \| Microsoft
Learn](https://learn.microsoft.com/en-us/power-apps/powerapps-overview)

## Introduction to Power Apps

Get started at: <https://make.powerapps.com/>

### Learning Goals

- Know what are Power Apps and their business value
- How a business is using Power Apps, the rest of the Microsoft Power
  Platform, and Azure to help build better buildings

### Introduction

- Power Apps allow you to take action on data
- Power Apps can be built by users wanting to create custom apps to
  professional developers using business logic and data integration
- Good for replacing paper forms, legacy solutions, or things like
  shared spreadsheets and giving mobile access
- Can use connectors to integrate with existing data
- Can run on many devices including computers, mobile devices
- Built on web native Power Apps platform and cloud hosted

### What is Power Apps and what it can do for you

- Power Apps is a no-code/low-code platform for building apps that
  builds on similar concepts like formulas in Excel
- Example use cases:
  - Inspection forms
  - Status reports
  - Business solutions for purchasing and asset management
- Can be used by people with little Computer Science background and
  offers advanced functionality for developers

1.  Work with Data Where it Lives

    Use existing data sources or the Power Platform data services.
    Common data sources:

    - Dataverse
    - SharePoint
    - Excel
    - Microsoft 365

    Additional licensing

    - Dynamics 365
    - SQL Server, Azure SQL
    - Office 365
    - Third party apps using connectors

    Multiple data connections can be used in a single app.

2.  Different types of Power Apps for different scenarios

    - Canvas apps
      - Build an app from a blank canvas
      - Choose screen size like tablet or mobile
      - Add data sources
      - Drag and drop controls and functionality by writing Excel style
        formulas
      - Flexible
    - Model-driven apps
      - Build from data in Microsoft Dataverse
      - Rapid development, standard UI
      - Used to interact with data
      - Responsive and works on mobile or tablets natively
      - You can define relationships, forms, views, business rules and
        more in data layer, Dataverse
      - Good to edit key information in tables and ask questions using
        built in copilot
    - Cards
      - Small apps with lighter weight user interface elements
      - Do not require coding or IT expertise
    - Portals
      - User facing websites
      - Anonymous or authenticated website
      - Users can interact with data in Dataverse
      - Drag and drop experience like with apps is available

    Start developing at
    [make.powerapps.com](https://make.powerapps.com/) inside a browser.
    Building an app feels like building a slide deck in Microsoft
    PowerPoint.

3.  Add artificial intelligence to your app with no code

    - Power Apps provides a wizard interface to building and training a
      model
      - Provides Azure Machine Learning and Cognitive services without
        writing code or creating ML models
    - An example AI component is a business card reader which detects a
      business card and extracts its information without configuration
      needed
    - The Make [Power Apps](https://make.powerapps.com/) site has a
      wizard to guide you through building and training the model.
      Currently, there are 4 AI models in Power Apps:
      - Prediction - Model predicts whether something will happen or not
        based on previous data history
        - Allows you to create a model that can predict yes or no
          outcomes based on historical data. You train the model by
          providing historical data that includes the yes/no outcome
        - You can build prediction models to solve business problems
          such as:
          - Will a lead become a customer?
          - Will a project be profitable?
          - Will a customer churn based on activity?
        - Model can help with decision support
      - Form processor - This model extracts text from an image like the
        business card reader.
      - Object detector - This model identifies objects from an uploaded
        image or taken photo and then provides a count of the number of
        objects present.
      - Text classification - This model categorizes text by its
        meaning, making it is easier to analyze.

4.  Business Value

    - Power Apps allows apps to come from business users, like finance
      teams can use Excel today
    - Apps can reduce paperwork, improve efficiency and ensure a source
      of truth through data source combinations
    - Apps remain secured and administered by IT

### Administration and Security

- Apps are limited to current access permissions of users
- Security is managed in Power Platform admin center at [Power Platform
  admin center](https://admin.powerplatform.microsoft.com/)
  - Create and manage environments, licenses, DLP and data integrations,
    analytics, support
- Power Apps has PowerShell cmdlets for different app creators and
  administrators to enable automation

### Power Apps for Developers

- Code can be used to create data, use server logic using Azure
  functions
- There are plug-ins and extensions, logic using JavaScript
- Integration with external data, webhooks, custom connectors

### Power Apps and Dynamics 365

- Power Apps and Dynamics both use the Dataverse platform to store and
  secure data
- Business data can be reused in both services

### Customer case study - Heathrow Airport

Source: [Heathrow Airport inspires employee engagement with Microsoft
Power Apps \| Microsoft Customer
Stories](https://www.microsoft.com/en/customers/story/766053-heathrow-airport-travel-transportation-power-apps)

- Heathrow Airport built 30 apps that eliminated 75,000 pages of
  paperwork, reduced data entry by nearly 1,000 hours, and saved the
  airport \$100,000's
- Its size is comparable to a small city in traffic and complexity with
  over 76,000 people and 200,000 people passing through each day
- Initial adoption for Office 365, leading to trial of a Power App and
  later creation of more apps and a structure to help people build their
  apps and avoid duplication.

### Cost and Licensing

See [What is Power Apps? - Power Apps \| Microsoft
Learn](https://learn.microsoft.com/en-us/power-apps/powerapps-overview)
for free access, licenses, and other purchasing information

## Using Power Apps

- Sign in to Power Apps at <https://make.powerapps.com/>
- Choose an environment you are developing in, assuming you have the
  permissions. There is also a default environment.
- See the [What is Power Apps? - Power Apps \| Microsoft
  Learn](https://learn.microsoft.com/en-us/power-apps/powerapps-overview)
  official documentation on topics like:
  - Left navigation to use different Power Platform features
  - Settings
  - Artificial Intelligence: Copilot

## See Also

- [Microsoft Dynamics](../005-tech-microsoft-dynamics) - [Microsoft
  Dynamics](id:ffe5c447-66a0-4bf7-b566-a0c54d95e4cf)
