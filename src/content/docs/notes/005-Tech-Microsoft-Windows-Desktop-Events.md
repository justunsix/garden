---
filetags: ":microsoft:windows:epubnote:"
id: de6db2c0-36c3-4779-b02c-d577af35370a
title: Microsoft Windows Desktop Events
---

## Get Uptime Report for Windows 11

How to check on a Windows 11 machine when it is turned on and produce a
report showing the uptime by days.

### Using PowerShell

See script to query Windows 11 event logs and produce uptime report at:
<https://github.com/justunsix/azure-tests/tree/main/virtual-machine>

### Using Event Viewer

- Open Event Viewer:
- Press Win + X and select Event Viewer.
- Alternatively, you can search for “Event Viewer” in the Start menu.
- Navigate to System Logs:
- In the left pane, expand Windows Logs and select System.
- Filter the Logs:
- Click on Filter Current Log in the right pane.
- In the filter window, enter 6005, 6006 in the \<All Event IDs\> field.
  Event ID 6005 indicates the event log service was started (system
  startup), and Event ID 6006 indicates it was stopped (system
  shutdown).
- Review the Logs:
- Apply the filter and review the logs to see the startup and shutdown
  times.
