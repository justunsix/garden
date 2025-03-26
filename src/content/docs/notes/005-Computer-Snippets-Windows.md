---
filetags: ":windows:snippets:tech:epubnote:"
id: cba87902-6edd-4f82-8071-24d8902da403
title: Windows Snippets
---

## Windows Commands

| **Command**      | **Usage/Function**                                                                                                        |
|------------------|---------------------------------------------------------------------------------------------------------------------------|
| certmgr.msc      | Certificates                                                                                                              |
| ciadv.msc        | Indexing Service                                                                                                          |
| comexp.msc       | Component Services                                                                                                        |
| **compmgmt.msc** | **Computer Management, central administration panel for Windows. Can also be used to access IIS administration console.** |
| control mouse    | Open control panel for mouse                                                                                              |
| defrag, dfrg.msc | Disk Defragmenter                                                                                                         |
| devmgmt.msc      | Device Manager                                                                                                            |
| diskmgmt.msc     | Disk Management                                                                                                           |
| eventvwr.msc     | Event Viewer                                                                                                              |
| fsmgmt.msc       | Shared Folders                                                                                                            |
| gpedit.msc       | Group Policy                                                                                                              |
| lusrmgr.msc      | Local Users and Groups                                                                                                    |
| **msconfig**     | **Startup files and processes configuration**                                                                             |
| ntmsmgr.msc      | Removable Storage                                                                                                         |
| ntmsoprq.msc     | Removable Storage Operator Requests                                                                                       |
| **perfmon.msc**  | **Performance monitor**                                                                                                   |
| **regedit**      | **Registry editor**                                                                                                       |
| rsop.msc         | Resultant Set of Policy                                                                                                   |
| sc query         | Find function. E.g. Find a Windows services called "WSearch"sc query or FINDSTR /i /r WSearch                             |
| secpol.msc       | Local Security Settings                                                                                                   |
| **services.msc** | **Services and Process manager**                                                                                          |
| wab              | Windows address book                                                                                                      |
| wmimgmt.msc      | Windows Management Infrastructure (WMI)                                                                                   |

## Remote Desktop Management related commands

### ERROR The terminal server has exceeded the maximum number of allowed connections

If you encounter this error, you can either reboot the terminal server
you are trying to remote desktop to or log into the machine as an
administrator.

To log in as the administrator:

mstsc /v:\<ip address e.g.192.168.2.32) /console

By using /console at the end of the command you will be logging in as if
you were at the server. Alternatively, if you are using Windows Server
2003, run this comment instead (replace /console with /admin)

mstsc /v:\<ip address e.g.192.168.2.32) /admin

If you can telnet or ssh to the server you can use the following
command. This command will kill all active RDP sessions to free one so
you can connect.

tsdiscon /1

tsdiscon /2

tsdiscon /3

tsdiscon /4

### Session cleanup

When you execute the commands above, log in as an administrator on the
machine. That log in allow you to use the console on the server.

1.  Remove any disconnected users via the Terminal Services Manager

    Start \> All Programs \> Administrative Tools \> **Terminal Services
    Manager**

    Click on the name of your server and the right side should show a
    list of users. If the users are disconnected, reset the users to
    free up the two normal remote desktop connections. Right clicking
    the disconnected user and selecting "Reset."

    It is good practices to only use the console to disconnect inactive
    sessions and not for anything else. Make sure you disconnect
    inactive user sessions first with the instructions above, otherwise
    if you get disconnected again you will have to physically access the
    server.

    Remote Desktop sessions should always be closed using the Windows
    \<\<Log Off\>\> function rather than disconnecting by closing the
    window as using the X to close will disconnect from the session but
    leave it active.

## See Also

- [Powershell Snippets](../005-computer-snippets-powershell) -
  [Powershell Snippets](id:803df536-bf76-4fef-8bc6-775cf2e7dec6)
