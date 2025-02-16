---
filetags: ":microsoft:power:platform:epubnote:"
id: cc998824-a24c-43fa-a060-0dbc98a7183d
title: Microsoft Dataverse
---

Source: [Introduction to Dataverse - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/introduction-common-data-service/?source=docs),
[Create tables in Microsoft Dataverse - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/get-started-with-powerapps-common-data-service/)

## Introduction to Dataverse

### Learning Goals

- Learn about Microsoft Dataverse and the Common Data Model
- Identify tables, columns, and relationships
- Learn about environments and business rules

### Overview of Dataverse

- Microsoft Dataverse is a cloud-based, low-code data service and app
  platform, which allows you to use security and connectivity of
  Microsoft services
- Dataverse can connect to all Microsoft Power Platform products to aid
  in control, automation of business
- With tables and columns, has the ability to define relationships
  between data
- Dataverse is scalable

1.  What's in the Dataverse

    - Structures data and business logic to support interconnected apps
      and processes in a secure and compliant way
    - Dataverse is available globally and deploy in regions to comply
      with data residency and requires an internet connect to access. It
      is not designed for offline use
    - It is used by Microsoft Dynamics 365 and native connectivity is
      built into Power Apps and Automate
    - Dataverse areas:
      - API
      - Security
        - Audit
        - IAA with Azure Active Directory
      - Logic
        - Business rules
        - Duplicate detection
        - Calculated, roll up fields
        - Workflows
        - Jobs
      - Data
        - Report
        - Modelling
        - Validation
        - Common Data Model
        - Catalog and discovery
      - Storage
        - Files
        - Databases
        - Storage in Azure cloud, scalable
      - Integration
        - Cloud, Azure, Event Hubs, Service Bus
        - SQL
        - Data Lake
        - API, webhooks, events, data exports
    - Dataverse allows creation of a cloud database with predefined
      tables and columns
      - Data model can be configured
      - Role-based security and business rules secure data

2.  Dataverse Defined

    - Dataverse is a instance of a database with standard and custom
      data structures called tables
    - A table is a set of rows to store data
    - Rows contain columns to manage pieces of information in a row
    - One or many database instance can be created and each instance
      will start with a default set of tables and can be customized

    1.  Scalability

        - Table can hold millions of items

        - Instance storage maximum is 4 TB

        - Storage is controlled by license and more can be purchased

        - Dataverse is suited to transactional applications and not
          intended for long running and batch processes.

    2.  Common Data Model vs Dataverse

        - Standard table design in Dataverse uses an open source,
          standard, extensible model called the Common Data Model
        - It is a collection of predefined tables, columns, meta data
          and relationships

    3.  Dataverse Structure and Benefits

        - Since definitions and schema are based on the Common Data
          Model (CDM), integration is easy for solutions using the CDM
          schema because standard tables are the same
        - You can reuse apps using the CDM

### Identify Tables and Columns in Dataverse

1.  Types of Tables

    - Standard
      - Out of the box like account, business unit, task
      - They can be customized
      - Tables imported as a managed solution can be standard too if
        marked as customizable
    - Managed
      - Non-customizable tables imported into the environment as part of
        a managed solution
    - Custom
      - Unmanaged tables that are either imported or new tables created
        in Dataverse
      - They can be customized

2.  Columns

    - Pieces of information within a row of a table
    - Columns have data types like number
    - Number of columns can be 100 or more.
    - Good practices:
      - Is if a table has 100s of columns, consider structuring the data
        differently will be better like breaking up tables
      - Use standard tables and columns when possible before creating a
        new table

### Understand Relationships

- An efficient and scalable solution will require splitting table into
  different tables.

- For example a sales order management system with customers, products,
  invoices, and line items tables

- Relationships are defined between tables:

  - One to many, also know as parent child relationships
    - Example sales system: invoice table is parent with line items as
      child
      - Invoice can have 0 to many line items, while line items will
        also belong to just one invoice
    - Columns that identify a row uniques like an invoice number are
      used to identify the parent row. The unique column is a called a
      key.
      - The same key is stored in related child rows
      - This column is called a foreign key in the child table storing
        the parent key
      - Filtering of child tables on the foreign key can be done like
        line items for a specific invoice number
  - Many to many

- Dataverse already contains tables most organizations will need
  including their relationships

  - Use standard tables and extending them to ensure efficiency and
    scalability

### Environments in Dataverse

- Environments are used store, manage, secure, and share business data,
  apps, and flows
  - Like user access, security settings, and storage
- Each environment can have a Dataverse database for use
- Environments are created in an Microsoft Azure Active Directory (AAD)
  tenant and its resources can only be accessed by tenant users and are
  bound to a geographical location.

### Business Rules

- Dataverse allows definition of business rules to business logic can be
  managed at the data layer instead of the app layer

- In other words, business rules are active whenever the data is used
  like in Power Platform and APIs

  - Rules are usually defined for a table and apply to all forms.
    Business rules can also be for a specific model-driven form
  - Canvas apps cannot have a business rule applied to a specific form,
    but business rules for the data are still enforced

- Business rules enforce rules, set values, and validate data regardless
  of the input method to increase data accuracy and development time

- Example business rules:

  - Use with canvas and model-driven apps to set or clear values in
    columns
  - Set required fields on conditions of other fields like set an
    approval over a certain cost limit
  - Validate data and show error messages
  - Model-driven apps can use business rules to show/hide columns,
    enable/disable columns and give recommendations based on business
    intelligence

1.  Rules by applications

    The following business rule actions can be used by canvas and
    model-driven apps:

    - Set column values
    - Clear column values
    - Validate data and show error messages

    Model-driven apps can also use business rules to:

    - Show or hide columns (model-driven apps only)
    - Enable or disable columns (model-driven apps only)
    - Create business recommendations based on business intelligence
      (model-driven apps only)

### Administer

- Microsoft Power Platform admin centre will satisfy most needs. Options
  include creating databases, management access and features.
- Admin centre can manage:
  - Environments - instances
  - Data policies - restrict data connectors and limit data flows
  - Data integration - manage connections and monitor them between
    Dataverse and other data stores like SQL Server

## Create Tables in Dataverse

### Introduction

- Data in Dataverse is stored in sets of records called tables like
  tables in a database
- It includes a standard set of tables that connect to Dynamics 365
- Data can be imported from lists in SharePoint, Excel, or from
  PowerQuery.
- Dynamics 365 uses Dataverse to store and secure data and Power Apps
  can use business data already in Dynamics 365

1.  Logic and Validation

    Dataverse can use server-side logic and validation to ensure data
    quality:

    - Business rules: validate date and provide errors and messages
    - Business process flows: ensure data entry is consistent. Only for
      model-driven apps.
    - Workflows: Workflows automate business processes
    - Business logic with code: Advanced scenarios that extend the
      application directly through code.

2.  Security

    - Role based security is used

### Table Characteristics

- Table metadata describes tables and when tables are edited in
  Dataverse, you can editing the metadata.

1.  When to Use Standard or Create new Tables

    - Know the standard tables and use them where possible
    - You can rename standard tables and their metadata instead of
      creating new tables

2.  Table Relationships

    - Relationships define ways table rows can be associated with rows
      from other tables or the same table with self-referential
      relationships. These relationships are metadata and can be
      one-to-many (1:N) or many-to-many (N:N)
    - The child table will have a lookup column referencing a row in the
      parent / primary table.
    - 1:N relationships also address:
      - When I delete a row, should any rows that are related to that
        row also be deleted?
      - When I assign a row to a new owner, do I also have to assign all
        related rows to the new owner?
      - How can I streamline the data entry process when I create a new
        related row in the context of an existing row?
      - How should people who view a row be able to view the related
        rows?

3.  Table Types

    - Types cannot be changed after a table is created

    1.  Types of Table Owners

        - User/team owned: actions on rows controlled at user level
        - Organization owned: Access to data controlled at organization
          level

    2.  Activity Tables

        Activities are actions that a calendar entry can be made for.
        Actions have characteristics:

        - Time dimensions like start, stop, due dates and duration

        - Data that describe the action like subject and description

        - Have a status as opened, cancelled, or completed with
          completed having sub-status values

        - Only can be owed by a user or team, not an organization

        - See default activity tables at [Table characteristics -
          Training \| Microsoft
          Learn](https://learn.microsoft.com/en-us/training/modules/get-started-with-powerapps-common-data-service/2-learn-about-entities)
          like appointments, emails, fax, letter, phone call, task

        - Custom Activity Tables can be created

4.  Business Rules

    - Rules defined for a table work with apps
    - They combine conditions and actions to set, hide/show, enable,
      validate column values and create recommendations based on BI
    - Some actions are not available in canvas apps like: Show/hide
      columns, enable/disable columns, and create recommendations

### Dual-write vs Virtual Tables

Dual-write and virtual tables allows Dataverse connections to external
data sources and write back to the original source.

1.  Dual-write

    - Out of the box that does near real time integration between
      Database and Finance and Operations apps and promotes sharing data
      and flows within an organization
    - Any data changes in Finance and Operations apps writes to
      Dataverse and the same with Dataverse changes writing back.
    - User experience across apps is integrated

2.  Virtual Tables also know as Virtual Entities

    - Allow integration with external system by representing the tables
      in Dataverse without data replication or custom coding where
      possible
    - It simplifies integration and management of data in Dataverse
      administration roles

3.  When to use Dual-write vs virtual tables

    - Dual-write should be used when you are working with Dynamics 365
      apps and need near real-time integration. Dual-write will
      duplicate the data in both directions (to and from Dataverse).
    - Virtual tables should be used when you are connecting to data
      sources outside of Dynamics 365. There may be built-in connectors
      for these data sources, or you may have to use a custom connector.

### Dataverse Auditing

- Dataverse supports auditing where table and column data changes can be
  recorded for use in analysis and reporting
- Auditing works on custom tables most customizable tables and columns
- Auditing is not supported on table definition changes, retrieve/export
  operations, or during authentication

1.  Concepts

    - Can be enable/disabled at organization, table, and column levels
    - Auditing must be enabled at organization level for auditing to
      work at table/column levels
    - Defaults are: auditing on for all table columns, but disabled at
      table and organization level
    - Audit history is restricted to users with certain privileges:
      "view audit history/summary" and privileges specific to partitions
    - Audited data changes are stored in the audit table

2.  Configure tables and columns for auditing

    - Only users assigned System Administrator or System Customizer can
      enable auditing
    - The setting is a property in the table's definition
    - Specific column auditing is on by default and can be disabled

### Exercise - Create a Microsoft Dataverse Table

All steps are done in Dataverse

- Create a custom table.
- Add custom columns to your table.
- Add a table relationship by selecting another table.
- Customize a view.
- Customize a form.

### Exercise - Import data into your Microsoft Dataverse database

- Import data from Excel, SharePoint, Access, SQL and others

Exercise was to:

- Create a SharePoint pet names list
- Import the list into the pet Dataverse table created above
- Choose columns to import, map to the pet table, and load to the
  existing table
- A refresh schedule can be set for data to regularly update or it can
  be done manually

### Exercise - Create a Customer Table and Import Datra

All steps are in Dataverse

- Create a custom table and set up its columns include one with a
  calculated formula
- Add a business rule to check conditions and modify rule for fields
- Import data from an Excel file

## See Also

- [Microsoft Dynamics](005-Tech-Microsoft-Dynamics.md) - [Microsoft
  Dynamics](id:ffe5c447-66a0-4bf7-b566-a0c54d95e4cf)
