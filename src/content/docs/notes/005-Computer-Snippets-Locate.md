---
description: Locate files using an index of files stored in a database
filetags: ":locate:snippets:epubnote:"
id: 4bb55697-f217-4460-b29b-57d021a951a6
title: Locate Snippets
---

``` shell

# Update Locate index database
sudo updatedb

# Use a specific database called db_file for indexing the source_directory
updatedb -l 0 -o db_file -U source_directory

# Locate using a specific database
locate -d db_file MyQuery

```
