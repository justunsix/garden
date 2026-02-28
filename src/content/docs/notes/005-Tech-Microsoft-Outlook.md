---
filetags: ":outlook:microsoft:epubnote:"
id: 7b63aaa4-93d8-4cc6-8d41-215f67d2776e
title: Microsoft Outlook
---

Tips with using Microsoft Outlook and email

## Using Email Templates

Source: [Create an email message template - Microsoft
Support](https://support.microsoft.com/en-us/office/create-an-email-message-template-43ec7142-4dd0-4351-8727-bd0977b6b2d1)

Use case: Reuse text you often use in emails from a save template

### Alternative method to saving email templates

Source: Correspondence with June M at work

- In Outlook, create a new message and format it as a template. Save it
  as a draft
- Open the draft message, use file \> save as, then choose format type
  as "Outlook Template"
- The file manager should save the template automatically to
  `$env:APPDATA\Roaming\Microsoft\Template` which is the user's app data
  folder like `C:\Users\myusername\AppData\Roaming\Microsoft\Templates`
  on Windows.
- You can reuse templates saved in the folder in the Outlook desktop
  application

## Finding the Folder that Contains a Message

Source: Correspondence with Jim M at work

If you’ve ever tried to find a folder you’d created in Outlook.

Use Case:

- You go to a file or retrieve an email message in Outlook and can’t
  remember the name of the subfolder you put it in, or you can’t
  remember the location of the subfolder.
- Outlook allows you to search messages and can tell you the name of the
  folder where they’re stored, but it doesn’t show the folder path,
  where it’s located.

If you want to know the exact full folder path of a message, find the
message via Advanced Find.

1.  Double click on the message to open it in its own window.
2.  Open the Advanced Find feature via the keyboard shortcut
    CTRL+SHIFT+F
3.  The "Look in" field will reveal the folder name to you and clicking
    on the Browse button will show you where in that is exactly in your
    folder hierarchy.

Via Advanced Find, you can determine the exact folder path of an opened
message.

## Adding Calendar Dates to Micrsoft Outlook using CSV

You can import the holiday dates into your Outlook calendar (individual
all-day events showing out of office) by downloading a file with dates
in a csv format. Example CSV files are given below for different years.

Following the instructions to import into Outlook:

- Open Microsoft Outlook
- Click File in the upper left corner of the application window
- Find the Open & Export menu, and select Import and Export menu
- Follow the steps of the Import wizard:
  - Import from another program or file (next)
  - Comma Separated Values (next)
  - Browse for wherever you saved the above file (next). Choose the
    option that best fits your needs, are you okay with duplicates?
  - Choose the calendar you want to add dates to. If you were already in
    your calendar, it will already be selected. (next)
  - You should not need to map any custom fields, click on the Finish
    button.
- If you want to customize the ‘Show Time As’ column, save it again as a
  .csv file using these numbers:
  - 1- Tentative
  - 2- Busy
  - 3- Free
  - 4- Out of Office

See [Calendar Dates](/garden/notes/300-social-sciences-culture-calendar-dates) -
[Calendar Dates](id:f7d544fd-2701-4cc2-b694-e048d4a9571f) examples of
dates defined in a CSV format that can be imported with Outlook.
