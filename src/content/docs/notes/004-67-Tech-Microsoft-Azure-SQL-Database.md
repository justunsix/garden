---
filetags: ":microsoft:tech:azure:sql:database:epubnote:"
id: 4362bcb6-a6df-4d9d-989f-e43319da753e
title: Azure SQL Database
---

Source: My personal notes from Microsoft Learn articles

## Back Up and Restore Databases

- Plan and implement policy for recovering data if user of technology
  errors occur
- See options for how and where to back up and restore databases.

This course [Back up and restore databases - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/backup-restore-databases/?source=learn),
teaches:

- Database backup and restore options for IaaS
- Virtual machine backup and restore options for IaaS
- Backup and restore options for PaaS

### Back up and restore SQL Server running on Azure virtual machines

1.  Database Types and Practices

    - SQL Server has two types of databases: **system and user**.

      - System databases are the ones used by SQL Server such as master
        and msdb.
      - User databases are the ones created by users that store the data
        for applications.

    - Both types databases are important for backup and recovery plans.

    - General practices:

      - System databases are updated less and usually not restored from
        one SQL server to another with exceptions
      - User databases must be backed up

    - Common backup types:

      - Full
      - Differential
      - Transaction log

    - Types can be restricted by the deployment

2.  About Backup

    - A full database backup is a backup of a single database and all
      pages from the database are copied to the backup device.
    - The backup can restore the database to the point the backup was
      made which is the point when the back up finishes
    - To achieve a specific Recovery Point Objective (RPO), differential
      and/or transaction log backups are required
      - A **differential backup** contains all the database pages that
        have changed since the last time a full backup was made.
      - A **transaction log backup** allows restore to a point in time
        and clears the transaction logs to keep its size manageable.
        They can be as frequent as every 30 seconds, though that is
        impractical.
        - Understanding the transaction log is important to understand
          how it is backed up and how to use it for recovery
      - Other backup options include copy-only, file, filegroup,
        partial, and others

3.  Restore

    - A differential or a log backup can be restored after a full
      database is restored, as long as the database `RESTORE` command
      uses either the `WITH NORECOVERY` or the `WITH STANDBY` option. If
      neither option is used, the database `RESTORE` will do a recovery
      of the database, after which no extra backups can be applied.

    1.  Database Recovery Models

        There are 3 models:

        - FULL - allows all types of backups to be generated
        - BULK<sub>LOGGED</sub>
        - SIMPLE - does not allow transaction log backups, suitable if
          RPO has a wide range and not suitable if RPO is small

        The model is set as a database option and controls the type of
        backups and restores that can be done. Most database use FULL or
        SIMPLE.

### Back up a SQL Server virtual machine

1.  Virtual Machine Backups

    - Azure backup can backup VMs including the SQL server databases on
      the VM
      - The VM backups are SQL server-aware aka application aware and
        will ensure the VM-level backup does not break the SQL server
      - Combining SQL server backups with snapshots can cause issues see
        [Back up a SQL Server virtual machine - Training \| Microsoft
        Learn](https://learn.microsoft.com/en-us/training/modules/backup-restore-databases/3-backup-sql-server-virtual-machine)
        for possible troubleshoting.
    - It is an option suited for VM recovery and protection against
      ransomware

2.  Local Disk or Network Share Backups

    - Database can be backup up to disks attached to the VM or shares
      like Azure files that the SQL server can access
    - Ensure the disks are not ephemeral storage and will persist on VM
      restarts
    - Good practice is also copy the back to a second location to avoid
      single point of failures

3.  Backup Database To and Restore from URL

    - Backup and restore from URL is a local Azure option

    1.  Requirements

        - Azure storage account (SA) with blob storage. The SA will have
          a container with blobs inside.
        - Example URL:
          `https://ACCOUNTNAME.blob.core.windows.net/ContainerName/MyDatabase.bak`.
          Folder names can be used to identify backups like FULL, DIFF,
          LOG
        - Authentication is done between SQL server and Azure. The SQL
          server credential can be Azure SA account name and either of
          these options:
          - Access key authentication - backup will be stored as page
            blob
          - Shared Access Signature (SAS) - backup will be stored as
            block blob - this option is recommended due to block blobs
            being cheaper and SAS tokens offer security control

    2.  Restore

        - See [Back up a SQL Server virtual machine - Training \|
          Microsoft
          Learn](https://learn.microsoft.com/en-us/training/modules/backup-restore-databases/3-backup-sql-server-virtual-machine)
          for detailed steps on restoration using SQL Server Management
          Studio and Transact-SQL.

4.  Automated backups using the SQL Server resource provider

    - IaaS VMs that have an SQL server install can use the SQL server
      resource provider. The provider has an option to configure
      automated backups with a storage account.

    - Advantages is managing retention times for backups and ensuring
      RPO

    - Using this option, do not also configure backups into the VM
      otherwise there can be log chain problems with restores

    - Restores are done manually using the URL functionality within the
      SQL server

### Back up and restore a database using Azure SQL Database

The backup and restore on the SQL server PaaS works differently than
IaaS.

- Backups are generated automatically for Azure SQL database and Azure
  SQL managed instance.
  - Schedule is full backup is created once a week, a differential every
    12 hours, and transaction log backups every 5 – 10 minutes.
  - All backups are located in read-access, geo-redundant (RA-GRS) blobs
    replicated to a datacenter that is paired based on Azure rules. That
    means backups are safe from an outage in a single data center.

1.  Backup Retention

    Policies can be configured for

    - Point in Time Restoration (PITR) in days
    - Long term retention settings:
      - Weekly - in weeks
      - Monthly - in week
      - Yearly - in week
    - If the server containing the database is deleted, all backups are
      deleted preventing recovery. If only the database is database, the
      database can be restored.
    - SQL database managed instance backups cannot be restored to Azure
      SQL database

2.  Point in Time Restore

    Restore can be done using Azure portal, Azure PowerShell, Azure CLI,
    or REST API.

    - Restore in place is not supported and need to make sure the
      database does not exist before the restore.

3.  Database backup and restore for SQL Managed Instance

    - Automatic backups
    - Manual backups also possible and restore databases using the same
      backup to URL/restore from URL functions found in SQL Server
      mentioned earlier.

### Exercise: Backup to URL

Lab at [Exercise: Backup to URL - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/backup-restore-databases/5-exercise-backup-url)

As a DBA for AdventureWorks, back up a database to a URL in Azure and
restore it from Azure blob storage after a human error occurred

Tasks executed below:

Restore database using Transact-SQL and SSMS on VM

``` sql

RESTORE DATABASE AdventureWorks2017
FROM DISK = 'C:\LabFiles\HADR\AdventureWorks2017.bak'
WITH RECOVERY,
MOVE 'AdventureWorks2017' 
TO 'C:\LabFiles\HADR\AdventureWorks2017.mdf',
MOVE 'AdventureWorks2017_log'
TO 'C:\LabFiles\HADR\AdventureWorks2017_log.ldf';

```

Set up storage account to store backups

``` powershell

# Create Azure storage account to store backup
az storage account create -n "myname100" -g "contoso-rglod28623575" --kind StorageV2 -l eastus2
# Get keys, copy the returned value key1
az storage account keys list -g contoso-rglod28623575 -n myname100
# Create container for backup storage using the key1 value from above in the account-key file
az storage container create --name "backups" --account-name "myname100" --account-key "my-long-key" --fail-on-exist
# Verify container backups is created
az storage container list --account-name "myname100" --account-key "my-long-key"

# Shared Access Signature (SAS) at the container level is required for security
# Generate a SAS
# With expiry in the format 2021-12-31T00:00Z
# Copy the SAS generated from the output
az storage container generate-sas -n "backups" --account-name "myname100" --account-key "my-long-key" --permissions "rwdl" --expiry "2023-12-31T00:00Z" -o tsv

```

Create credential

- Create the credential that will be used to access storage in the cloud
  with the following Transact-SQL
  - The storage account name, SAS, and key values are required

``` sql

IF NOT EXISTS  
(SELECT * 
    FROM sys.credentials  
    WHERE name = 'https://<storage_account_name>.blob.core.windows.net/backups')  
BEGIN
    CREATE CREDENTIAL [https://<storage_account_name>.blob.core.windows.net/backups]
    WITH IDENTITY = 'SHARED ACCESS SIGNATURE',
    SECRET = '<key_value>'
END;
GO      
```

Check credential is generated in the SSMS tree under credentials

Back up the database AdventureWorks2017 to Azure with the following
command in Transact-SQL

``` sql

BACKUP DATABASE AdventureWorks2017   
TO URL = 'https://<storage_account_name>.blob.core.windows.net/backups/AdventureWorks2017.bak';
GO 

```

Validate backup in Azure CLI

``` powershell

az storage blob list -c "backups" --account-name "dp300backupstorage1234" --account-key "storage_key" --output table

```

Validate the backup with Azure portal storage explorer

- Storage account \> storage browser \> blob containers \> backups \>
  backup file for database

Restore from URL

- Change a record in the database

- Restore the database to get it back to before the changes

  ``` sql

  USE [master]
  GO

  ALTER DATABASE AdventureWorks2017 SET SINGLE_USER WITH ROLLBACK IMMEDIATE
  GO

  RESTORE DATABASE AdventureWorks2017 
  FROM URL = 'https://<storage_account_name>.blob.core.windows.net/backups/AdventureWorks2017.bak'
  GO

  ALTER DATABASE AdventureWorks2017 SET MULTI_USER
  GO

  ```

- Check the record change were undone

## Azure SQL Server on Virtual Machines

### Benefits

- Full version of SQL server
- Different geographic deployment and machine sizes
- Light and full management mode
  - Portal management like disk utilization
  - Automated backup, patching
  - Key vault, Defender health intergration
  - License and version flexibility
  - Configurable tempdb

### Connect to SQL Server virtual machine on Azure

Connections options:

- Public - connect over internet

- Private - connect over same virtual netowrk

- Local - connect over the virtual machine host

- When change SQL server connection settings, Developer and Express
  Editions need to have TCP/IP protocol enabled manually for remote
  connections.

- A DNS label can be optionally created for the Azure VM to allow
  connections with SQL Server Management Studio (SSMS)

1.  Public over the Internet

    Enables:

    - TCP/IP for the server
    - Firewall rule is open (default 1433)
    - SQL authentication
    - Network security group on the VM allows all TCP traffic on the SQL
      server port

    Access:

    - Allows to server's public IP or DNS, example connection:
      `Server=sqlvmlabel.eastus.cloudapp.azure.com;Integrated Security=false;User ID=<login_name>;Password=<your_password>`
    - The port can be changes with corresponding firewall and NSG rules
      - Queries on the SQL VM over ther internet is subject to normal
        pricing on outbound data transfers

2.  Private over the Virtual Network

    Enables:

    - Similar to public configuration, except there is not NSG to allow
      outside traffic to the SQL server port

    Access:

    - Allow connections between resources in same virtual network, even
      if in different resource groups
    - With site-to-site VPN, connects VMs with on premise network
    - Azure VMs can be joined to a domain. This way allows Windows
      authentication to SQL server. Other scenarios require SQL
      authentication
    - With DNS configured, connection can be done using VM computer name

    Configuration:

    - In "SQL virtual machine" resource \> security configuration
      - Change SQL connectivity level like private and change port

## See Also

### Resources

- [Overview of SQL Server on Azure Windows Virtual Machines - SQL Server
  on Azure VMs \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/azure-sql/virtual-machines/windows/sql-server-on-azure-vm-iaas-what-is-overview?view=azuresql)
- [Back up and restore databases - Training \| Microsoft
  Learn](https://learn.microsoft.com/en-us/training/modules/backup-restore-databases/?source=learn)
