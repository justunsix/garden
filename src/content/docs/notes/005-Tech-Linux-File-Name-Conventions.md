---
filetags: ":epubnote:file:naming-conventions:"
id: f7d7ef8a-b063-4036-a28c-4eb8dc8cd66e
title: Linux File Name Conventions
---

## File Name Conventions Suggestions for All Operating Systems

[STOP! Don't Name That File Without First Watching This Video. -
YouTube](https://www.youtube.com/watch?v=Wu0CxdflECY) by DistroTube

Recommendations:

- Most important: be consistent for yourself
- Use all lower case as some operating systems like Windows are case
  insensitive for filenames
- Avoid spaces and replace spaces with hyphens or underscores. Hyphens
  are recommended for overall consistency to avoid clashes with
  timestamps
- No special characters, like underscores do not go well with viewing on
  web
- For dates in file names, use YYYY-MM-DD format or YYYYMMDD format,
  obtain in CLI using

``` shell

# Get date format
date -I

# Store to variable
date=$(date -I)

# Create file
touch file-name-$date
# file will be created like: file-name-2019-01-01

```
