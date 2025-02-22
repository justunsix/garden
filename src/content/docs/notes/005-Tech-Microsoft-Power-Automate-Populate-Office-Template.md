---
filetags: ":microsoft:power:automate:power-platform:epubnote:"
id: 1623df91-3319-45d2-acef-27e1d1cf9d07
title: Power Automate - Populate an Office Template
---

Source: [Populate a Word Template with Power Automate \| How to
Tutorial - YouTube](https://www.youtube.com/watch?v=vpo_U5Qf1ak) and
June M at work

- Create Microsoft Word Template with content controls - for example,
  select a template and creating fields like text and images to populate
  later in Power Automate
- Populate Word Template with Power Automate - for example, selecting
  data from the Dataverse and putting them into fields in the template
- Generate Word Document - for example, put content in the template and
  and email to a user and store in a data source

## Create Microsoft Word Template with content controls

- Use Microsoft Word, create new or use existing template
- Enable Developer tab in Word - File \> Options \> Customize Ribbon \>
  Developer
- Use Developer tab, select text on screen, and insert a control, like a
  text control, picture controls
  - Give controls unique titles
- When done editing template, save to OneDrive

## Populate Word Template with Power Automate

- Create a new instant cloud flow
- Use a manual trigger
- Add action, use Word Online (Business) connector
  - Set template location to OneDrive location of template file
  - Use Advanced Parameters to see content controls - should be all
    controls you created in the template
    - For images, for example, can get images from a data connector,
      choose dynamic content
      - Add a step before Word step, use SharePoint get to an image
- Add action, Office 365 Office connector
  - Send to email of your choice, subject
  - Attach populated Word document:
    - Attachments
      - Name: Filled-In.docx
      - Content: choose from dynamic content from Word step
        - Choose text input
        - Make sure there are no double quotes around the dynamic
          content generated Word document

## Generate Word Document from Data Source

- Manually trigger flow to test above steps
- Create new flow with action: for a selection item in SharePoint,
  called "Generate Document"
  - Get details of item, for example in SharePoint use below steps
- SharePoint - Get Item: choose site, list, and ID (dynamic content from
  trigger action)
- Compose - get dynamic content, for example a "category" value from the
  get item from previous step
- SharePoint - Get file content:
  - Get image based on category of compose step
- Step: Word Connector, Populate Word document
  - See content controls and populate using data from text and images
    from previous steps. Most details are from the get item step
- Send an email
  - Get user's email and subject from item
  - Attachments as before
- SharePoint: Add attachment
  - Choose file name like document.docx and document content as dynamic
    content from Word step
