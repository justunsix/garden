---
date: 2026-05-19
filetags: ":microsoft:tech:azure:sql:database:epubnote:"
id: 0b563051-64c7-4b88-9fad-d0b374f2db1a
title: Azure SQL Database PaaS Backup and Restore
---

The backup and restore on the SQL server PaaS works differently than
IaaS.

[Backups are generated automatically for Azure SQL
database](https://learn.microsoft.com/en-us/azure/azure-sql/database/automated-backups-overview?view=azuresql)
and Azure SQL managed instance. \[fn:1\]

- Schedule is full backup is created once a week, a differential every
  12 or 24 hours, and transaction log backups every 10 minutes.
- All backups are located in read-access, geo-redundant (RA-GRS) blobs
  replicated to a datacenter that is paired based on Azure rules. That
  means backups are safe from an outage in a single data center.

## Backup Frequency (Retention)

Policies can be configured for

- [Point in Time Restoration (PITR) in
  days](https://learn.microsoft.com/en-us/azure/azure-sql/database/automated-backups-change-settings?view=azuresql&tabs=azure-portal#change-short-term-retention-policy)
- Long term retention settings:
  - Weekly - in weeks
  - Monthly - in week
  - Yearly - in week
- If the server containing the database is deleted, all backups are
  deleted preventing recovery. If only the database is database, the
  database can be restored.
- SQL database managed instance backups cannot be restored to Azure SQL
  database

### Example: Change short-term retention policy on Azure SQL

[Change short-term retention policy using Azure
CLI](https://learn.microsoft.com/en-us/azure/azure-sql/database/automated-backups-change-settings?view=azuresql&tabs=azure-cli#change-short-term-retention-policy)

``` shell

az login
# Set new PITR differential backup frequency on an active individual database
# Valid backup retention must be 1 to 35 days
# Valid differential backup frequency must be 12 or 24 hours
az sql db str-policy set --resource-group myresourcegroup --server myserver --name mydb --retention-days 28 --diffbackup-hours 24

```

## Backup Redundancy (Geographical Locations)

Multiple options exist to have backup copies in a local or other region
to increase protection of data and for use in recovery. Recommendations:

- Non production data: locally redundant storage (LRS) - backups in
  single physical location
- Production data: Geo-redundant storage (GRS) - LRS backups and backups
  in a separate paired location

Azure offers variations of these options.

## Point in Time Restore

Restore can be done using Azure portal, Azure PowerShell, Azure CLI, or
REST API.

- Restore in place is not supported and need to make sure the database
  does not exist before the restore.

### Database backup and restore for SQL Managed Instance

- Automatic backups
- Manual backups also possible and restore databases using the same
  backup to URL/restore from URL functions found in SQL Server mentioned
  earlier.

## References

- \[fn:1\] WilliamDAssafMSFT. Automatic, Geo-Redundant Backups - Azure
  SQL Database.
  <https://learn.microsoft.com/en-us/azure/azure-sql/database/automated-backups-overview?view=azuresql>.
  Accessed 19 May 2026.
