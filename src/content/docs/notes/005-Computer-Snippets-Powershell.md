---
filetags: ":powershell:shell:snippets:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: 803df536-bf76-4fef-8bc6-775cf2e7dec6
title: Powershell Snippets
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

``` powershell

# Help on powershell command
powershell -help
pwsh -help

# Run a Specific Command
powershell -Command "Get-Process"
# Run commands, do not load profile
powershell -NoProfile -c

# Check hosts file
notepad C:\Windows\System32\drivers\etc\hosts

# Test network connection to a specific host
## Test-Network-Connection (tnc)
tnc google.com -Port 443

# See Powershell script that is run on new sessions
$PROFILE
# Check Powershell version
$PSVersionTable
$PSVersionTable.PSVersion

# Get Host name
$env:computername

# Write text to console
Write-Host "Hello World"
# Write new line and text
Write-Host "`nHello`nWorld"

# cd to user's local app data
cd $env:LOCALAPPDATA

# Set a variable
$variableName = "Hello World"

# Set a boolean
$debugMode = $true

# Switch to a different Windows Active Directory domain which is on the same network
# https://dba.stackexchange.com/questions/166638/how-to-connect-remotely-to-mssql-database-from-local-using-windows-authenticati
runas /netonly /user:mydomain\myusername powershell.exe
# Then run programs and commands you need under the new domain login

# Shutdown Computer
Stop-Computer
# Shutdown local computer, can be used to name remote computers as well
Stop-Computer -ComputerName localhost

# Start-Job - start a process in background that persists after shell is closed
Start-Job -ScriptBlock { <commands> }
Start-Job -ScriptBlock { dolphin.exe --stylesheet C:\Users\me\Code\dolpwin-dark\blue.qss --platform windows:darkmode=2 }

# Update Modules
## Run from another shell so powershell is not in use
## SkipPublisherChecks
pwsh -NoProfile -Command 'Update-Module -Force'

# Open item with Operating System application
Invoke-Item .\file.txt
# Open item with default operating system application alias
ii .\file.txt

# Check command and its location
Get-Command <command>

# Check if a command exists and use it
if (Get-Command "zoxide.exe" -ErrorAction SilentlyContinue) {
    # Use command
}

# Convert an object to CSV
Get-Process -Name pwsh | ConvertTo-Csv -NoTypeInformation

# Get data information in long form
Get-Date

# Start a transcript file at a specific location to log session
Start-Transcript -Path "C:\transcripts\transcript0.txt" -NoClobber
# -Path location of file
# -NoClobber prevents existing files from being overwritten.

# Multiple line (multiline) command using backtick character
scoop install fzf `
neovim `

# Function with mandatory parameters
function Get-Square {
  param(
      [Parameter(Mandatory=$true)]
      [int]$number
  )
  $Number * $Number
}

# Remove file or directory and files under it
Remove-Item -Force -Recurse -Path .\file_or_directory

```

## Windows Specific

``` powershell

# Print name of system / host
hostname

# Redirect command line output to Windows clipboard, assume cat is installed
hostname | Clip
# Copy computer hostname to clipboard
hostname | Set-Clipboard

# Open Mouse and Touchpad Windows settings
start ms-settings:mousetouchpad

# Install Remote Server Administration Tools, a Windows feature
Get-WindowsCapability -Name RSAT* -Online | Add-WindowsCapability -Online
# Verify what programs in RSAT are Installed
Get-WindowsCapability -Name RSAT* -Online | Select-Object -Property DisplayName, State
# Contains Active Directory Users and Computers (ADUC) MMC snap-in tool
# and “Active Directory Users and Computers” app

```

## Start-Process (Administrative Rights)

[Powershell Module
Start-Process](https://learn.microsoft.com/en-us/powershell/module/Microsoft.PowerShell.Management/Start-Process?view=powershell-7.3)

``` powershell
# Open in new window the program to run as administrator
Start-Process -Verb RunAs powershell.ext

# Start notepad as administrator
Start-Process -FilePath "notepad" -Wait -WindowStyle Maximized

```

## Shell history

``` powershell

# Get commands from history
Get-History

# Clear shell history for last 10 commands
Clear History -Count 10 -Newest

# Clear shell history for commands containing string or pattern like Help, *Syntax
Clear-History -CommandLine *Help*, *Syntax

# Clear PSReadline history
## Check it
Get-PSReadlineOption | select -expand historysavepath | Remove-Item  -whatif
## Delete it
Get-PSReadlineOption | select -expand historysavepath | Remove-Item
# Close terminal

# Open PS Readline history to edit it
code (Get-PSReadLineOption).HistorySavePath

# Got to previous working directory
cd -

# Got forward in working directory history
cd +

```

## Get-Help (like man, get usage, switches)

``` powershell

# Get help for a specific command
Get-Help Get-Process

# Get help for a specific command with examples
Get-Help Get-Process -Examples

```

## Get-Process, Stop-Process (List running processes, Stop running processes)

``` powershell

# Get-Process, also known as ps
## Query for a process that contains xdr in the name
Get-Process | Where-Object {$_.ProcessName -like "*xdr*"}
Get-Process -Name firefox

# Stop-Process, also known as kill
## Stop a process with given process ID(s)
Stop-Process -Id <Process ID>
## Stop multiple processes
Stop-Process -Id 1234,5678,9101

Stop-Process -Name firefox

```

## Manage Modules

``` powershell

## Get-Module (List Powershell modules), Get-InstalledModule
# Get all installed modules
Get-Module -ListAvailable
# or
Get-InstalledModule

# Install a specific module
Install-Module AzureADPreview

# Force install and skip certificate checks
Install-Module AzureADPreview -Force -SkipPublisherCheck

```

## Get-ChildItem (List directory contents, alias ls)

``` powershell

# List contents of current directory
Get-ChildItem

# List contents of specific directory
Get-ChildItem ~

```

## Web Cmdlets

``` powershell


# Invoke-WebRequest (Make web requests, alias wget, also similar to curl)
Invoke-WebRequest -Uri https://github.com/MicrosoftLearning/dp-300-database-administrator/raw/master/Instructions/Templates/AdventureWorks2017.bak -UseBasicParsing -OutFile 'AdventureWorks.bak'
## Download a file at a specific URL
## -UseBasicParsing = for compatibility
## -OutFile = required output file location

# DNS Lookup
nslookup google.com

```

## Environment Variables

### Set Environment Variables, Add to Path, List them

``` powershell

# Permanently set environment variables
[Environment]::SetEnvironmentVariable("HOME", "C:\Users\user1", "User")
[Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Users\user1\usr\bin", "User")

# List environment variables
Get-ChildItem Env:

# Write a specific environment variable, example temporarily remove proxy
$env:https_proxy=""

# Temporarily set an environment variable
$env:https_proxy="myproxy.com:3841"

# User's home directory
$env:USERPROFILE


```

## Source Environment Variables

Using [dot
sourcing](https://stackoverflow.com/questions/13015953/import-variables-from-text-file-in-powershell).
Create a .ps1 file, declare your variables in it, then dot source the
file. This will bring any variables declared in the file into the global
scope.

Example:

Contents of Variables.ps1:

\$env is required for current process to see it per
<https://stackoverflow.com/questions/66459734/cannot-read-environment-variable-set-with-powershell-with-os-environ-get>

``` powershell

$env:foo = "blarg"
$env:bar = "other blarg"

```

Dot source it:

``` powershell

. ./Variables.ps1
Write-Host "$foo $bar"

# Check variable as above or using
Get-ChildItem Env:

```

## Microsoft Graph PowerShell SDK

``` powershell

# Install Microsoft Graph PowerShell SDK
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Install-Module Microsoft.Graph -Scope CurrentUser
# Verify
Get-InstalledModule Microsoft.Graph
# Update
Update-Module Microsoft.Graph

# Get user display name from principal name
$user = Get-MgUser -Filter "userPrincipalName eq 'first.last@email.ca'"
$user.displayName
$user.Id

```

## Remove thumbs.db files

Source: [PowerShell Command to Recursively Delete Thumbs.db - Networking
HowTos](https://www.networkinghowtos.com/howto/powershell-command-to-recursively-delete-thumbs-db/)

``` powershell

Get-ChildItem -Path . -Include thumbs.db -Recurse -Name -Force | Remove-Item -Force

```

## See Also

### Resources

- [PowerShell Documentation - PowerShell \| Microsoft
  Learn](https://learn.microsoft.com/en-us/powershell/)
- [azure-tests](https://github.com/justunsix/azure-tests/) - My GitHub
  repo testing Azure resources management using PowerShell
