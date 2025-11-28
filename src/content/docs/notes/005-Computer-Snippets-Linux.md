---
filetags: ":linux:snippets:commands:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: 3aca5424-540c-4f65-a7ca-079fd5e94a99
title: Linux Snippets
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

Commands includes GNU coreutils, findutils in other operating systems
and other common commands on Linux

## &\> pipes

``` bash

# pipe output of command to file
start_server &> filename.log

# >> redirection operator will append lines to the end of the specified file
start_server >> filename.log

# > empty and overwrite file
start_server > filename.log

```

## Apropos - Search commands for functions

Useful if you forgot a command and need to search command names and
manual pages

``` bash

apropos "search term"

# Example
apropos "list files"

```

## awk / mawk

- Pattern scanning and text processing language. Mawk interprets the AWK
  programming language
- List of pattern action pairs and function definitions
- Input can be list of files and standard input
- Awk can be enclosed in ' ' or from a file

``` bash
# Emulate cat - Print contents of a file 
mawk '{print}' file.txt

# Get contents of a file where line contains name, split line on = and print name / value pair
mawk '/name/ {split($0,a,"="); print a[1], a[2]}' .gitconfig
```

## cd - Change directory

``` shell

# Using echo $$ to find the pid from another shell
# go to the current working directory of that shell using its PID
cd /proc/12467/cwd

# Change to previous directory
## bash
cd -
## fish
prevd

```

## ImageMagick, Image PDF Conversions, Combining, PDF Optical Character Recognition (OCR)

For image to PDF conversions and OCR, recommend use img2pdf and ocrmypdf

``` shell

img2pdf "$file" | ocrmypdf - "$file.pdf" --rotate-pages

ocrmypdf path/to/pdf output.pdf

```

``` shell

# Join / Merge / combine several PDFs to new file output.pdf
# https://www.omglinux.com/merge-pdf-files-on-linux/
pdfunite file1.pdf file2.pdf output.pdf

# per https://itsfoss.com/merge-pdf-linux/
# Deprecated:
convert -append file1.pdf file2.pdf file3.pdf output.pdf
# If error with above command convert-im6.q16: attempt to perform an operation not allowed by the security policy `PDF' @ error/constitute.c/IsCoderAuthorized/421
# do:
sudo nano /etc/ImageMagick-6/policy.xml
# Usually at bottom of file, you have to change the rights="none" to rights=read|write:
# <policy domain="coder" rights="read|write" pattern="PDF" />

# You can use the convert command in bash to convert multiple images to a single PDF file. Here’s an example command that you can use to convert 3 images to a single PDF file:
# This command will convert image1.jpg, image2.jpg, and image3.jpg to a single PDF file named output.pdf.
# Replace names of your images and the output file name with the desired name of your PDF file.
convert image1.jpg image2.jpg image3.jpg output.pdf

# Make images ready for web - Scale files in a directory to a width in pixels
#!/bin/bash
# for each file in current directory
for file in *; do
    # Use ImageMagick to scale the file's width as pixels in variable "resolution"
    # and rename the new image with the same name as the original file plus "resolution" variable
    resolution = "720"
    convert "$file" -resize "$resolution" "$file-$resolution.jpg"
done

```

## ncdu - ncurses disk usage, see disk usage by directories and navigate them

``` shell

# See cwd
ncdu

# See root
ncdu -x /

# Scan with SSH with
ssh -C user@system ncdu -o- / | ./ncdu -f-

```

## dig - DNS lookup

``` bash

dig google.com

```

## fsck or smartctl - check disks for errors

Source: [How to Run a Disk Check to Fix Bad Sectors -
Baeldung](https://www.baeldung.com/linux/disk-check-repair-bad-sectors)

Alternatively, can use gnome-disks GUI app and click on the drive and
use 3 dot menu to run SMART (Self-Monitoring, Analysis, and Reporting
Technology) tests

Get the device identifiers for the disk(s) to scan

``` shell

# List disks
df -h
# Full list including loops
lsblk -f

```

For later commands, `/dev/sdb` is the example disk to scan

### fsck

``` shell

# First unmount the disk to scan
sudo umount /dev/sdb

# Do a dry run
sudo fsck -N /dev/sdb

# Force filesystem check, perform all checks to search for corruptions even when it thinks there are no issues
sudo fsck -f /dev/sdb

# Fix Detected Error Automatically
sudo fsck -y /dev/sdb

# Force fsck to Do a Filesystem Check
# When you perform a fsck on a clean device, the tool skips the filesystem check. If you want to force the filesystem check, use the -f option.
sudo fsck -f /dev/sdb

# Remount the scanned disk
mount /dev/sdb

```

### smartctl

``` shell

# Can be installed for example with apt
sudo apt-get install smartmontools

# Run scan, note some drives do not support SMART
sudo smartctl -a /dev/sdb

```

## grep - find patterns

print lines that match patterns

Using grep on cwd files should use -r or specify the file(s), otherwise,
grep assumes grep on standard input

``` shell

# ignore case, include lines that match pattern
grep -ir <pattern>
## -r search on files recursively

# exclude lines that match pattern
grep -vr <pattern> *

# Use grep with regex PATTERN on current directory
grep PATTERN *

# print lines that match pattern
grep <pattern> *
## * search in all files in current directory

```

## grub

``` shell

#####################################################
# List all grub entries
# per: https://askubuntu.com/questions/599208/how-to-list-grubs-menuentries-in-command-line
# Simple
cat /boot/grub/grub.cfg | grep menuentry
# Nicely printed
awk -F\' '/menuentry / {print $2}' /boot/grub/grub.cfg
# With numbers for use with grub-set-default, grub-reboot
awk -F\' '/^menuentry / {print $2}' /boot/grub/grub.cfg|cat -n|awk '{print $1-1,$1="",$0}'
# List all entries
awk -F\' '/(^|| )nuentry / {print $2}' /boot/grub/grub.cfg|cat -n|awk '{print $1-1,$1="",$0}'

# Boot into a specific grub entry with number or name
sudo grub-reboot "Windows Boot Manager (on /dev/nvme0n1p1)" # Reboot into Windows next time
# or
sudo grub-reboot 1

```

## htop - Process and task information

``` shell

# Start `htop` displaying processes owned by a specific user:
htop [-u|--user] username

# Display processes hierarchically in a tree view to show the parent-child relationships:
htop [-t|--tree]

# Sort processes by a specified `sort_item` (use `htop --sort help` for available options):
htop [-s|--sort] sort_item

```

## lsblk - list block devices

List information on available devices, drives, disks

``` shell

# List all block devices
lsblk

# List all block devices with size
lsblk -s

# List all block devices with size and mount point
lsblk -s -o NAME,SIZE,MOUNTPOINT

# List all block devices with size and mount point and exclude any loop devices
lsblk -s -o NAME,SIZE,MOUNTPOINT | grep -v loop

```

## man - manual, whatis

``` shell

# Manual for passwd command Section 1: Shell Commands and Applications
man passwd

# Manual for passwod file in Section 5: Standard file formats
man 5 passwd

# Search all man pages with keyword ftp
man -k ftp

# Check if a manual page exists for a certain concept and
# display search results and the relevant Linux manual page section like passwd (5)
man -f passwd
# equivalent command is also:
whatis passwd

# Show location of manual page for a concept
man -w passwd

# Extract arguments of ls command from man page (works on Unix from 2005)
function args() {
    man ls | col -b | grep '^[[:space:]]*ls \[' | awk -F '[][]' '{print $2}'
}

```

Manual Sections from [RTFM! How to Read (and Understand) the Fantastic
Man Pages in Linux](https://itsfoss.com/linux-man-page-guide/)

- Section 1 : Shell commands and applications
- Section 2 : Basic kernel services – system calls and error codes
- Section 3 : Library information for programmers
- Section 4 : Network services – if TCP/IP or NFS is installed Device
  drivers and network protocols
- Section 5 : Standard file formats – for example: shows what a tar
  archive looks like.
- Section 6 : Games
- Section 7 : Miscellaneous files and documents
- Section 8 : System administration and maintenance commands
- Section 9 : Obscure kernel specs and interfaces

## Redirects and Truncate

``` shell

# Clear all contents of a specified file

# Non root method is
# https://superuser.com/questions/90008/how-to-clear-the-contents-of-a-file-from-the-command-line
> file-to-clear.txt

# Clear file that requires root permissions
# https://superuser.com/questions/90008/how-to-clear-the-contents-of-a-file-from-the-command-line/634217#634217
sudo truncate -s 0 /etc/environment

```

## Rename

``` bash
# Find all file names in current directory containing string searchString
# and replace in filename the string foo with string bar
# -n is test first, then run
find . -name "*foo*" -exec rename -n 's/foo/bar/' {} \;
find . -name "*foo*" -exec rename 's/foo/bar/' {} \;
```

## pkill, kill, killall - stop process also known as kill

``` shell

# Kill all processes with name firefox inside process name
pkill -f firefox

# Send signals to process
kill (-HUP) process_id
# kills a process with pid specified
kill -9 pid

# kill all processes by a name, for example firefox browser
killall firefox

```

## ps - process status

``` shell

# List all processes
ps -A

# List all processes with user name
ps -ef

# Search for a process that matches a string
ps aux | grep string

# in bash, show pid of current shell
echo $$

```

## source, environment variables

``` shell

# Source temporary environment variables
# using an .env file
# from https://stackoverflow.com/questions/43267413/how-to-set-environment-variables-from-env-file

## Option 1
### This requires appropriate shell quoting. It's thus appropriate
### if you would have a line like foo='bar baz', but not if that same line would be written foo=bar baz
set -a # automatically export all variables
source .env
set +a

## Option 2
### if .env is a valid shell execution file like export foo=bar
### then simple source will work
source .env

## Option 3
### Assuming no whitespace in environment values
export $(xargs <.env)

```

## sed (stream editor)

``` shell

# Replace `apple` with `mango` on all lines using basic `regex`, print to `stdout`:
command | sed 's/apple/mango/g'

# Use extended regular expressions with -E
sed -E 's/pattern/replacement/flags'
## Replace dog and cat with pet
"dog cat moose" | sed -E 's/(cat|dog)/(pet)/g'

# Use basic `regex` to replace `apple` with `mango` and `orange` with `lime` in-place in a file (overwriting original file):
sed [-i|--in-place] -e 's/apple/mango/g' -e 's/orange/lime/g' path/to/file

```

## ss (socket statistics)

- Check open ports, connections

``` shell

# Show all connections
ss

# Network statistics
ss -s
# Real time report, Ctrl + c to exit
watch ss -s

# List ports and processes
# -t TCP sessions
# -u UDP sessions
# -l Listening TCP connections
# -n numeric, human readable
# -p show process at socket
ss -lntup

# IPv4 connections
ss -4
# IPv6 connections
ss -6

```

## rsync

Source:
<https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories>,
[Everyday Rsync - Veronica Explains](https://vkc.sh/everyday-rsync/),
[Rsync on Archwiki](https://wiki.archlinux.org/title/Rsync)

Synchronize directories and files across local and remote machines

``` bash

# Test Synchronize a source and destination --dry-run
rsync --dry-run -anv source destination

# Synchronize with ssh destination
rsync -av ~/records username@destination.server:~/record-archives
## Best practice is destination is remote in case remote directory is not mounted properly

# Recurvisely copy first directory/file to destination file and exclude folder/files called Archive and include only 7z files
rsync -aPvh --delete "${LIBRARYDIR}/${array[$i]}/" "${LOCALDIR}/${array[$i]}/" --exclude "Archive" --include="*.7z"
# -a archive mode (recursively copy directories, copy symlinks without resolving, and preserve permissions, ownership and modification times)
# -P show progress, partial transfer of files
# -v verbose
# -h use human readable numbers
# --delete delete files in destination directories if not existing in source
#   Can also use --delete-before or --delete-after to have deletes occur at a certain time in job
# --exclude PATTERN do not copy files with PATTERN
# --include PATTERN only include files with PATTERN

# Copy exmaple.txt from local to remote server
rsync -avz -e ssh /path/to/example.txt user@remote-host:/path/to/destination/

# Copy from local to remote
# --progress : Show progress during a transfer using
# -a Archive for recursive and preserver file attributes
# -v verbose
# -z compress data to reduce network use, required processing power
rsync -avz --progress /local/destination/ -e ssh user@remote-host:/path/to/remote-file.txt

```

-a option is a combination flag. It stands for "archive" and syncs
recursively and preserves symbolic links, special and device files,
modification times, group, owner, and permissions. It is more commonly
used than -r and is usually what you want to use. n or –dry-run options
(no changes made) -v verbose The -P flag is very helpful. It combines
the flags –progress and –partial. The first of these gives you a
progress bar for the transfers and the second allows you to resume
interrupted transfers –exclude is used to ignore files and can have a
recursive flag

## tar - archiving utility

``` bash

# Untar a file todo.txt_cli-2.12.0.tar.gz
tar -xvf todo.txt_cli-2.12.0.tar.gz

```

## wget

``` shell

# Mirror site - if you have a website, you can make a complete backup using this one simple command
wget -m www.everydaylinuxuser.com
# -m is a combination of all the -r, -l, -k commands below. Output will log to the screen.

# Download site, and do not go to links below the current URL
wget -m www.everydaylinuxuser.com/context/2 --no-parent
# --no-parent can be used to prevent it from navigating to links below the current URL

# Download site recursively
wget -r -k -l10 www.everydaylinuxuser.com
# -r Download a site recursively and create directories as needed (-x forces creation of directories)
# -l Up to 10 levels deep, by default the command only downloads 5 levels deep
# -k Turns links into relative local links

# Download links from file, infinite levels down
wget -r -k -l0 --no-parent -i artemislinks
# -i download using URLs from a file called artemislinks
# -l0 infinite levels

```

## which, where as, also use newer command type

`which <command>` - find the location of a command

`type <command>`

Similar to:

`whereis <command>` - find the location of command and its manual page

## GNU Coreutils

### cat - concatenate

``` shell

# Send multiline text to a file
cat <<EOF > test.md
The quick brown fox jumped over the lazy dog
EOF

```

### chown, chmod - Change file permission

``` bash

# Give current user read write execute on all files in currect directory and files and folder below it
chmod -R u=rwx ./

# Change ownership to user tom, group admin of text.txt file
sudo chown tom:admin test.txt

# Chage just owner
sudo chown admin test.txt

# Change just group
sudo chgrp devops test.txt

```

See also DevOps Bootcamp [Modifying
Permissions](id:ec2b10e8-9f38-4b44-85be-842d5e02994d) file permissions
section of - [DevOps Bootcamp with
Nana](/garden/notes/005-computer-tech-devops-bootcamp-twn) - [DevOps Bootcamp
Series with Nana Janashia](id:47b64b3b-67a0-4cc5-9e96-2369c5877b08)

### df - display free disk space

Reports on disk space on mounted and mounted file systems

``` shell

# display in human readable format
df -h
df -ahk
# -a all mount points
# -h human readable
# -k Use 1024 byte (1-Kbyte) blocks

```

### du - disk usage

``` shell

# Check disk usage of current directory up to 1 directory level
du -h --max-depth=1

```

### ln - link files

``` shell

# Create a symbolic link to a file
ln -s /path/to/file /path/to/symlink

# Create a symbolic link to a directory
ln -s /path/to/directory /path/to/symlink

# Remove a symbolic link
rm /path/to/symlink
rm -r /path/to/symlink-directory

```

### locate - find files from index

See [Locate Snippets](/garden/notes/005-computer-snippets-locate) - [Locate
Snippets](id:4bb55697-f217-4460-b29b-57d021a951a6)

### od (Octal Dump)

Displays a file in octal (base 8) format by default. Used for seeing
data that isn't in a human readable format that control characters in
files.

``` shell

# Display file in character format and show control characters
od -c input.txt

```

### sort

``` shell

# Sort output of a command or text files, output to standard out
sort file.txt

# Sort file and save back to new file or can be same file
sort file.txt -o new_file.txt

# Call sort from uutil
coreutils sort [OPTION] [FILE]

```

### tee - Update a file's contents and append items

``` shell

# Update a file's contents and append items
# Update /etc/environment for all users
echo "http_proxy=http://2.3.4.5:3128" | sudo tee -a /etc/environment
echo "https_proxy=http://2.3.4.5:3128" | sudo tee -a /etc/environment
echo "export no_proxy=localhost, 127.0.0.1" | sudo tee -a /etc/environment

```

### tr - translate/delete

Use also `sed` command if use of `tr` becomes complex

``` shell

# Replace Characters J for Z
echo 'Call me Justin' | tr 'J' 'Z'

# Replace delimiters
echo 'FirstName LastName Comment Age' | tr ' ' ','

# Replace character with newlines
# Easier way to see a path
echo $PATH | tr ":" "\n"

# Combine techniques below to clean up text
echo "Mangled FiLE-nAMe.txt" | tr -d '-' | tr -s ' ' | tr ' ' '_' | tr '[:upper:]' '[:lower:]'
# and pipe output to tr repeatedly like a bad filename

# Replace lower case with upper case
echo 'Call me Justin' | tr '[:lower:]' '[:upper:]'
# or
echo 'Call me Justin' | tr 'a-z' 'A-Z'
# Other tokens that can be used for matching and replacing
# [:alnum:]: Letters and digits.
# [:alpha:]: Letters only.
# [:digit:]: Digits only.
# [:blank:]: Tabs and spaces.
# [:space:]: All whitespace, including newline characters.
# [:graph:]: All characters including symbols, but not spaces.
# [:print:]: All characters including symbols, including spaces.
# [:punct:]: All punctuation characters.
# [:lower:]: Lowercase letters.
# [:upper:]: Uppercase letters.

# Invert matches with -c (complement)
# Convert all spaces to dashes '-'
echo 'A long file name nice to have as dashed name' | tr ' ' '-'

# Delete characters -d
# Delete all spaces and letter i
echo 'Characters and 12354 numbers' | tr -d ' i'

# Reduce repeated characters -s (squeeze repeats)
# Reduce repeated spaces to a single space
echo 'A  spaced  out  sentence' | tr -s ' '

# Delete all blank characters
echo 'Call  me  Just  in' | tr -d '[:blank:]'

# Delete all whitespace (tabs, newlines, spaces)
echo 'bunch of words to merge' | tr -d '[:space:]'

# Delete everything except digits from a string
# Deletion will include space, whitespace, newlines
# -c and -d to complete (reverse match) and delete others
echo 'Call me 123 Justin 552' | tr -cd '[:digit:]'

```

### uniq - choose unique items

``` bash

# Show only uniq lines in a file
cat file.txt | uniq

```

### yes - repeat string or y

Useful for scripts requiring prompts


    # Output Hello world repeatedly
    yes "Hello World"

    # Automatically confirm a prompt, for example in apt, alternative to apt -y
    yes | sudo apt install vim-nox

    # Automatically decline a prompt by outputting n repeatedly
    yes n | sudo apt install vim-nox
    # Note yes piping will only work when there is a prompt
    # In this example, if all vim-nox dependencies are installed, there won't be a prompt
    # and the package will be installed anyways

    # Limit output of string output to first 5 lines using head limit of 5
    yes | head -n 5

## GNU Findutils

### find

``` bash

# Find files in current directory and subdirectories with .html extension
find . -name "*.html" -type f

# files with foo in the title
find . -name "*foo*" -type f

# Like above, except find all .html files and delete them
find . -name "*.html" -type f -delete

# Find files given filename and other parameters.
# Some usage patterns are below.
# -exec is powerful since it defines what to do with the file(s) found by the find command. For example, you can use grep to look for information inside those files (see below)
find (./ -name or expression 'in quotes') -print

# Find files containing a string called "string_here"
find / -type f -exec grep -l "string_here" {} ;

# Find files containing a string called "string_here" and output the lines from those files that contain that string. -print will show which files were found
find / -type f -print -exec grep -l "string_here" {} ;

# To see which files within the current directory and its subdirectories that end in s
find . -name '*s' -print

# Find files with dolphin in the file name, case insensitive and is a pdf
find . -iname '*dolphin*' -iname '*.pdf' -print

# Find largest files in current directory, sort
find ./ -type f -size +2G -exec du -h {} + | sort -rh | head -30
# -type f - is a file
# -size +2G - is 2 gigabytes or larger
# du -h - print out file information
# head -30 - first 30 files

```

### xargs

``` bash
# xargs is a command that takes the output of a command and uses it as arguments to another command. It is useful for passing the output of one command to another command. For example, you can use it to pass the output of find to rm to delete files.
# xargs can also read from file instead of standart input using -a file

# Common examples of xargs usage:
# - delete files found by find where files end in 's'
find . -name '*s' -print | xargs rm

# Find files named core in or below the directory /tmp and delete them, processing  filenames  in
# such a way that file or directory names containing spaces or newlines are correctly handled.
find /tmp -name core -type f -print0 | xargs -0 /bin/rm -f

# Generates a compact listing of all the users on the system
cut -d: -f1 < /etc/passwd | sort | xargs echo

# Find a specific file and open its directory in Dolphin
find . -name 'file_name' -exec dirname {} \; | xargs dolphin
find . -iname 'filename' -printf %h\0 | xargs -0t dolphin
```

This post lists common commands used in Windows and Linux/Unix system
administration, server support, and troubleshooting.

## Networking

- `ifconfig` - network information
- `netstat` (deprecated, use ss) - active network connections
- `ps aux` - check processes and network usage
- `nslookup` - check IP address of domains
- `ping` - check if a host is reachable

## Other Linux/Unix Commands

The first command indicates the command name (searchable with a man
page). The parens indicate useful extensions

| Command    | Usage/Function                                           |
|------------|----------------------------------------------------------|
| egrep      | Extract line containing word / pattern after the command |
| pwd        | Print (output to console) current working directory      |
| less, more | Console content control/reader                           |
| cp         | copy                                                     |
| mv         | move                                                     |
| rm (-rf)   | Remove (with recursive and forced)                       |

ampersand (&)Â - Executed after a UNIX command makes the command run
while providing the command prompt back. Using & allows you to continue
to type more UNIX commands.

Common use of the ampersand ( & ) is at the end of commands that open
their own windows like a web browser or an editor..

The amperand (&) means something different when used immediately after a
greater than (\>) for output redirection or after the pipe symbol ( \| )
for passing output to other commands.

### Utility

| Command | Usage/Function |
|----|----|
| cat |  |
| man | Manuals (help pages) for system commands. |
| ln –s | Create symbolic links between files |
| touch |  |
| ftp | File transfer protocol program |
| ping |  |
| finger |  |
| telnet |  |
| ssh | Secure Shell |
| bash | Bash shell (running activates bash shell on console if it is available). |
| whois | Query |
| traceroute | Trace network route |
| lynx | Text based HTML browser |
| mount, unmount | Mount or unmounts file systems |
| date | Date/time on system |

1.  runmqsc - (WebSphere Messaging Queue MQ)

    ex. runmqsc

    DISPLAY CHSTATUS(\*)

    display all channels info

    DISPLAY CHSTATUS('')

    STOP CHANNEL('')

    RESET CHANNEL('')

    START CHANNEL('')

    DISPLAY CHANNEL('')

### System Administration

See [DevOps Bootcamp - Operating Systems and Linux
Basics](/garden/notes/005-computer-tech-devops-bootcamp-twn-operating-systems-and-linux-basics) -
[DevOps Bootcamp - Operating Systems and Linux
Basics](id:e37ac848-6bb2-4f18-afcf-71c6a7388961) for common commands and
file system structure.

### Useful Concepts for Linux/Unix

1.  Directory Structure

    **Logs, spools, and file resources (mail, logs, temp, etc.)** :/var

    **Configuration Files** :/etc, /etc/rc.init (startup scripts).
    /etc/sendmail.cf

    **Unix "blackhole"** :/dev/null

    **Core Command locations if not in path** :/usr/(s)bin,
    /usr/local/(s)bin, *usr/sfw/bin* \| Solaris: /usr/openwin

    **Devices (I/O)** :/dev

    **Mounted Systems** :/mnt, /media

    **Code Libraries/Modules** :/usr/lib, /usr/local/lib

    **Stored source** :/usr/src

    **Services** :/etc/services - example of entries in services file
    (ports and protocols associated with the ports.

    netstat 15/tcp

    ftp 21/tcp \# File Transfer

    ssh 22/tcp \# Secure Shell

    telnet 23/tcp

2.  Platform Specific

    User settings ~/.\<user setting folder\>

    e.g.~/.kde/share/apps stores KDE desktop settings and
    configurations.

3.  Checking Memory

    ``` shell

    # Check Free physical Memory
    top
    sar -r
    vmstat

    # For swap:
    swap -s
    swap --l

    ```

## See Also

- [awk - text processing and pattern
  scanning](/garden/notes/005-computer-snippets-awk) - [awk Snippets - text
  processing and pattern
  scanning](id:105e4b70-09da-40e7-9d7f-3798899a3b00)
- [DevOps Bootcamp - Operating Systems and Linux
  Basics](/garden/notes/005-computer-tech-devops-bootcamp-twn-operating-systems-and-linux-basics) -
  [DevOps Bootcamp - Operating Systems and Linux
  Basics](id:e37ac848-6bb2-4f18-afcf-71c6a7388961)
- [fzf Snippets](/garden/notes/005-computer-snippets-fzf) - [fzf Fuzzy Finder
  Snippets](id:1aa7c311-74a6-4304-86f1-4c3676ad2498)
- [GNU Info Snippets](/garden/notes/005-computer-snippets-info) - [GNU Info
  Snippets](id:9421a803-3ff4-4a17-87a5-322cabb371e3)
- [Linux Terminal Shortcuts
  Readline](/garden/notes/005-computer-shortcuts-linux-terminal-gnu-readline) -
  [Linux Terminal Shortcuts - GNU
  Readline](id:bf3b61d8-23cc-4959-a5c7-17041d7e43f4)

### Resources

- [List of GNU Core Utilities commands -
  Wikipedia](https://en.wikipedia.org/wiki/List_of_GNU_Core_Utilities_commands)
