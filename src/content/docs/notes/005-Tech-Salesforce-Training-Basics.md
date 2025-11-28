---
filetags: ":salesforce:training:epubnote:"
id: 61ee8e17-3519-42fa-8cd7-1ff3e14858ef
title: Salesforce Basics Training
---

## 2022-05 Introductory Training

Source: My personal notes from Salesforce training

Workshop Activities:

- How to create/modify the data model
- Build an Automation - Approval Process (Submission, Review, Approve,
  Communicate/Status Update)
- Design the App experience, add logic and automation
- Reports and dashboards
- Change Lightning App Pages

### Prerequisites

Step 1: Please follow the instructions in the Sign Up for Trailhead (if
you do not already have a Salesforce Trailhead Account)

Complete the following two trails after signing up for Trailhead before
the workshop:

- MODULE 1: [Salesforce User
  Basics](https://trailhead.salesforce.com/en/content/learn/modules/lex_salesforce_basics)
  (~1hr + 5 mins)
- MODULE 2: [Service Cloud
  Basics](https://trailhead.salesforce.com/en/content/learn/modules/service-cloud-platform-quick-look?trail_id=crm&trailmix_creator_id=jimsharp&trailmix_slug=salesforce-foundation)
  (~40 mins)

Step 2: Please follow the instructions in the Creating a Developer
Environment for Workshop - this step is critical for the hands-on
portion of the workshop!

See SF Training resources

### Administration Building Blocks

- Data Model - Objects, fields, and records
- User Experience - how users interact, layouts and views
- Logic and automation - Rules, workflows, actions
- Reports and Dashboards - Create insights

### Building a Travel Approval App

- Build a Lightning app, add tabs, and customize page layouts.
- Create custom objects and fields for the app.
- Define relationships between objects.
- Import data and test the app
- Create an approval process
- Create reports and dashboards

Your organization has decided to implement a custom travel approval app.
Up until now, you had a travel approval process in place based on
emailing spreadsheets. It had no central repository or enforcement of
the process, resulting in the inability to report on travel approval
activities across the organization. You need to create an application
that meets these requirements:

- Each employee must submit an electronic request in the system for
  future travel.
- Each request includes a list of estimated expenses for airfare, hotel,
  rental car, and so on.
- Each request must be approved by the employee's manager, and all
  out-of-state travel must be approved by a travel coordinator.
- Managers need reports and dashboards to track key travel request
  trends and KP15.
- In addition, employees and managers must be able to access their
  travel requests, approvals, and dashboards via mobile devices.
- Before you begin, [download Workshop Lab
  Files](https://developer.salesforce.com/files/TravelAppWorkshopFiles.zip),
  which you use later in the project (see page 6 in workbook)

### Approvals

Approvals can have:

- Multiple steps
- Multiple approvers. Hierarchy and horizontal approvals are allowed.

### Workshop Steps

See workshop workbook

- Login
- Click cog wheel and go to setup
- Search and click into "App Manager"
  - Note included apps
- Set up app
  - Add utility items: Notes and Recent Item
  - Add functions: reports, dashboards
  - Add administrator system profiles
- Build app
  - Go to setup, object manager tab - like database table manager
  - Create custom objects and relationships
- Settings: Change your settings, advanced user settings, edit, change
  locale to English (United States). Otherwise, you may get an error in
  import results as:
  `,"false","false","INVALID_FIELD:Failed to deserialize field at col 4. Due to, '6/15/19' is not a valid value for the type xsd:date:Trip_End_Date__c --"`
- Import data
  - Use import data wizard on departments and travel approvals
- Create new user (our manager)
- Edit Travel Approval page layout in Object Manager or Setup \> Edit
  Page
  - Improve layout of page into 2 columns
- Move Travel App in App launcher to first one in interface for
  convenience
- Buttons can be configured new approvals
- Set up \> approval process
  - Configure manager and out of state step 2 approval
  - Set up updates of records
  - Enable email automation for approvals
  - Add Expenses to a travel approval
  - Test an approval
- Adding Dashboards
  - Out of box, preconfigured reports are available for custom objects
  - You can build on existing reports
  - Select automatically preview reports
  - Select fields
  - Group by Department
  - Can subscribe to reports, export

### Questions

Q: Cloning reports?

It is possible

Q: Private vs public folders?

Public folders, everyone can see.

## Salesforce User Basics

[Overview of
Salesforce](https://trailhead.salesforce.com/content/learn/modules/lex_salesforce_basics)

Salesforce takes all of that important data and organizes it into a
simple user interface. It's one place for you to:

- Manage all your contacts
- Work with your prospective customers
- Organize tasks and to-do items
- Focus on the right deals
- Collaborate with your team
  - Like social media
- Showcase your big wins
- Close more business

CRM stands for Customer Relationship Management. This technology allows
you to manage relationships with your customers and prospects and track
data related to all of your interactions. It also helps teams
collaborate, both internally and externally, gather insights from social
media, track important metrics, and communicate via email, phone,
social, and other channels.

### Terminology

| When we say | We mean this |
|----|----|
| Record | An item you are tracking in your database; if your data is like a spreadsheet, then a record is a row on the spreadsheet |
| Field | A place where you store a value, like a name or address; using our spreadsheet example, a field would be a column on the spreadsheet |
| Object | A table in the database; in that spreadsheet example, an object is a tab on the spreadsheet |
| Org | Organization, the place where all data, configuration, & customization lives. You log in to access it. Aka "your instance of Salesforce" |
| App | A set of fields, objects, permissions, and functionality to support a business process |

### Salesforce Standard Objects

- Account: Client organization you work with
- Contacts: Contacts are the people who work at an Account.
- Leads: Potential prospects. You haven't yet qualified that they are
  ready to buy or what product they need. You don't have to use Leads,
  but they can be helpful if you have team selling, or if you have
  different sales processes for prospects and qualified buyers.
- Opportunities: Opportunities are qualified leads that you've
  converted. When you convert the Lead, you create an Account and
  Contact along with the Opportunity.

Views

- Lists of above objects for filtering
- Kanban shows progress of items
- Use Navigation button at top left to see all apps and items

Reports and Dashboards

- Similar to list views, though can do complex filter logic and group
  data
- There are preconfigured dashboards

Search

- Search is easiest way to find data, assuming:
  - Your search term is valid
  - You have permission to access the record
  - A recent record has completed saving and is indexed for search

Other things

- Notes support rich text and relationship between records
- User / organization can be switched in profile menu
- Can switch between Lightning Experience (new UI) and classic
  Salesforce

### Salesforce Administrator

Role of admin:

- Advise on the best way to customize Salesforce to support the way you
  work
- Design automated processes to help you work faster and smarter
- Help your company learn about and adopt new features
- Work with users to gather feedback and make improvements
- Design and deliver training programs
- Handle:
  - Bugs
  - Questions
  - Feature requests

## Service Cloud Basics

### Service Cloud Business Functions

[Service Cloud
Platform](https://trailhead.salesforce.com/en/content/learn/modules/service-cloud-platform-quick-look)

- The Service Cloud platform is a customer support platform that gives
  agents ability to deliver service that's as instant and easy as a
  conversation.
- Customers choose how to contact you, anywhere, and on any device:
  Email, phone, SMS, social media, self-service sites, or real-time web
  chat. Allows escalation.
- Integrates with field service technicians and mobile employees. They
  have mobile access to the same information that your other agents do
  with the offline-first, dedicated Field Service mobile app, and more.

Value proposition: The Service Cloud platform brings a 40% increase in
agent productivity, 41% faster first contact resolution, and 34%
increase in customer retention.

### Self-service, Knowledge Base, Macros

- Branded self-service site
- Supported by AI of Salesforce Einstein
- Customers can create and resolve their own cases or escalate
- Knowledge base has articles for searching and sharing
- Macros allow automation, e.g. mass changes to cases

### Omni Channel Service - Deliver Service on Multiple Channels

- Omnichannel's goal is seamless customer experience across channels and
  enable agents
  - E.g. text, email, social media posts/messages, live chat, video chat
- Omni-Channel Supervisor gives call center supervisors real-time
  operational intelligence in the Service Console.

### Salesforce Platform Advantage: Sales and Service Together

- Need to combine sales and support services parts of a business to
  improve customer retention. According to the 2017 State of Service
  Research Report, 78% of business buyers say they are extremely likely
  or very likely to switch brands if they receive inconsistent levels of
  service.
- Salesforce Platform Advantage enables sales and service organizations
  with an integrated view of every customer and their interactions with
  your company. With this knowledge, your company gains the competitive
  advantage of delivering faster, smarter, and personalized service.

## See Also

- [Salesforce](../005-tech-salesforce)
