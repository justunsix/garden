---
filetags: ":power-platform:epubnote:"
id: d657cd62-0c79-43b5-8f03-e9eda51cd1d0
title: Microsoft Power Apps - Canvas App
---

Source: [How to build a canvas app - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/build-app-solution/)

## How to Build a Canvas App

### Learning Goals

- Know elements of Power Apps
- Build a canvas app
- Customize the app and configure and manage app settings

### Learn Basic Elements

Power Apps have many components like screens, inputs, galleries, forms.
The following are the most common elements.

- Power Apps Studio
  - The web interface you use to build the app.
  - Everything is done from the browser by logging into
    <https://make.powerapps.com/>
- App format
  - Format can be Mobile or Tablet and cannot be changed after creation
  - Each has different defaults about screens and controls sizes though
    can be used on any device
- Galleries
  - Display rows from data table
  - Uses a template for display each row
- Forms
  - Work with a specific record and often used with a selection from a
    gallery
  - Forms allow users to view and edit data
  - Actions are forms are controlled by form modes to allow multiple
    purposes
- Input Controls
  - Controls like Text inputs, buttons, dropdowns, toggles, date
    pickers, and sliders are some examples.
  - Controls can be added to galleries, forms, and screens to build a
    functional and good app experience
  - Inputs have many settings for default data, formatting, and actions
- Intelligent Controls
  - Used for advanced operations
  - There are hardware-backed controls which allow access to the camera,
    bar code scanner, GPS, and more hardware features.
  - Service backed controls like the business card reader or object
    detector which allow you to add artificial intelligence
- Functions
  - Functions are the glue that binds all controls, inputs, and data
    sources together.
  - One or more functions can create formulas in apps and similar to
    those in Excel
  - Actions such as sending data to a data source, formatting
    information, creating animations

### Build a Canvas App

- Build a canvas app where data source is an Microsoft Excel workbook on
  OneDrive for business. Any data source could be used.
- License: If you do not have a Power Apps account, sign up for a free
  [Power Apps Community
  plan](https://powerapps.microsoft.com/en-gb/developerplan/) which
  allows exploration in your own environment

1.  Use case

    - Excel workbook has a table of buildings owned by Contoso
      Manufacturing
    - Today, the workbook is emailed to different people as they travel
      to make updates to locations
    - App will allow uses to see buildings in their phone and edit
      information and add new buildings

2.  Development Approach

    - Identify a business need that fits with a Power App
    - Connect data to Power Platform
    - Design app interface to allow users to interact with data
    - Save and publish the app and test
    - Share app with users to improve business process

3.  Connect to a Data Source

    - Get and see [Build a canvas app - Training \| Microsoft
      Learn](https://learn.microsoft.com/en-us/training/modules/build-app-solution/3-build-canvas-app)
      for lab files

    - Sign into <https://make.powerapps.com/>

    - Select Create

    - Start from data section \> Excel

    - Connections \> OneDrive for Business

    - Choose an Excel file \> `Contoso Site Tracking.xlsx`

    - Chose a table \> SiteInspector

    - Click Connect

    - For my Power App, I manually:

      - Create a new table in Dataverse mapping to the existing Excel
        table fields
      - Imported the Excel data into the Dataverse table
      - Followed the steps in the connection, except connected to the
        Dataverse table
      - If you get errors like "LocalStorage is being blocked" or an
        "unexpected error occurred", turn off the browser's strict
        tracking settings like in Firefox or Edge. That will enable
        logins to sign into the browser for files

    - Explore the browse (gallery), detail, and edit screens

    - Can submit form using a button and `OnSelect` with [Power
      fx](https://github.com/microsoft/Power-Fx/tree/main)
      `SubmitForm(DetailForm)`

    - Look at different page templates

    - Play the app and run the app in the edit screen using `alt` key to
      navigate it

    - Configuration displayed items on gallery, detail, and edit
      components using `Fields > Edit` in the component like
      `Detail Form > Fields > Edit fields`

### Get started with functions in Power Apps

- Apps may need logic to control navigation, filtering, sorting, and
  other functionality and formulas can support that

Common functions and an explanation of what they do:

- Filter
  - Function used with galleries or tables of data to narrow down the
    rows returned from your data source
  - Set one or more columns in your data to perform a logic test on,
    which returns data that falls in a certain date range, has a set
    value, or was created by the user for example
- Match
  - Check a value to see if it follows a given pattern
  - Use this to check if the user entered a properly formatted email
    address and, if they did not, show them a warning that a valid email
    is required
  - Used for conditional formatting
- Distinct
  - Return the unique values from a list of data, making it easier to
    build dynamic dropdowns that show users only the valid values for
    the given column.
- Math functions
  - Range of math formulas for working with your data from the simple
    such as Sum or Average to the complex such as Atan and Sin to work
    with radians

More functions are available and can be combined for complex problems.
See functions at [Power Fx formula reference for Power Apps - Power
Platform \| Microsoft
Learn](https://learn.microsoft.com/en-us/powerapps/maker/canvas-apps/formula-reference#s)
and instructions on use at [Use basic formulas to make better Power Apps
canvas apps - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/paths/use-basic-formulas-powerapps-canvas-app/).

### Share an app

- Apps can be shared with specific users, groups, or an organization
- Apps can be run in a browser or mobile players
- Permissions can be granted to others to update an app
- Sharing allows other users to use the app and provide feedback to you
  as a creator

1.  Prepare to Share

    - Save the app
    - Use the Share tab and specific users and groups. Use
      `Everyone in <Company Name>` to share with everyone
      - Best practice when sharing with groups of people is to use an
        AAD security group
      - Permissions
        - `co-owner` to give others edit permissions
        - `user` can view and use the app, but not change it
        - All users in a security group get the same permissions from
          that group. Additional permissions can be granted to
          individual userss.
      - Users can be notified by email
    - Click share
    - Create a notification plan to users of updates
