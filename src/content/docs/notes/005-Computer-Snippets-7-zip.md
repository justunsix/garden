---
filetags: ":7zip:snippets:epubnote:"
id: 3432e62b-4989-4e1d-8441-4369599139ba
title: 7-Zip Snippets
---

Source: [7-Zip manual](https://documentation.help/7-Zip/index6.htm)

``` bash

# Update archive using
# type of archive: 7zip
# password: password
# mhe: encrypt file names
# use defaults for all other things (compression method, multithreading, Windows temp directory for working director)
# update mode: synchronize
# use existing or new archive at the file path at G:\b\
# add/synchronize all folder and subfolders/files at test
7z u -t7z -ppassword -up0q3r2x2y2z1w2 -mhe G:\b\test.7z G:\u\testfolder

7z u -t7z -ppassword -up0q3r2x2y2z1w2 -mhe G:\b\testfolders.7z "G:\u\testfolder" "G:\u\testfolder2" "G:\u\testfolder3"
# -u "sychronize" parameter explanation from https://superuser.com/questions/544336/incremental-backup-with-7zip
# p0 - If "File exists in archive, but is not matched with wildcard" then remove the file from the archive.
# q3 - If "File exists in archive, but doesn't exist on disk" then remove the file from the archive and remove it from the filesystem upon extraction.
# r2 - If "File doesn't exist in archive, but exists on disk" then pack the file into the archive.
# x2 - If "File in archive is newer than the file on disk" then pack the older file into the archive.
# y2 - If "File in archive is older than the file on disk" then pack the newer file into the archive.
# z1 - If "File in archive is same as the file on disk" then reuse the packed version of the file.
# w2 - If file size is different then pack the modified file into the archive.

```
