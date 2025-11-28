---
description: Linux basics are required for other DevOps concepts.
filetags: ":devops:nana:bootcamp:epubnote:"
id: e37ac848-6bb2-4f18-afcf-71c6a7388961
title: DevOps Bootcamp - Operating Systems and Linux Basics
---

Source: My notes and personal comments from DevOps course by TechWorld
with Nana

## Introduction to Operating Systems (OS)

- Hardware: CPU, memory, storage, I/O devices

- Applications need access to all hardware, like a browser to take I/O
  devices, allocate CPU/memory and store files

- Operating system (OS):

  - Is a layer between hardware and applications so applications do not
    need to know everything about hardware.
  - The application interacts with the OS get access to hardware.
  - OS is like a translator between hardware and applications.
  - Manage resources between applications
  - Isolate applications to prevent interference

### OS Tasks - Resource Allocation and Management

- Manage CPU, memory, storage, I/O
- CPU, Processes
  - Small units on computer
  - Each process has an isolated space
  - 1 CPU = 1 process at a time, CPU can switch fast so quick you do not
    notice when multitasking
    - Recent technology have multiple CPU / cores
      - Ex. quad core = 4 CPUs
      - More CPus, faster applications work
  - Example: new browser tab is a new process
- Memory
  - Allocate working memory
  - Every application needs some data
  - RAM is limited, OS swaps memory between processes. One app becomes
    inactive, new one get memory
    - Memory swapping can be slow and takes time
    - OS saves RAM into storage from process 1, clears memory, swaps in
      from storage to RAM for process 2
- Storage
  - Secondary memory - persistent data long term = computer hard drive
    - Ex. Save a file you worked on
    - Can save any data
    - Stored in a structure
      - Unix like systems:
        - Tree file system
          - /root -\> children
      - Windows
        - Multiple root folder (drives)
  - Working memory - RAM
    - Ex. File you are editing, is loaded into RAM
  - I/O Devices
    - OS translated between them
    - Ex. keyboard, mouse, display, printer
  - Security and Networking
    - Users and permissions. Each user:
      - Own storage
      - Permissions
    - Networking
      - IP, ports

### OS Construction

- Components

  - Kernel
    - Loads first, heart of OS. Is a program of device drivers,
      dispatcher, scheduler, file system, etc.
    - Handles interaction with hardware
    - Applications talk to kernel, kernel talks to hardware
    - Starts process, manage resources, clear resources
    - Types:
      - Linux kernel is most widely used, especially servers and phones
      - Darwin kernel (MacOS, OSX)
  - Application layers
    - Ex. Ubuntu, Debian, Fedora, Android have different layers and
      based on same Linux kernel
    - Servers OS usually have lightweight application layers, like
      little or no GUI layers. They use hardware more efficiently
    - Client OS usually have graphical application layers

- OS Components review:

  - Hardware \> Linux Kernel \> Android \> Apps

- OSes like Linux, Windows, MacOS keep same kernel and they and their
  application layers are improved over time

- Operating system is powering all devices

- MacOS vs Linux

  - Command line, file structure is similar. Windows is completely
    different.
  - Unix is codebase for other OSes.
  - Linux was developed independently though is Unix like; created by
    Linus Torvalds. It is the most used OS for servers and hence
    important for DevOps people to know.
    - Many DevOps tools are Linux native
  - MacOS kernel Darwin is based on Unix
  - For compatibility, standards were created to allow applications to
    run across systems.
    - Portable Operating System Interface (POSIX) is a popular standard.
      Both Linux and MacOS are POSIX compliant.

## Introduction to Virtual Machines (VM) and Virtualization

### What is Virtualization and Virtual Machines

- We have hardware, OS, applications on a computer. What if we have
  Windows and want to use Linux? we need another computer…

- With virtualization, no separate hardware is needed to run another OS

- Hypervisor allows hosting other VMs on host OS. A popular hypervisor
  is VirtualBox being open source and runs on all OSes.

  - Only resources available on the host can be given to VMs, hardware
    resources will be shared with host and guest VMs. VMs are isolated
    and feel like they have their own hardware - advantage is host is
    not affected.

### Benefits of Virtualization

- Learn and experiment
- Keep main OS
- Test things on a different OS
  - Like testing applications on different OS and browsers

### Type 2 Hypervisor

- Hardware \> Host OS \> Hypervisor \> Guest OS
- Guests borrow resources from host OS
- Usually for personal computers

### Type 1 Hypervisor

- Usually for servers
- Hypervisor is installed directly on hardware. "Bare metal hypervisor"
- Hardware \> Hypervisor \> Guest OS
- Ex\> VMware ESXi, Microsoft Hyper-V

### Why Use Virtualization?

- Use cases:
  - Cloud computing, VMs are still isolated
  - Efficient use of hardware resources
    - Use all resources of server
    - Users can choose any resource combination

Abstracting OS from hardware:

- Without virtualization, OSes are coupled with hardware. Hardware is
  single point of failure
- With virtualization, OSes are portable VM images (ex. VMI,
  snapshots) - OS, applications. You can have backups of entire OSes.
  - Portable OSs are secured easily, portable, and not dependent on
    physical hardware

## Setup a Linux Virtual Machine

Demo overview:

- Install VirtualBox Hypervisor
- Setup Linux Ubuntu Virtual Machine

Demo works on on operating systems and are free

### Install VirtualBox

- Download VirtualBox, choose your host system
- Install VirtualBox
  - You may need to allow VirtualBox to access your computer
- Run VirtualBox GUI
  - Require at least 4 GM RAM on host computer

### Prepare VM environment

- Create new Linux VM
  - Name: Linux Ubuntu
  - Type: Linux
  - Version: Ubuntu (64-bit)
  - Memory size: 2048 MB (2GB)
  - Create a virtual hard disk now
    - VDI (VirtualBox Disk Image)
      - Other disk types are useful to run OS on other Hypervisors
    - Dynamically allocated
      - Hypervisor will intelligently scale disk and request storage as
        needed from host
      - Leave default locations
- Download Ubuntu .ISO File
  - Choose Long Term Support (LTS) version
  - Can be used to install on your computer or VM
- Start VM
  - Select the ISO file you downloaded earlier
  - Start VM
  - Install Ubuntu
    - Select language
      - Select your keyboard type
    - Select install type
      - Erase disk and install Ubuntu
        - Ok since it is a virtual disk, does not affect host
    - Select time zone
    - Enter name, username, password
    - Wait for installation to complete
  - Restart VM
    - Login
    - Confirm settings

### Virtual Machine Settings

- Shutdown VM:
  - Save machine state
    - It will start as your left it
  - Power off
- Settings
  - General \> Advanced:
    - Shared Clipboard: Bidirectional
      - Copy and paste
    - Drag and Drop: Bidirectional
      - Can drag and drop files
  - Requires VM VirtualBox Extension Pack
    - Download and install
    - Restart VM, Devices menu \> Insert Guest Additions CD image
      - Run installer
      - Unmount image
- Network
  - VM runs in an isolated network
  - Setting can be changes, like allow VM to run in your host's network
- Sharing
  - The more you share between your guest and host, the VM's isolation
    will be reduced and is a security risk

## Linux File System

- Hierarchical file system
  - Root directory
    - Child directories…
      - Child directories
        - Files
- Windows has multiple root directories (drives)
  - A: removable disk floppy
  - B: removable disk
  - C: internal hard drive
  - … Other drives

### Linux File System Overview

- File manager GUI
  - By default, opens in user's home directory
  - Go to other folders: In Nautilus, click on folder name in the path
    bar or "Other Locations"

Directories under `/`

- `/home` - Each user has their own space in `/home`
  - Multiple users on computer
- `/root` - Root's home
- `/bin` - Binaries, available for all users, system wide
  - Binary = format a computer understands and reads
  - Executable programs, basic commands like cat, cp, ls
- `/sbin` - System binaries, meant for superuser, system management
  - System commands like `adduser`, `iptables`
  - Used by system itself and administrators
- `/lib` - Shared libraries that executables from `/bin` and `/sbin` use
- `/usr` - User binaries
  - Originally was home
  - `/usr/bin`
    - Similar commands as /bin
  - `/usr/sbin`
    - Similar commands as /sbin
  - `/usr/lib`
  - Why separate files in `/usr`?
    - Historic: because of storage limitations, it was split root and
      user binary folders. This limitations is not relevant; however,
      the separation is still there and files are duplicated.
    - When a user executes commands, they are usually executed from
      `/usr` binaries folders
    - In some cases, the `/bin`, `/sbin` folder will have minimal files,
      and `/usr` binaries folder will have more files
    - `/usr/local` - Local binaries from programs you install, Non-OS
      applications, Available for all users on the computer
      - Installed by user
      - `/usr/local/bin`
      - `/usr/local/sbin`
      - `/usr/local/lib`
      - Ex. you install java, it will be in `/usr/local/` with binaries,
        libraries, etc. in respective folders
- `/opt` - Optional applications, 3rd party
  - Difference between `/opt` and `/usr`?
    - Some application do not split between `/bin`, `/lib`. Applications
      that store all their files in one application folder belong in
      `/opt`
      - Ex. IDE
- `/boot` - Need for booting, used by system
  - Should not be touched

In general, all folders above except user's home directory are read
only.

- `/etc` - system configurations
  - Originally was for "etcetera", anything not in other folders
  - Ex. network, passwords, users, groups
  - Dictionary (word list) for language of the operating system
    `/etc/dictionaries-common/words`
- `/dev` - devices
  - Ex. webcam, mouse, keyboard, USB
  - Used by apps and drivers. Not for users
- `/var` - variable data
  - Ex. logs, cache, temporary files
  - Logs from different processes
- `/tmp` - temporary files
  - Ex. temporary files from applications
  - Files are deleted later
- `/media` and `/mnt` - media and mount
  - External media like external hard drives, will appeared in `/dev`
    too
  - Mount is for external file systems

Usually users do not have to interact with folders directly.

Examples:

- Plug in USB -\> `/media`
- Change configurations -\> `/etc`
- Install application -\> `/opt`, binary folders

### Hidden files

Use file manager - show hidden files

All OS types have hidden files.

- Have `.` in front of them, sometimes called dotfiles. Add dot in front
  of file/folder and it will be hidden

- Hidden to help prevent them accidently deleted

- User configuration files in user's home directory:

  - Ex `.mozilla` folder has Firefox configurations and logs
  - Automatically created files by OS, applications for configurations

## Introduction to Command Line Interface (CLI)

- Work with file system, manage files
- GUI vs Command line interface (CLI)
  - Everything in GUI can be done in CLI
  - 2 different interfaces for users
  - On servers, usually only CLI
- Access CLI using Terminal

### Terminal

Terminal accesses CLI

- Prompt: `user@hostname:current_directory$`
  - Useful for remote connections
  - `$` sign - user is signed in
  - `#` sign - root

## Basic Linux Commands

- `clear` - clear terminal

### Directory Operations

- `pwd` - print working directory, show folder you are in
- `ls` - list files and folders
  - `ls -l` - long list
  - `ls -a` - show all including hidden files
  - `ls -la` - long list and show hidden files
  - `ls -R` - recursive, show all files and folders in directory and
    sub-directories
- `cd` + directory name - change directory
  - `cd ..` - go up one directory `cd ../..` - go up two directories
  - `cd ~` - go to current user's home directory
  - `cd /` - go to root directory
  - `cd /usr/local/bin` - use absolute path to go to user's local
    binaries
  - Use `tab` key to auto complete directory names
- `mkdir` + directory name - make directory

### File Operations

- `editor` + file name - open file in editor
  - Ex. `nano` + file name
  - `touch` + file name - create file
- `rm` + file name - remove file
  - `rm -r` + directory name - remove directory
    - `-r` = recursive
  - `rm -rf` + directory name - remove directory and all files in it
- Notice `-` dash passes parameters to commands
- `cat` + file name - print file contents, stands for concatenate
  - `cat` + file name + `>` + file name - copy file contents to another
    file
  - `cat` + file name + `>>` + file name - append file contents to
    another file

### Everything in Linux is a file

Including:

- Files
- Directories
- Commands
- Devices

### Navigating the file system

- Use `pwd`, `ls`, `cd` commands

### More Commands

- `mv` + file name + new file name - move file / rename file
- `cp` + file name + new file name - copy file to new location
  - `cp -r` + directory name + new directory name - copy directory to
    new location
    - Similar to `rm`, `-r` is recursive
- `Ctrl-c` - cancel current process

### History of Command Line

- Execute previous commands from command history, using arrow keys up
  and down
- `history` - shows command line history
  - Press `/` inside history to search text
  - Bash:
    - Search previous commands in bash: press `Ctrl + r`
  - Fish
    - Start typing at prompt for text, then use up/down arrow keys to
      match results or tab to choose

### Copy and Paste in Terminal

- `Ctrl + Shift + C` - copy
- `Ctrl + Shift + V` - paste

### When to use CLI over GUI?

CLI Advantages:

- When experienced in CLI, you can work more efficiently in one window.
  Some commands are easier to do in CLI.
- Easier for bulk operations, repetitive tasks
- CLI is more powerful

GUI Advantages:

- Visual tasks like video editing, web browsing

### System Commands

- `uname -a` - print system information including:
  - Kernel
  - Versions
- `cat /etc/os-release` - print OS information
- `lscpu` - print CPU information
- `lsmem` - print memory information

### Super User Commands

- `sudo` + command - run command as super user
  - `sudo` + `su` - switch to super user
  - `sudo` + `su -` - switch to super user and open new shell
  - `sudo` + `su -l` - switch to super user and open new shell
  - `su - <username>` - switch to user and open new shell
    - Requires username's password

Run with sudo:

- `adduser` + username - add user
  - Fill in information
  - User home directory and default dotfiles will be created

## Package Manager - Installing Software on Linux

How to install software on Linux

- In Windows, you download from a site and install software. This method
  is not recommended for Linux.
- In Linux, using a package manager is recommended

### What is a Software Package?

- Compressed archive with all required files

  - In Linux, files will be distributed in Linux's various directories,
    making uninstall complicated.

- Apps usually have dependencies

  - Dependencies are usually not included in the package

- Package manager, manages:

  - Installation / Uninstall of its files in different places
  - Updates, Upgrades
  - Dependencies and their dependencies

- In every Linux distribution, a package manager is included.

- In Ubuntu, you have Advanced Package Tool (APT)

### Manage Software with APT

- `apt` - run help
- `apt search` + name of software - search for software
  - Ex. `apt search openjdk`
  - Typing the command in the terminal in Ubuntu system will also
    suggest apt packages if not installed
- `sudo apt install <package-name>` - install package
  - Ex. `sudo apt install openjdk-11-jdk`
  - `sudo apt install <package-name> -y` - install package without
    confirmation
- `sudo apt remove <package-name>` - remove package

### Benefits of Package Managers

- Central place to install, upgrade, configure, remove software

### Difference between apt-get and apt

- In Ubuntu, apt-get is available out of box
- apt provides:
  - More user friendly output, like progress bar
  - Fewer, but enough command options
  - apt-get has no search
  - apt-get gives specific output

### Repositories

Where are packages stored?

- They are stored in repositories that contain packages, they can be
  local, though most are online

- Package manager uses repositories to get software

- `apt update` - update package index, check updates of installed
  packages

- `/etc/apt` - directory where apt stores its configuration files

  - `/etc/apt/sources.list` - list of repositories
    - Out of box, Ubuntu has official repositories

### Other Software Installation Alternatives

- GUI for installing software

- You will need other ways to install software because:

  - Packages are not in official repositories
  - Packages in repository is outdated
    - Software verification can take time

### Ubuntu Software Centre

- GUI for installing software
- Ex. install IntelliJ community in centre

### Snap Package Manager

- Formerly called "snappy"
- Can be used on any OS using Linux kernel
- A "snap" is a bundle of an application and its dependencies. All files
  are in compressed file.
- Ex. `sudo snap install code` to install VS Code

When to use Snap or APT?

- Snap packages are self-contained, supports multiple platforms and
  versions, automatic updates
- APT shares dependencies, only for specific distributions, manual
  updates, better storage use

Prefer using APT when possible.

### Add Repository

- Used when installing relatively new applications which are not in
  official repositories yet.

- Add repository to `/etc/apt/sources.list`

- Install package as usual `apt install`

- PPA = Personal Package Archive

  - Provided by community
  - Anyone can create this PPA to distribute software
  - Usually from developers to provide updates more quickly
  - Not verified by your Linux distribution, you must trust the PPA
    owner

### Common ways of Installing Software on Ubuntu

- APT
- Snap
- Add repository

### Package Managers on Other Distributions

Linux distributions based on same source code, can use the same package
managers

- Debian based: apt, apt-get
  - Ubuntu
  - Debian
  - Mint
- RedHat based: Dandified YUM (dnf), yum
  - RedHat Enterprise Linux (RHEL)
  - CentOS
  - Fedora

Similar concepts:

- Package manager uses official repositories
- Download packages, resolve dependencies
- Repos will be different
  - Versions of packages, software available

## Working with Vim Editor - VI and VIM Text Editor

Vim is a UNIX Text Editor, fast and available in command line.

### What is Vi and Why use it?

- Vi is the most distributed and used editor in Linux
- Vim may or may not be installed in other distributions

### Why not use GUI editors? When Vi is better

- Quickly do a small edit on a file, especially while working in CLI
- Create and edit a file
- Support multiple formats
- Working in a remote, CLI only environment

Other use cases:

- Git CLI commit message
- Display configuration files (e.g. Kubernetes)
- Quickly edit one line or character in a file

### Working with Vim Editor

- Install with `sudo apt install vim`
- `vim` + filename - open vim editor, edit new/existing file

### Command Mode

- Default mode
- Cannot edit text
- All input is interpreted as a command
- Navigate, search, delete, undo

### Insert mode

- Type characters and insert text

For example `yaml` syntax highlighting is supported

### Shortcuts

- [Vim Shortcuts](/garden/notes/005-computer-shortcuts-vim) - [Vim
  Shortcuts](id:bdb62bfe-56b7-4c13-a1e4-9f91cf4e0bb5)

## Linux Accounts & Groups - Users and Permissions - Part 1

- Accounts, users, groups, file ownership, permissions, managing users
  and their permissions

### Linux Accounts

Superuser aka root - unrestricted permission

- For administrative tasks
- Always exists

User account - regular user

- Each user has their own space `/home/user_name`

Service account

- Relevant for Linux servers
- Each service has its own account like mysql for MYSQL, apache for
  Apache web server
  - Best practices for security
  - Do *not* run services as root user. Risks system in service
    vulnerabilities

### Multiple Accounts

Both user and service accounts can be multiple accounts.

- Allows sharing of computers, like users at companies and universities
  can use any hardware with their own user account
- Windows: user accounts are centrally managed, OS will check when user
  logs in, when logging in, only access your home folder.
- Linux: Multiple users can be on each computer, they are managed
  locally. A centralized system is possible such as using Kerberos and
  LDAP.

### Multiple Users on a Server

- Multiple people/teams usually need access to a server
- Why not share an account?
  - They need non-root access
  - Permissions per person
  - Traceability - audit of who did what on what system

### Groups and Permissions

Options:

- Give permissions directly to users
- Group users into Linux groups, give permission to the group, like
  devops, admin, developer

Using groups and giving permissions in groups is the best practice.

### User Management in Practice

Access Control Files

`/etc/passwd` - list of users

- User account information
- Everyone can read, only root can edit
- Format: `username:password:UID:GID:GECOS:home directory:shell`
- Example: `nana:x:1000:1000:Nana,,,:/home/name:/bin/bash`
  - `nana` - username
  - `x` - password
  - `1000` - Unique ID (UID) of user
  - `1000` - Primary Group ID (GID) of user
    - By default, a group is created with same name as user's name
  - `Nana,,,:` - General Electric Comprehensive Operating System (GECOS)
    (historical name) - user full name, room number, telephony numbers,
    other contact info
  - `/home/nana` - home directory
  - `/bin/bash` - user's default shell

### Manage Users

- Add - `sudo adduser nana` - add user nana, fill in password, user
  details
- Change password - `sudo passwd nana` - change password of user nana
- Assume another user - `su nana` - switch to user nana
- Login as root - `su -`

### Manage Groups

- Add - `sudo groupadd devops`
- Check groups - `cat /etc/group`

### Different User & Group Commands

- `adduser` and `addgroup`
  - Easier to use, interactive, user friendly
  - Asks for your input
  - Reasonable defaults for UID, GUID, home directory
  - Use manual;ly
- `useradd` and `groupadd`
  - You must provide information yourself
  - Lower level
  - Should be used in scripts
- `sudo useradd -G devops nicole` - add user nicole to group devops,
  default user's group is still created

Same for `deluser` and `delgroup` and `userdel` and `groupdel`

### Change Users, Groups

- `sudo usermod -g devops nana` - add user nana to group devops
- `sudo usermod -G devops admin nana` - add user nana to multiple groups
  and override the user's secondary groups
- `sudo usermod -aG devops nana` - add user nana to group devops (-a =
  append to existing groups)
- `groups nana` - list groups of user nana
- `groups` - list groups of current user
- `sudo gpasswd -d tom devops` - remove user tom from group devops

## File Ownership & Permissions - Users and Permissions - Part 2

Since everything in Linux is a file, owners and permissions can be set
on them.

- Show files, permissions, ownership include hidden files: `ls -al`

### Ownership

Who owns the file/directory?

Example ls -al output:
`-rw-rw-r-- 1 nana devops 0 Jun  1 15:00 test.txt`

- Owner (User): nana
- Group: devops

Change ownership: `chown` examples:

``` shell

# Change ownership to user tom, group admin of text.txt file
sudo chown tom:admin test.txt

# Chage just owner
sudo chown admin test.txt

# Change just group
sudo chgrp devops test.txt

```

### File Permissions

``` shell

ls -al

# -rw-rw-r-- lists permission
-drwxrwxr-x 1 nana devops 0 Jun  1 15:00 test-dir
-rw-rw-r-- 1 nana devops 0 Jun  1 15:00 test.txt

```

Meaning of characters in ls output

- First Character:
  - d - directory
  - `-` - regular file
- Next block of 3 characters are permissions for user:
  - r - read
  - w - write
  - x - execute / open directory
  - `-` - no permission on specific r/w/x
- Next block of 3 characters are permission for group:
  - Same as other permission blocks
- Next block of 3 characters are permission for others
  - Same as other permission blocks
- Example `-rw-rw-r-- 1 nana devops 0 Jun  1 15:00 test.txt`
  - nana can read and write
  - devops group can read write
  - others can only read

### Modifying Permissions

- Change mode / permissions using `chmod`
  - User: `u`
  - Group: `g`
  - Others: `o`
  - Read: `r`
  - Write: `w`
  - Execute: `x`
- Numeric values (commonly used)

| Number | Permission              | Symbol |
|--------|-------------------------|--------|
| 0      | No permission           | `---`  |
| 1      | Execute                 | `--x`  |
| 2      | Write                   | `-w-`  |
| 3      | Write and Execute       | `-wx`  |
| 4      | Read                    | `r-`   |
| 5      | Read and Execute        | `r-x`  |
| 6      | Read and Write          | `rw-`  |
| 7      | Read, Write and Execute | `rwx`  |

- 3 ways to set permissions
  - add + and remove - with rwx-
  - set permission with =
  - numeric

``` shell

# Remove all execute permissions for user, group and others for file 'api'
sudo chmod -x api

# Remove write from grou
sudo chmod g-w config.yaml

# Add execute permission to group for a script file
sudo chmod g+x script.sh

# Add execute to user
sudo chmod u+x script.sh

# Remove execute for others
sudo chmod o-x script.sh

# Add read, write, execute to group
sudo chmod g=rwx script.sh

# Add read to others
sudo chmod o=r-- document.txt

# Give everyone rwx
sudo chmod 777 script.sh

# Give user all permissions, group read, and others no permission
sudo chmod 740 script.sh

```

## Basic Linux Commands - Pipes and Redirects (CLI - Part 3)

### Input, Output and Pipes in Linux

- In Linux, every command can be inputs and outputs
- Outputs of one command can be inputs of another command
  - Commands can be chained, outputs of one command can be inputs of
    another whose output can be input of further commands and so on
- Pipe character `|` is used to chain commands

### Pipe and Less

Less commands:

- Quit: `q`
- Scroll down: `space`
- Scroll up: `b` or `u`
- Search: `/`
- Go to end: `G`

Example

``` shell

# Print contents of system log to terminal, pipe to less
# less is a page by page viewer
# Type 'q' to quit less
cat /var/log/syslog | less

# List binaries, pipe to less
ls /usr/bin | less

# View command history
history | less

```

### Pipe and Grep

- Search for a pattern using `grep`
  - Helpful for filtering words, files, folders, commands

``` shell

# Check command history for 'sudo' command, case insensitive
# Pattern will be highlighted in output
history | grep -i sudo

# Search for 'sudo chmod' in command history
# for all permissions changes and page with less
history | grep -i "sudo chmod" | less

# Find a specific program
ls /usr/bin/ | grep -i java

# Find a variable name like ports
cat config.yaml | grep -i port

```

### Redirects in Linux

- Redirects are used to send output of a command to a file
  - Redirect to file using `>` overwrites existing file
  - Append to file using `>>`

``` shell

# Send history sudo output to a file
history | grep sudo > sudo-commands.txt

# Add sudo commands to another file
cat sudo-commands.txt > sudo-rm-commands.txt
# Append rm commands to file
history | grep rm >> sudo-rm-commands.txt

```

### Wrap Up and Standard Input and Ouput

- Pipes amd redirects allows chain commands
- Every program has 3 built-in streams
  - Standard Input (STDIN), Standard Output (STDOUT), Stanard Error
    (STDERR)
  - Command -\> STOUT -\> STDIN -\> Command -\> STDOUT
  - STDERR is displayed for example for unknown commands or command use
- Execute commands in one line, separate commands using semicolon `;`

``` shell

# Clear screen, pause 2 seconds, echo "Hope you are enjoying the lecture"
clear; sleep 2; echo "Hope you are enjoying the lecture"

```

## Introduction to Shell Scripting

- Learn what is a shell, bash and scripts

### Use case is Automation

- We want to execute a series of commands
- Keep history of configuration
- Share instructions
- Logic and bulk operations
  - For example: backups, configurations
- Solution: Write commands in a file for use later
  - Called a shell script, .sh file extension

### Shell vs. sh. Bash

- Shell - a program that interprets and executes commands we type in
  terminal, translates command so OS kernel can understand it
- sh (Bourne Shell) - /bin/sh
  - Used to be default shell
- Bash (Bourne again shell) - /bin/bash
  - improved sh
  - Current default for most UNIX like systems

### Shebang

- `#!` is called shebang from sharp in music \# + bang !
- `#!/bin/sh` - use sh shell
- `#!/bin/bash` - use bash shell, requires bash to be installed

``` shell

touch setup.sh

# Add shebang to file so OS knows which
# shell to use to execute the script

# Start script with Shebang line
#!/bin/bash

# Write out message
echo "Setup and configure server"

```

Execute script

``` shell

# Give script execute permission
chmod u+x setup.sh

# Execute script
./setup.sh

```

## Shell Scripting Part 2: Concepts and Syntax

- Learn: Variables, if else, elif statements, conditionals, operators,
  parameters, user input, loops

``` shell

#!/bin/bash

# Write out message
echo "Setup and configure server"

# Variable
file_name=config.yaml
fileName2=camelCaseName.yaml

## Get first argument to script and set to variable
config_dir=$1

# Check if config directory exists
# Using File Test Operators
if [ -d "$config_dir" ]; then
    echo "reading config directory contents"
    # Store contents of command to variable
    config_files=$(ls "$config_dir")
else
    echo "Config directory not found. Creating one with some files"
    mkdir "$config_dir"
    touch "$config_dir/config.sh"
fi

# Check if file exists
if [ -f "config.yaml" ]; then
   echo "found config.yaml"
fi

# String Operations and Comparisons

## Get second argument to script and set to variable
user_group=$2

if [ $user_group == "devops" ]
then
    echo "configure the server"
elif [ $user_group == "admin" ]
then
    echo "administer server"
else
    echo "no permission to configure the server. wrong user group"
fi

# call variable
echo "using file $file_name to configure something"
echo "all configuration files: $config_files"

```

``` shell

# Call script with
./setup.sh setup_config admin

```

### File Test, Comparison, String Operators

- Can test file, directories, if files are empty and other options
- String comparions like `==`
- Can test less than -lt, greater than -gt, not equal -ne and others

``` shell

num_files=xx

if [ $num_files -ne 10 ]

```

### Arguments

- Use to give a script parameters the user can pass values
- Retrieved by `$1` and `$2`, …

### Input, Parameters, Loops

- Loops execute set of commands repeatedly
- Types of loops:
  - for loop
    - Operate on list of items
  - while loop
    - Run until condition is met
      - Example, run to monitor a service or validate service is
        available and do something
  - until loop
  - select loop

``` shell

#!/bin/bash

echo "Reading user input"
# Read user input and store in a variable user_pwd
read -p "Please enter your location: " user_location
echo "Your location is $user_location"

# Print all parameters passed to script
echo "All paramters $*"
echo "number of parameters provided: $#"

# Tell user the parameters passed to script (if they were passed)
echo "user $1"
echo "group $2"

# for loop to iterate over list of parameters to script
for param in $*
do
    if [ -d "$param" ]
    then
        echo "paramater is a directory, executing scripts in the config folder"
        ls -l $param
    else
        echo "not a directory"
    fi
    echo "parameter: $param"
done


sum=0

# Infinite loop, can be exited with break or change condition
while true
do
    read -p "Enter a score, enter q to quit" score
    if [ $score == "q" ]
    then
        break
    fi

    # $(()) makes the expression as arithmetic
    # to prevent adding of strings
    sum=$(($sum+$score))
    echo "total score: $sum"
done

```

- Conditions:
  - \[ - POSIX, \[\[ - Bash
    - Bash has more features but can lose compatibility

## Shell Scripting Part 3: Concepts and Syntax

- Learn: Functions
  - Separate out code into parts to get a better overview of work, reuse
    code
  - Group set of logic, commands into a reusable component

``` shell

function_name () {
    # commands
}

```

Define and call a function:

- Best practices:
  - Use up to 5 parameters or less for a function
  - A function should only do one thing, if doing too much, split into
    smaller functions
  - Use meaningful names for variables
- Boolean: is a data type that can only have two values of true or false
- Functions can return values

``` shell

function score_sum {
    sum=0
    # Infinite loop, can be exited with break or change condition
    while true
    do
        read -p "Enter a score, enter q to quit" score
        if [ $score == "q" ]
        then
            break
        fi

        # $(()) makes the expression as arithmetic
        # to prevent adding of strings
        sum=$(($sum+$score))
        echo "total score: $sum"
    done
}

# Call function
score_sum

# Function with parameters
function create_file () {
    # Similar to bash scripts, get first parameter
    file_name=$1
    # boolean
    is_shell_script=$2

    touch $file_name
    echo "file $file_name created"

    if [ $is_shell_script = true ]
    then
        chmod u+x $file_name
        echo "Added $file_name as executable"
    fi
}

# Call function
create_file config.yaml
create_file myfile.yaml
## indicate it is a shell script with true
create_file myscript.sh true

# Function with a return value
function sum() {
    total=$(($1+$2))
    return $total
}

# Assign value to a variable
result=$(sum 2 10)

# Access previous command execution value with $?
sum 2 10
result=$?

```

## Environment variables

- Environment variables allow users to configure their own environments
  and isolated from other user environments. They can be changed by
  users.
- Operating Systems store these variables as key = value pairs, they are
  available in the whole environment. By standard, the names are defined
  in UPPER CASE, for example
  - SHELL=/bin/bash
  - HOME=/home/nana
  - USER=nana
- They exist in all operating systems

### List Environment Variables

``` shell

# List all environment variables
printenv

# See specific variable
printenv USER

# See variable with certain values in name
printenv | grep USER

```

### Personal, Application Variables

How can users set their own variables for use in applications?

Use case: Secret

- Users can create their own variables, for example to store secrets
  - Secrets can be hidden in an environment and accessible from an
    application, like
    - DB<sub>PWD</sub>, DB<sub>USER</sub>
  - Programs can access environment variables
    - For example, a program can access the DB<sub>PWD</sub> variable to
      connect to a database

User case: Application flexibility

- Application reads variables to determine its behavior, for example in
  different environments

### Set Environment Variables

These environments set this way will only exist for the session, they
will not be available after the session is closed or in a separate
session.

``` shell

# Set an environment variable with export command
export DB_USERNAME=dbuser
# Password itself should be stored in a secure place
export DB_PASSWORD=dbpwd
export DB_HOST=localhost

# Check variables
printenv | grep DB

# Delete / Remove environment variable
unset DB_NAME

```

1.  Setting Environment Variables Permanently in Shell

    - Use shell program configuration, like in bash, use `.bashrc` file
      - Inside `.bashrc` file, write the export variable commands and
        restart the shell for the variables to be available or
        `source .bashrc` to get the variables immediately

2.  Setting Environment Variables Permanently System Wide

    - Use `/etc/environment` file
      - Write the export variable commands in the file
      - Restart the system for the variables to be available
      - For example, a global PATH variable is set for all users, so
        users can run binaries from system programs

### Adding Programs to Path

- Create a script, make it executable
- Add the script's location to your PATH environment variable
  - `export PATH=$PATH:/path/to/script` - add to existing PATH with the
    script's location
- You can run the script from anywhere in your shell

## Networking

- Learn how computers connect, their networks work, and addresses
  - IP address, DNS, subnet, firewalls, ports, networking commands

### What is a Network?

- Think about a home network like your computer, phone, and other
  devices. A network is collection of devices connected together in one
  physical location

### Internet Protocol (IP)

- Each device has a Internet Protocol (IP) address which allows devices
  to communicate to each other
- For example:
  - `172.16.0.0` - a 32 bit value (32 of 1's or 0's), 1 bit is 1 or 0
  - Which is 10101100.00010000.00000000.00000000
    - Each section separated by the decimal places is called an octet
    - All zeros 00000000 = 0, All 1's 11111111 = 255
      - So IP addresses can range from 0.0.0.0 and 255.255.255.255
- Switches sit on the local area network (LAN) and allow devices to
  communicate with each other
- Routers sit between the LAN and outside network or Wide Area Network
  (WAN). So, routers connect LAN with WANs like the internet
  - The router's IP address is also called Gateway

### Subnet

- A subnet is a range of an IP network to identify devices in the same
  network
  - Example range: 192.168.0.0 - 255.255.255.0 (subnet mask)
    - Start point of IP range - first IP in the range
    - Set the IP range with a subnet mask of 255.255.255.0
      - 24 bits are fixed, 8 bits are free, in other words the first
        three octets cannot change
      - 192.168.0.x - shows possible IP values
    - Set the IP range with a subnet mask of 255.255.0.0
      - 16 bits are fixed, 16 bits are free, in other words, the two
        last octets can change
      - 192.168.x.x - shows possible IP values
    - 255 fixates the Octet, value of 0 meas free range

1.  Classless Inter-Domain Routing CIDR ("cider")

    Shorthand for IP ranges

    - 192.168.0.0/16
      - 16 bits are fixed
    - 192.168.0.0/24
      - 24 bits are fixed

2.  Network Routing

    - Addresses in local subnet go to switch, outside addresses go to
      router
    - Any device needs:
      - IP Address
      - Subnet
      - Gateway

### Network Address Translation (NAT)

- IP address of LAN is chosen by an administrator
  - IP addresses within a LAN are not visible to the outside world, the
    device's IP addresses outside the LAN is replaced with another
    address - called NAT
- Benefits of NAT:
  - Security of LAN devices
  - Reuse IP addresses - LAN ranges can be used by multiple LANs
  - Works around limited number of IPv4 addresses

### Firewall

- By default, communications to the LAN from WAN are restricted by
  firewalls
- Firewall rules define which requests are allowed
  - Which IP address in network is accessible, which IP addresses can
    access, which devices, which ports are allowed
  - For applications to be accessible, firewalls have to allow them

### Ports

- Every devices has ports, like doors to a device
- You can allow specific ports (doors) and specific IP addresses
  (guests)
- Different applications listen on specific ports
  - For example, most web servers use port 80/443 which are standard
    ports
  - Every application needs a port
  - A single port usage must be unique, cannot be shared by multiple
    applications

### Domain Name System (DNS)

- Humans are better at remembering words instead of IP addresses. DNS
  maps names to IP addresses so the network can find the IP address.
  - DNS translate domain names to IP addresses - like an address book
    for the internet
- Domain names follow a hierarchical structure with top level domains
  (TLDs)
  - Original ones were .mil, .edu, .com, .org, .net, .gov
    - military, education, commercial, non-profit, network or other
      organizations, governments
    - Later geographical domains for each country like .de, .us, .fr
    - Later more top level domains

1.  Governance

    - Regulated by Internet Corporation of Assigned Names and Numbers
      (ICANN), manages TLD development, architecture, authorizes domain
      name registrars

2.  Subdomains

    - With a domain name, you can create subdomains
      - For example, `www.google.com` is a subdomain of `google.com`
      - Subdomains can be used to organize websites, like
        `mail.google.com`, `drive.google.com`
      - Subdomains can be used for different servers, applications
    - Fully Qualified Domain Name is a the full domain name

3.  DNS Resolution

    - DNS client on source, checks with resolver (usually ISP), resolver
      checks with root server, root server can direct to TLD Server
      (.com). TLD server refers to the authoritative name server for a
      certain domain name.
    - DNS entries are cached for a certain time, so the same request
      does not have to go through the whole process again. Caches are
      stored at the DNS client and resolvers.

### Networking Commands

- `ifconfig` - network information
- `netstat` - active network connections
- `ps aux` - check processes and network usage
- `nslookup` - check IP address of domains
- `ping` - check if a host is reachable

## SSH Secure Shell

- SSH keys
