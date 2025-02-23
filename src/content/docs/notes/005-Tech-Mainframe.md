---
date: 2012-08-12
filetags: ":ibm:tech:mainframe:epubnote:"
id: 73b49967-bc41-4c4e-9207-ce3b2d61dba4
title: Mainframe technology
---

## Use Cases

Examples of mainframe computer usage: Bank ATMs, Payroll

## Acronyms and Terminology

- **100 / 101 way** numbers of processors (?)
- **CICS** Customer Information Control System is a transaction server
  that runs primarily on IBM mainframe systems under z/OS and z/VSE.
  CICS is middleware designed to support rapid, high-volume online
  transaction processing. A CICS transaction is a unit of processing
  initiated by a single request that may affect one or more objects.
  This processing is usually interactive (screen-oriented), but
  background transactions are possible.
- **DASD** direct access storage device: in [mainframe
  computers](http://en.wikipedia.md/wiki/Mainframe_computer) and some
  [minicomputers](http://en.wikipedia.md/wiki/Minicomputer), DASD is any
  [secondary storage](http://en.wikipedia.md/wiki/Secondary_storage)
  device which has relatively low access time relative to its capacity.
- **FICON** Fibre Connection is the IBM proprietary name for the ANSI
  FC-SB-3 Single-Byte Command Code Sets-3 Mapping Protocol for Fibre
  Channel (FC) protocol
- **HiperSockets** = an IBM technology for high-speed communications
  between partitions on a server with a hypervisor. The term is most
  commonly associated with zSeries, System z9 and System z10 mainframes
  which can provide in-memory TCP/IP connections between and among LPARs
  running several different operating systems, including z/OS, z/VM, and
  Linux on zSeries.
- **HASP** = Houston Automatic Spooling Priority Program is an extension
  of the IBM OS/360 operating system and its successors providing
  extended support for "job management, data management, task
  management, and remote job entry."
- **IPS** and **MIPS** = Instructions per second (IPS) is a measure of a
  computer's processor speed. Many reported IPS values have represented
  "peak" execution rates on artificial instruction sequences with few
  branches, whereas realistic workloads typically lead to significantly
  lower IPS values.
- **ISPF** = Interactive System Productivity Facility: aids TSO users to
  manage data sets and submit jobs
- **IBM mainframe utility programs** = carry out tasks related to
  datasets: contain common JCL utilities and like input/output and data
  management programs
- **IMS** = IBM Information Management System = joint hierarchical
  database and information management system with extensive transaction
  processing capabilities
- **IFL** = Integrated Facility for Linux (IFL) is an IBM mainframe
  processor dedicated to running the Linux operating system, with or
  without z/VM. IFLs are one of three types of IBM mainframe processors
  expressly designed to reduce software costs. (The other types are zAAP
  for Java code and zIIP for DB2
- **JCL** = job control language: control & execution of jobs
  (e.g. system commands to printing reports)
- **MES =** Acronym used by IBM which stands for Miscellaneous Equipment
  Specification. Any server hardware change, which can be an addition,
  improvement, removal, or any combination of these. The serial number
  of the server does not change. Specific types include the following:
  Customer-installable feature (CIF) miscellaneous equipment
  specification (MES); Install-by-IBM(R) (IBI) MES; Return-Parts MES
  (RPMES) is a special MES that is an IBI MES and requires the return of
  selected parts to IBM on completion of the MES.
- **MVT** = Multiprogramming with a Variable number of Tasks
- **OSMF =** IBM® z/OS Management Facility is a management product for
  z/OS that provides support for a modern, Web-browser based console for
  z/OS. With IBM z/OS Management Facility (z/OSMF), you manage solutions
  rather than specific IBM products, which helps you more easily manage
  the day-to-day operations and administration of your mainframe z/OS
  systems.
- **PTF =** IBM does not use the term "patch" in z/OS. Instead they use
  the term PTF which stands for "Product Temporary Fix" or "Program
  Temporary Fix", depending on the date. Note that a PTF may include
  replacements and updates for multiple elements.
- **QMF =** Query Management Facility tool used to issue SQL Queries
  against the IBM DB2 Database System. It is not merely a
  Data-extraction tool, the data-results can be formatted and presented
  as Reports, Charts etc. thus offering valuable insight. QMF also has
  Wizards that can help you to extract data, without even having to
  write SQL Statements.
- **SDSF** = System Display and Search Facility: Batch job output,
  status of running Unix processes, system information, workload
  scheduling, and log files can be accessed through SDSF
- **TSO =** time sharing option: like Unix login
- **TSO** Ready = User command prompt in TSO sessions
- **VTAM** = Virtual Telecommunications Access Method is the IBM
  subsystem that implements Systems Network Architecture (SNA) for
  mainframe environments. VTAM provides an API for communications
  applications, and controls communications equipment such as
  communications adapters and communications controllers. In modern
  terminology, *VTAM provides a communications stack and device
  drivers.*

## Info Library

- [IBM z/OS Documentation](https://www.ibm.com/docs/en/zos)
- [MVS 3.8j Tur(n)key 4- System](https://wotho.pebble-beach.ch/tk4-/) -
  source, manuals
- [Emulation basics](http://www.jaymoseley.com/hercules/) with Hercules
  from jaymoseley.com

## Cookbook formerly from Volker Bandke

- Find OS commands under Operation \> OS Commands cheat sheet
- Use [RPF: Rob's Programming
  Facility](https://www.prince-webdesign.nl/rpf) to substitute for ISPF
  functions
- ["Easy" installation and MVS
  general](http://www.bsp-gmbh.com/hercules/index.shtml) info

## Hercules Mainframe Installation Notes

### Option 1 Docker (Recommended)

Last reviewed on 2025-02-15

Option 1: Turn key Docker container
[RattyDAVE/docker-ubuntu-hercules-mvs
(github.com)](https://github.com/RattyDAVE/docker-ubuntu-hercules-mvs)
MVS 3.8j

See repository for instructions on running and logging in

### Option 2 Manual install

- Install Hercules:
  [http://www.hercules-../390.org/](http://www.hercules-390/) , [The
  Hercules System/370, ESA/390, and z/Architecture Emulator
  (hercules-390.github.io)](http://hercules-390.github.io/html/)

  1.  Can use prebuilt Windows (without Cygwin) version
  2.  Ignore update to hercules.cnf file for now

- Install HERC GUI (Fish GUI and related files) at
  <http://www.softdevlabs.com/Hercules/hercgui-index.html> including
  Fish LIB.

  1.  Use trial version install which installs everything

- Modification to your system settings.

  1.  add FishLib's 'bin' directory to your Windows search "PATH"
      environment variable (recommended).”

  2.  add Hercules directory containing the program binaries (i.e. exes)
      to your Windows "PATH" environment variable

  3.  Install Microsoft MFC and VC Runtime dlls if needed (now not
      required thanks to HERCGUI trail)

- [Get the MVS Turnkey
  System](http://www.bsp-gmbh.com/turnkey/tk3_faq.html) from Volker
  Bandke's site. You can download the CD image (ISO) of the system or
  order a CD.

- Follow instructions provided by Volker on how to setup and use the
  system in the [MVS Turnkey
  cookbook](http://www.bsp-gmbh.com/turnkey/cookbook/index.html).
  Install at cygdrive directory
  (e.g. /cygdrive/c/ccview/Programs/np/Mainframe/mvs38j)

``` shell

set up -ast C:\\ccview\\usr\\PortableApps.com\\PortableApps\\Mainframe\\Iter2\\mvs38j

```

- Get TN3270 emulator - [**x3270** is an IBM 3270 terminal
  emulator](http://x3270.bgp.nu/) for the X Window System and Windows is
  free.

- Follow further cookbook instructions for starting of the system,
  initial project load (IPL), etc.

- Read [Hercules tutorials and
  guides](http://www.jaymoseley.com/hercules/) (e.g. TSO tutorial) and
  [MVS FAQ](http://www.jaymoseley.com/hercules/installmvs/mvsfaq.htm)
  from Jay Moseley and [JCL
  basics](http://www.bsp-gmbh.com/hercules/herc_jcl.html) from Volker.

## Standard IPL Process on MVS Turnkey

Source: <http://www.bsp-gmbh.com/turnkey/cookbook/opmvs.html>

9.  Turn on system in Fish GUI (HercGUI) using MVS turnkey 3
    configuration file (i.e. turnkey3<sub>mvs</sub>.conf) in conf
    directory of MVS distribution. OR type startmvs is MVS Turnkey
    install directory

    1.  Make a change to the HTTPPORT line to read: HTTPPORT 8081 NOAUTH

10. Attach at least three 3270 sessions to the Hercules engine, and one
    standard telnet session on port 3270.

11. On HercGUI, execute: Command ==\> **ipl 148**

12. Switch for first TN3270 console (010) and execute other start up
    commands if this IPL is the first time. Execute on 010: **r
    00,clpa**

13. To read further messages as they scroll or delete them in
    roll-delete mode:

    1.  The same screen clear may be done by pressing **F1** for each
        line to deleted/moved  it up following [SYSLOG usage
        directions](http://www.mainframetips.com/zos-system-log-syslog/).

    2.  Press F11 on 010 and wait for mainframe to fully start. May take
        a 1-3 minutes.

14. When you press PF12 or execute these commands below, the following
    JES2 commands will be issued:

    1.  \$SPRINTER1

    2.  \$SPRINTER2

    3.  \$SPUNCH1

15. JES2, TSO, VTAM (NET) should be started. To check active jobs and
    users , on 010 with command **D A,L**

and see

``` shell

IEE102I 16.01.35 12.265 ACTIVITY FRAME LAST F E 1A
00006 JOBS 00006 INITIATORS
CMD1 CMD1 CMD1 V=V
JES2 JES2 IEFPROC V=V
BSPPILOT BSPPILOT IEFPROC V=V S
MF1 MF1 IEFPROC V=V S
NET NET IEFPROC V=V
TSO TSO STEP1 V=V S
00000 TIME SHARING USERS
00000 ACTIVE 00008 MAX VTAM TSO USERS
#+end_example

16. [@16] Log on to TSO if desired - e.g. HERC01 (no password, system programmer id)

17. Once up to shut MVS down in 010 console, *shutdown*

    1. MVS on 010: f bsppilot,shutnow

    2. JES2 on 010: $pjes2 and $du,all (if needed)

```

## Test Your New System by Adding a TSO User

1.  Follow cookbook instructions on HOW TO … Create a new TSO User.

2.  Use EDIT command on JCL location SYS2.JCLLIB(ADDUSER).

3.  Use Submit command to submit job for execution.

4.  ST command to monitor job status.

5.  OUTPUT on job to obtain any output.

6.  After ST displays the job is finished. LOGON \<new username\> with
    the new user

## Other Notes

``` shell

Step #4
+=============================================================================+
\| \|
\| Important Message \|
\| ================= \|
\| \|
\| The master catalog is password protected. The password is \|
\| \|
\| SECRET \|
\| \|
\| You can change the password any time by running the job MVS0390 \|
\| from either the JCL subdirectory or from dataset SYS1.SETUP.CNTL(MVS0390) \|
\| \|
+=============================================================================+

```

## Old Installation instructions from jaymoseley.com

Follow Guide <http://www.conmicro.com/hercos360/> with these exceptions
in structions. Or this guide:
<http://herculesmainframeemulator.weebly.com/index.html>

1.  Add Hercules to Windows PATH
2.  Open Cygwin and run commands

``` shell

/cygdrive/f/sfw/Mainframe/Hercules 3.07 (64 Bit)/os360mvt

$ ./makedasd

What is the path to your OS/360 distribution? /cygdrive/f/sfw/Mainframe/os360mvt-distribution-libraries/

```

1.  Delete *dasd/sysres.150* Pasted from
    \<<http://www.conmicro.com/hercos360/blddrv.html>\> from os360mvt
    directory and run dasdload -z …
2.  Add TN3270 console to default gen.cnf provided as device: **001F
    3270**
