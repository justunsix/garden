---
filetags: ":sql:snippets:epubnote:"
id: 7aacccab-4571-4fbe-a61a-67236aaf2d60
title: SQL Snippets
---

## SQL Client in Terminal and Command Line

``` shell

######################
# Universal SQL usql #
######################

# connect to a sqlserver database using Windows domain authentication
runas /user:ACME\wiley /netonly "usql mssql://host/dbname/"
# Can follow up with check user name in MS SQL database
select whoami = SUSER_NAME();

# Connect using Microsoft Entra integrated authentication (formerly Azure Active Directory)
# Run az login with Azure CLI to establish a credential if there are issues
#
# database= database to connect to
# fedauth= type of authentication to use per go-sql driver instructions at:
# https://github.com/microsoft/go-mssqldb?tab=readme-ov-file#azure-active-directory-authentication
#  ActiveDirectoryDefault will use existing credentials, for example Azure CLI credential (az login)
usql 'azuresql://myserver.database.windows.net?database=mydatabase&fedauth=ActiveDirectoryDefault'

# Help information
help

# Run query
> select * from users
> \g

# Use Where to filter results
select * from users where name like '%joe%'

# Run statement and Execute
> select * from users;

# Exit
\q

```

## Microsoft SQL Server, Azure SQL, T-SQL

``` powershell

##########
# sqlcmd #
##########

# Connect to a database
# -S server name
# -G use Entra identity
# -d database name to use
sqlcmd -S mydatabaseserver.database.windows.net -G -d mydatabase

# Run query using go
1> select * from users
2> go

# Leave sqlcmd
1> exit

```

## T-SQL Administration

``` sql

-- Modify password of Login of logged in user
-- https://learn.microsoft.com/en-us/sql/t-sql/statements/alter-login-transact-sql?view=sql-server-ver16
ALTER LOGIN [Mary.Smith] WITH PASSWORD = '<enterStrongPasswordHere>' OLD_PASSWORD = '<oldWeakPasswordHere>';

-- Check logged in user
SELECT SYSTEM_USER AS [Current User]

```

## T-SQL Permissions

### View all Permissions on Azure SQL server

Execute on desired database (e.g. master, user/application's database)

``` sql
SELECT DISTINCT pr.principal_id, pr.name, pr.type_desc,
    pr.authentication_type_desc, pe.state_desc, pe.permission_name
FROM sys.database_principals AS pr
JOIN sys.database_permissions AS pe
    ON pe.grantee_principal_id = pr.principal_id;

/* View all users */

select name as username,
       create_date,
       modify_date,
       type_desc as type,
       authentication_type_desc as authentication_type
from sys.database_principals
order by username;

/* View roles by members */

SELECT DP1.name AS DatabaseRoleName,
   isnull (DP2.name, 'No members') AS DatabaseUserName
 FROM sys.database_role_members AS DRM
 RIGHT OUTER JOIN sys.database_principals AS DP1
   ON DRM.role_principal_id = DP1.principal_id
 LEFT OUTER JOIN sys.database_principals AS DP2
   ON DRM.member_principal_id = DP2.principal_id
WHERE DP1.type = 'R'
ORDER BY DP1.name;

/* Grant read access to an AAD security group */
-- Grant db_datareader fixed database role grants read access to every table in the database, which is more than is strictly necessary.

/* Execute on *user* database, not master */

/* Template */
CREATE USER "<AAD identity>" FROM EXTERNAL PROVIDER;
ALTER ROLE db_datareader ADD MEMBER "<AAD identity>";

/* Example */

CREATE USER [entra-group-name-readers] FROM EXTERNAL PROVIDER;

ALTER ROLE db_datareader ADD MEMBER [entra-group-name-readers];

-- List all users in database
SELECT name as username,
       create_date,
       modify_date,
       type_desc as type,
       authentication_type_desc as authentication_type
from sys.database_principals
order by username;
```

## Azure SQL Administration

``` sql

-- Check user activity
SELECT s.session_id, s.login_time, s.host_name, s.program_name,
s.login_name, s.nt_user_name, s.is_user_process,
s.database_id, DB_NAME(s.database_id) AS [database], -- return the database name
s.status,
s.reads, s.writes, s.logical_reads, s.row_count,
r.total_elapsed_time, r.cpu_time, r.wait_time
FROM sys.dm_exec_sessions s
left outer JOIN sys.dm_exec_requests r
ON s.session_id = r.session_id
WHERE s.is_user_process = 1
and DB_NAME(s.database_id)='myDatabaseName'

```
