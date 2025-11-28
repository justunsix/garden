---
date: 2025-08-10
filetags: ":devops:automation:mindmap:epubnote:"
id: 61db8dc3-538b-4950-9260-1b3ec8e5ca30
title: DevOps Automation Mindmap
---

## Example of Automation Use Cases

See example how this mind map was created at [Blog - Create a mindmap
from text with
PlantUML](https://www.drawio.com/blog/plantuml-mindmaps-from-text) and
syntax at [PlantUML mindmap
syntax](https://plantuml.com/mindmap-diagram)

``` plantuml
@startmindmap

header
Automation of repeated actions
endheader

+[#orange] Work
++ <&star> Projects and Requests
+++ Report of Change Requests
+++ Database with web app/mobile app/Power App
++ Backups
++ Biweekly manager updates
++ Reporting Solution
+++ Infrastructure
++++ <&star> Users csv input validation
++++ SQL queries and database updates
++++ <&star> MFA reset requests
++++ Alert processing
++++ IAC
+++++ Alerts creation and management
++++++ <&star> Budget alerts
+++++ Clean database firewall rules
+++++ Logging configurations

+[#lightblue] Business
++ <&star> Invoice management from CSV
++ Cloud synchronization
++ Automate campaign creation, there is Google ads API, but complex for small businesses
++ <&star> Client reports creation from Google report CSV files

+[#43FF00] Home
++ Backups
++ <&check> Library management
+++ <&check> Library Metadata

legend right
Legend
<&star> - Candidate for implementation
<&check> - Completed items

Comments: IAC could be Terraform
endlegend

@endmindmap
```

## See Also

- [Mind Mapping](/garden/notes/370-education-learning-creative-mind-mapping) -
  [Mind Mapping](id:51531d20-d826-4f34-9ba1-1816a655a24b)
