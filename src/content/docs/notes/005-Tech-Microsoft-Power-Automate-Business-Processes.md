---
date: 2023-10-16
filetags: ":power:platform:microsoft:automate:epubnote:"
id: e54cbe89-e3f0-4aa2-adb3-305b83d9e698
title: Microsoft Power Platform Virtual Training Day - Automate Business
  Processes
---

Source: My notes from Microsoft session led by Janhavi Anturkar

## Introduction to Power Automate and Flows - Module 1

Power Platform Automate is an online platform for automation of business
processes using:

- Friendly user interface (UI), API, and artificial intelligence
  automation

- Power Automate Flows - access at <https://make.powerautomate.com/>

  - Built on Azure logic apps platforms
  - Use connectors to data sources and platforms, triggers, actions
  - Start with templates
  - High availability
  - Can be shared

### Example Use Cases

- Deal with emails, receive notifications
- Tasks management
- Copy email attachments to OneDrive
- Collect business data and share with others
- Approval workflows

### Where to create and administer flows?

- UI in browser, mobile friendly
- AI Builder - everything inside in Power Automate, no additional Azure
  services needed
  - Built on Azure Cognitive services
  - Can build AI parts to include in flows

### Making Flows

1.  Flows

    1.  Types

        - Cloud
          - Good for automated, scheduled, process automation
          - Build on website
        - Desktop
          - Automation of tasks on desktop, like recorded flows, robotic
            process automation
          - Good for legacy applications, desktop only services without
            APIs
          - Build using Power Automate Desktop application
        - Business process
          - Good for case management, staged processes
          - Guide for people to get work done flowing a business process

        Flows can be build on web, desktop, mobile app, and in Teams.

    2.  Components

        - Trigger - When to start a flow? event that starts the flow
          - Automated - when something happens
          - Schedule - always on a certain regular time
          - Instant
          - Notifications
          - Approvals
          - Mobile
        - Actions - 1 or more steps that are run
        - Connectors - connect cloud flows to apps, services, data
          - Standard - ex. Office365 licensed, SharePoint
          - Premium - expanded set like Dataverse, SQL, Azure services
          - Custom - good for APIs, other data sources

2.  Desktop Interface

    Install with:
    <https://learn.microsoft.com/en-us/power-automate/desktop-flows/install>

    - Drag and drop steps

3.  Web Interface

    Access <https://make.powerautomate.com/>

    - Action items for you
    - Create flows, for example from templates
    - Connectors - Manage connectors, find new ones
    - Data - data sources
    - Other options
      - AI Builder
      - Learning

### Demo: Create flow from Template

- Access <https://make.powerautomate.com/> on web on desktop
- Make a save office 365 email attachments to OneDrive flow
- Reuse template: "save Office 365 email attachments to specified
  OneDrive for Business folder"
- In the flow template, it shows required connections you have to enable
  like email and OneDrive
- Modify template, can add your name to the "To list" so only on emails
  to you
- See template saves files to OneDrive under default folder email
  attachments from Power Automate
- Can check flow using Flow Checker and Test functionality in UI
- Test by sending an email to yourself with an attachment
- Check flow status under "My flows" to see if steps ran and they did

1.  Create from Mobile

    - Install Power Automated app on Android
    - Use button flow
    - Create a flow "Send myself a reminder in 10 minutes"
    - Manually trigger flow, time delay, send push notification
    - Can invite others to own flow and share
    - Can see flows and history

### Dynamic Content in Power Automate

Creating flows from scratch

- Example, when a record is created in data source, send an email based
  on record content added
- For this example, create the flow from a template "get a push
  notification when you get an email…"
- In flow, change email to field to you
- Note in get manager task in flow uses get your profile and gets your
  manager based on your user principal name
- Condition to check email gets email from the original email, your
  manager and compares them
  - Yes: you get a push notification
  - No: do nothing

### Expressions in Power Automate

May need to evaluate, calculate using the data (dynamic content) in the
flow. Use with open **Dynamic Content** menu and then select
**Expression**

1.  Demo: Manually Trigger a Flow

    - Create new flow on manual trigger
    - Add inputs:
      - Square Footage: Number
      - Cost: Number
    - Add "compose" data operation, called "Compose"
      - For inputs, use Expression: multiply with the dynamic content,
        square footage and cost:
        `mul(triggerBody()?['SquareFootage'], triggerBody()?['Cost'])`
    - Add "compose" data operation, called "Compose 2"
      - As input, use output from earlier compose operation
      - As output, use format number:
        `formatNumber(outputs('Compose'), 'C2')`
        - C2 = currency format
    - Save and test where you enter 2 inputs and get a formatted
      currency result

## Introduction to Business Process Flows - Module 2

- Guides users in stages of process to a completion
  - Can be customized
  - Requires Power Apps Dynamics 365 or Power Apps license to get access
    to business process flows
- Integrated with **Dataverse** to securely store and manage business
  data
  - Set of tables with rows and columns
  - Standard tables and custom tables
- Defining business process flows:
  - A guide
    - Visual
    - Help your users
    - No time limit
  - Stages and steps
  - Stage gating
    - Requirements in each stage
  - Conditional branching
  - Include multiple tables
    - Dataverse has built in flows, but restricted to Dataverse and no
      other data sources
  - Switch any time
    - Can use other processes at same time
  - Built for roles
    - Example, other certain roles can use or see process steps
- Licensing: requires Power Apps Dynamics 365 or Power Apps licenses

### When to Use Business Process Flows

1.  Differences from Business Process Flows and Power Automate Flows

    | Business Processes              | Power Automate                           |
    |---------------------------------|------------------------------------------|
    | Visual Guide                    | No visual guide                          |
    | Dataverse only                  | Not restricted to Dataverse              |
    | No time limit                   | Steps based on data and user interaction |
    | Standardized, logical branching | Complex logic, call other flows          |

2.  Benefits of Business Process Flows

    - Consistent stage and work steps
    - Data collection and reporting
    - Better time and results due to standardization, guidance

### Why Use Each Flow

1.  Business Process Flow

    - Automated business processes with Dataverse
    - Need a visual guide
    - Want to use out of box business process flows
    - Have Dynamics 365 license and use Dataverse and Dynamics 365

2.  Power Automate Flow

    - Need scheduled or triggered flows
    - Need trigger or flow outside of Dataverse or other connectors
    - Need push notifications outside of Outlook like SMS and other
      connectors
    - Only have an Office 365 license and want to use flows

### Demo: Creating Business Process Flows

- Access <https://make.powerautomate.com/> on web on desktop
- Under My Flows, select business process flows
- Create a new business process flow with name and Dataverse tables
- Stages
  - Add 1st stage in flow called Customer Check In
  - Name of stage
  - Dataverse table and fields
- Add data steps in stage
  - Select data fields
  - Keep adding data steps for inputs
- Start flow, enter data
- Check data entered in Dataverse
- Add a 2nd stage - Automobile Make
  - Add fields in Dataverse to Customer Check in table
  - Add data steps in stage for inputs to those new fields
  - Save process flow and refresh page to pick up new Dataverse fields
  - Associate data steps to new fields
- Add condition after 2nd stage - Manufacture Year Prior to 1971
  - Add condition to check if Automobile Year field is greater than 1971
- Add two new stages depending on condition evaluation of yes and no
  - Yes - Stage: Post 1971 check
    - Add data steps to check certain car components are intact
    - Add following stage: Collect Payment
      - Add data steps to collect cost and payment method
  - No - Stage: Pre 1971 check
    - Add data steps to check certain car components

## Artificial Intelligence (AI) Builder - Module 3

- Analyze text for classification, key phrases, language, and sentiment
- Prediction using data
- Get business card info
- Process text from images
- Read and save info from documents

Benefits:

- No Azure subscription needed or data science skills required
- Friendly point and click UI
- Create custom AI model in Power Apps and Power Automate
  - Category classification
  - Entity extraction
  - Form processing
  - Object detection
  - Prediction
  - Other prebuilt models to read - prebuilt models can be used right
    away:
    - Business card
    - Language
    - Invoice, receipt processing
    - Sentiment

### Use Cases

- Documents processing
- Natural language processing
- Image processes

### Demo: Create an AI Model

- Access <https://make.powerautomate.com/>
- Create a model to detect green tea bags and their type
- Using object detection premium AI model as base
  - Select "Common objects"
  - Other possible selections are items on retail shelves and logos, but
    not suitable for this model
- Create each object names - the green tea flavours
- Upload the necessary images needed for model training and set the
  entities for each image
- The tagging and training will take a long time
- Assuming the model is ready, you can view the model and test it for
  image detection
- Publish the model for use in Power Automate or Power Apps

### Demo: Using AI Builder with Power Automate

- In <https://make.powerautomate.com/>, select the published model
- Use template "Click a button to recognize and count objects in images
  using AI Builder"
- Note it has an image as input and uses the model to detect objects
- Test the flow and see the result with the detected objects and their
  count and confidence

## Automate Processes with Robotic Process Automation (RPA) and Power Desktop Automate Recording - Module 4

- Build desktop flows to replace repetitive tasks with benefits for
  increasing productivity and more engaging work environment

- Can use anything on a desktop

- Steps:

  - Learn Power Automate Desktop flows
  - Create a new desktop flow
  - Record actions performed in desktop based application
  - Perform a test run

### Requirements

- Need access to make changes in environments in your tenant and RPA
  license
  - Free trials are available

1.  Set up an Environment

    - Set up an environment in Power Platform admin center
    - Add a database to the environment
    - Install Power Automate Desktop on your computer - under My flows -
      install button
    - Install an extension on your preferred browser and run it

### Demo: Create a Power Automate Desktop Flow

- Access the Power Automate Desktop app
- Create a new flow
- Note interface of the flow - actions, designer, variables, data
  capture
- Add actions:
  - Run application
  - Click on desktop recorder, start recording
  - Make sure application is open
  - Do things in application like navigation, clicks, text input
  - End recording
  - Go back into designer to see auto generated steps
    - You can edit the recorded steps like text input

1.  Define Input and Output Parameters

    - In variables, add input variables "Amount", "Contact Email",
      "Account"
    - In the auto generated steps from before, set up inputs in the
      relevant steps
    - Add output variable "InvoiceID"
    - Add step "Get details of UI element", using tracker, select the
      element to read

### Optimize Business Process with Process Advisor

- Goal is improve efficiency
- Process advisor maps a process and begins automation to help simplify
  business processes and improves efficiency
  - You need access and license and must see "Process Advisor" in the
    Power Automate menu, otherwise contact your admin

1.  Demo: Using Process Advisor

    - Access <https://make.powerautomate.com/>
    - Use Process advisor menu item
    - Create a new process
      - Add a recording, using Power Automate Desktop
      - Record the business process you go through
    - View the process that was just recorded on the Process Advisor
      page
    - Wait for it to be processed
    - Add activities using "Add activity" that describe steps of the
      process
    - Note each step has a screenshot, the screenshot can be deleted if
      needed without impacting the automation
    - Save the process, wait for it to be ready to analyzed, when ready,
      click "Analyze" in the process advisor
    - See the analysis of the process using "Analytics", shows:
      - Steps and how long they take
      - Variations and information across different recordings
      - Data can be filtered by variation
      - Data like application(s) used, time spent in applications
      - Advisor will make recommendations
