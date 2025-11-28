---
date: 2022-03-01
filetags: ":microsoft:tech:azure:epubnote:"
id: 9f5b36d6-5b23-4e92-ba28-0dda0da11b6d
title: Azure Data Fundamentals
---

Source: Course with Microsoft trainer [Michelle
Xie](https://www.linkedin.com/in/michelle-xie-220/)

## Agenda

- Module 1: Explore core data concepts
- Module 2: Explore relational data in Azure
- Module 3: Explore non-relational data in Azure
- Module 4: Explore modern data warehouse analytics

## Module 1: Data Concepts

Data = Collection of facts, numbers, descriptions, objects, stored in a
structured (e.g. tables), semi-structured (e.g. JavaScript Object
Notation JSON), unstructured way (e.g. media, visuals)

### Transactional vs analytical data stores

- Online Transactional Processing (OLTP) - discrete units of work
  - Normalization improves I/O, but not efficient for reporting
- Online Analytical Processing (OLAP) - users query data
  - Data source (e.g. on premise, cloud, SaaS) \> ingestion \> storage
    \> processing \> visualization
    - Ingestion - no aggregation or heavy calculations
    - Processing - Clean and transformation
      - Time/date/metric conversions, summarize/aggregation,
        standardized, missing values added, de-duplication
      - Possible Azure services:
        - Functions
        - Databricks
        - Cognitive services

1.  OLAP Stages

    - Ingestion can be batch or streaming
    - Extract, Transform, Load (ETL)
      - Can be continuous pipeline, good for low dependency of items
      - Sensitive data can be removed
    - Extract, Load, Transform (ELT)
      - Data is stored first
      - Good for complex model or processing that data depending on
        multiple items in database
      - Appropriate for cloud models
    - Pipelines
      - Azure Data Factory - pipelines to build data flows and handle
        ETL / ELT
    - Data Visualization
      - Should raise questions for business, support decision making,
        see history/trends
      - Implemented in PowerBI
    - Analytics, using statistics
      - Descriptive - what is happening
      - Diagnostic - root cause, anomalies
      - Predictive - what is likely to happen based on trends and
        patterns
      - Prescriptive - actions to take for a goal
      - Cognitive - self-learning, get conclusions based on existing
        analytics

### Roles of People

- Administrator
  - Database Management
  - Data Security
  - Backups
  - User Access
  - Monitors performance
  - Tools: Azure Data Studio, SQL Server Management Studio, Azure
    Portal/CLI
- Engineer
  - Pipelines, processing
  - Ingestion
  - Prepare data for analytics
  - Tools: Azure Synapse Studio (portal, Azure Data Factory, SQL/Spark
    pools), SQL Server Management Studio, Azure Portal/CLI
- Analyst
  - Provides insights into the data
  - Visual Reporting
  - Modeling Data for Analysis
  - Combines data for visualization and analysis
  - Tools: PowerBI server/desktop, report builder

### Relational data

- Tables, using a model
  - Data is stored in a table
  - Table consists of rows and columns
  - All rows have same \# of columns
  - Each column is defined by a datatype
- Primary and Foreign keys
  - Primary - unique key in table
  - Foreign key - reference a primary key from another table
- Index
  - Like index at end of book to quickly find pages for a topic
  - Optimizes search queries for faster data retrieval
  - Reduces the amount of data pages that need to be read to retrieve
    the data in a SQL Statement
  - Data is retrieved by joining tables together in a query
  - Consumes storage space and CRUD operations needs index maintenance
    and can impact DB operations.
    - Infrequently accessed but often queried data, indexes can speed up
      operations
    - Frequently CRUD tables, but infrequently queried data, indexes
      slow down operations
- View
  - Custom table consisting of data from other tables

### Non-relational data

- Entities
  - Non-relational data, no schema on data. Non-relational collections:
    - Can have multiple entities in same collection or container with
      different fields
    - Have different non-tabular schema
    - Are often defined by labeling each field with the name it
      represents (key-value pairs)
  - Queries can be made more complex as all entities must be parsed for
    non-standard fields, e.g. parse for unique key value
  - Example: Azure Cosmos DB
- Non-relational data, semi-structured data
  - Data structure is defined within the actual data by fields.
    Format/file types include:
    - JSON
    - AVRO - Apache, row based, header has structure, body is JSON, good
      for data compression
    - ORC - data in columns rather than rows, Apache Hive, strip of data
      with an index, footer has statistical information on strip of data
    - Parquet - Cloudera/Twitter, columnar data format, metadata
      describing rows, chunk of data, designed for nested data types and
      good for encoding and compression
- [NoSQL](https://azure.microsoft.com/en-ca/overview/nosql-database/)
  - Loosely means non-relational data
  - Categories:
    - Key-value stores
      - Tool must parse contents and return
      - Usually restricted to insert and delete, updates are made in
        memory of client
      - Good for streaming large data amounts
      - Can be implemented by Azure Cosmos DB
    - Document based
      - Each document has unique ID
        - Good for queries on ID and indexed fields of documents and for
          streaming
      - Document has all data for an entity that in a relational data
        would be spread across multiple tables
      - May be stored as JSON, YAML, XML, binary JSON, text, and others
      - Good for data flexibility and frequent requirements changes
      - Can be implemented by Azure Cosmos DB via core SQL API
    - Column family databases
      - e.g. ORC, Parquet files. Similar to row based tables
      - Tabular data but with column families
        - E.g. person database with address information and family
          information
      - Popular is Apache Cassandra, implemented by in Azure Cosmos DB
        Cassandra API
    - Graph databases
      - Stores entities centric around relationships
      - Good for:
        - OLTP apps with highly correlated data
        - Easy updates to single or many objects
        - Flexible data modelling
        - Data requirements that evolve
        - Hierarchical data structures
          - e.g. people organization charts
      - In SQL would be expensive to query with recursion and joins.
      - Implemented as Azure Cosmos DB Gremlin API

### Unstructured Data

- Can be stored in Binary Live Object (BLOB) storage
- Does not naturally contain fields:
  - Examples: video, audio, media streams, documents
  - Often used to extract data form and categorize or identify
    ”structures” to produce file's metadata
  - Frequently used in combination with Machine Learning or Cognitive
    Services capabilities to "extract data" by using:
    - Text Analytics
    - Sentiment Analysis with Cognitive APIs
    - Vision API

## Module 2: Relational data in Azure

### Azure Data Services

1.  Microsoft SQL

    - SQL Server on Azure VMs - IaaS
      - OS level access
      - Higher administration time and dedicated hosting costs
      - Features:
        - SQL, OS versions, Windows, Linux, SSRS and SQL server services
        - Lift and shift to Azure
        - Licensing and edition flexibility
        - Memory, storage optimization
        - VNET integration with on premise, Advanced data security
        - High availability and Disaster Recovery (HADR) services
    - Azure SQL Managed Instance (MI) - PaaS
      - Compatibility with SQL server and VNET support
      - Control of SQL instance, multiple databases
      - Automates monitoring, backup
    - Azure SQL Database - PaaS
      - Good for latest SQL versions, variable loads, scalable loads
      - Features:
        - Elastic compute, storage
        - Private link supported
        - High availability 99.995% and 5 second RPO and 30 second RTO
        - Point in time restore
        - Most cost efficient
        - Integrates with Azure security services
    - Azure database for MySQL, Maria DB - PaaS
    - PaaS is lower cost and administration, but less control and
      customization (scripts, modules). If customization needs, use IaaS

2.  PostgreSQL, MariaDB, MySQL

    - PostgreSQL is the popular database for modern apps
      - Good for geometric data
      - Query language: pgSQL
      - Community version
      - Deployment options: single server, hyperscale (HA and scalable)
      - Compatible with PostgreSQL admin tool
    - MySQL for LAMP stack
      - Free community edition
      - Standard and Enterprise editions give performance, security
        improvements
    - MariaDB is community fork of MySQL with focus on user community
      - Re-written MySQL
      - Compatible with Oracle DB
      - Supports temporal data (history)

3.  Benefits

    - Fully managed services, integration with Azure services
    - High availability and low total cost of ownership
    - Configurable and automated performance, scaling, security, and
      compliance

4.  Provisioning of relational resources

    In Azure Portal:

    - Basics \> network connectivity \> additional settings (data
      source, collation, time zone, advanced security and threat
      protection ) \> tags \> review and create
      - Basics = subscription, resource group, service config, name,
        admin credentials, region, pools, compute & storage, pricing
      - Network connectivity = publie/private, VNET, firewall,
        connection type
        - Azure SQL uses 1433
        - Need to add IP addresses of database clients
          - 0.0.0.0 allows all Azure services
          - Range 0.0.0.0 to 255.255.255.255 opens to all internet
          - Connection policy modes:
            - Redirect
              - Service tags can allow connectivity from certain Azure
                services
              - Recommended with policy restriction on connectors
            - Proxy
              - Connections proxies via Azure proxy gateway
              - All packets flows via gateway
            - Default:
              - Redirect all client connections in Azure (low latency)
              - Proxy all external connections

5.  Security

    - Network
      - Firewall rules
      - Virtual Network Rules
      - Private Link, private endpoint - Private IP from VNET
      - Can use Azure Gateway or ExpressRoute
      - VNET pairing to group VNETs and their resources
    - Authentication and Access Control
      - Integration with Azure AD
      - Server-level principle for logical server for DB
      - Support SSO, token based authentication, MFA
    - Role Based Access Control
      - Control Azure operations through Azure RBAC
      - Scoping in subscription, resource group, resource
      - Security principle - service user with role
    - Azure DB read replicas
      - Supports replication from master server to up to 5 replicas
      - Use cases: replica for analytics, DR in different region, good
        for read only workloads not CRUD, not optimized for write
      - Billed for storage

### Querying Relational Data

1.  About SQL

    - SQL is a standard language for use with relational databases

    - SQL standards are maintained by ANSI and ISO

    - Proprietary RDBMS systems have their own extensions/variants of
      SQL such as T—SQL (Microsoft), PL/SQL (Oracle), pgSQL (PostgreSQL)

    - [SQL Statement
      Types](https://www.w3schools.in/dbms/database-languages/)

      - Data Manipulation Language - Used to query and manipulate data
        - SELECT - It retrieves data from a database
        - INSERT - It inserts data into a table
        - UPDATE - It updates existing data within a table
        - DELETE - It deletes all records from a table, the space for
          the records remain
        - MERGE - UPSERT operation (insert or update)
        - CALL - It calls a PL/SQL or Java subprogram
        - EXPLAIN PLAN - It explains the access path to data
        - LOCK TABLE - It controls concurrency
      - Data Definition Language - Used to define database objects
        - CREATE - used to create objects in the database
        - ALTER - used to alters the structure of the database
        - DROP - used to delete objects from the database
        - TRUNCATE - used to remove all records from a table, including
          all spaces allocated for the records are removed
        - COMMENT - used to add comments to the data dictionary
        - RENAME - used to rename an object
      - Data Control Language - used to control privilege in databases.
        - SYSTEM - creating a session, table, etc. are all types of
          system privilege.
        - OBJECT - any command or query to work on tables comes under
          object privilege. DCL is used to define two commands. These
          are:
        - GRANT - It gives user access privileges to a database.
        - REVOKE - It takes back permissions from the user.

2.  Query Tools

    - Microsoft SQL
      - Azure Portal: On Azure SQL resource page, use query editor to
        execute queries in the web interface
      - SSMS
      - SQL Server Data Tools
      - Azure Data Studio
      - SQL CMD
      - Azure CLI/cloud shell
    - PostgreSQL
      - PG admin
    - MySQL
      - Azure cloud shell
      - MySQL workbench

## Module 3: Non-relational data in Azure

### Azure Table storage

- Key-value store in Azure Storage account
- Key = like row's main key
- Value = "columns", but flexible
- Example: key = customer ID, value = all data about that customer
- No relationships, primary keys, stored procedures. Data is
  de-normalized.
- Good for IoT systems for quick storage

### Azure Blob Storage

- Stored under Azure storage account
- Block blobs - data stored as blocks, good for infrequent large
  discrete binary objects
- Page blobs - collection fixed sized 512 byte pages, good for virtual
  disks for VMs
- Append blobs - block blob to optimize append operations
- Hot tier - frequent access, e.g. web access
- Cool tier - infrequent access
- Archive tier - slow retrieval in order of hours
- Geo-replication supported

### Azure File Storage

- File shares
- Can synchronize with local file shares
- Geo-replication and encrypted is supported

### Azure Cosmos DB

- Partitions of documents, document database, partition contains
  documents that share a partition key and are related to each other
- Documents can refer to Azure Blob storage
- Automatic indexes of document IDs, document fields. Allows queries of
  fields.
- Configured as storage containers
- Azure Portal: Data Explorer in resource allows CRUD on database like
  create databases, manage containers, queries
- APIs and NoSQL functionality:
  - SQL
  - MongoDB
  - Gremlin (graph)
  - Table
  - Cassandra (columnar)
  - Allows switching between Cosmos features and other DB
    functionalities

1.  Use cases

    - Web, retail, marketing. Less than 10ms response time
    - Gaming - cloud storage of in-game stats, social media, leader
      boards = millisecond response times
    - Internet of Things (IoT) - ingest sensor real time data

### Provisioning for Non-relational resources

1.  Cosmos DB

    - Azure Portal
      - Provisioned throughput = dedicated resources, serverless = on
        demand and good for development
      - Multi-region writes = multiple master database around world
      - Data encryption = Microsoft manager or bring you own key
    - Azure Command Line Interface (CLI)
    - PowerShell
    - ARM templates (JSON code)

2.  Storage account (SA)

    - Access tiers hot/cool can be selected
    - Data lake storage gen2 - allows SA to be a data lake

### Data Migration Tool

Import data to Azure Cosmos DB from sources like:

- JSON files
- MongoDB
- SQL Server
- CSV files
- Azure Table storage
- Amazon DynamoDB
- HBase
- Azure Cosmos containers

### Azure Authentication

- User: password + option multifactor authentication (MFA),
  authentication token given to be used with application

### Data in Cosmos DB

1.  Consistency

    - Updates are asynchronous

    Within a single region, Cosmos DB uses a cluster of servers. This
    approach helps to improve scalability and availability.

    1.  Eventual
    2.  Consistent Prefix - changes in order
    3.  Session - changes in order
    4.  Bounded Staleness - lag in read and write
    5.  Strong - high latency, best consistency

    - Choose consistency to match requirements of application

2.  Query

    - Core SQL API allows dialect of SQL, like SELECT statements

    ``` sql
    SELECT <select_list>
    [FROM <optional_from_specification)]
    [WHERE <optional_filter_condition>]
    [ORDER BY <optional_sort_specification>]
    [JOIN <optional_join_specification>]

    -- Example where c is a container
    SELECT * FROM c
    -- Display JSON data from container

    SELECT * FROM c
    WHERE c.Country == "Japan"
    -- Dislay JSON data from records where field has Japan

    -- Aggregation functions such as SUM, Average, Min, Max
    SELECT COUNT(*) FROM Products p

    SELECT SUM(p.quantity) FROM Products p
    WHERE p.expired = 9

    SELECT AVG(p.price) AS ‘Average Price’

    FROM Products p

    SELECT p1.ID, p.Name, p1.Description,
    p1.Price FROM Products p1

    WHERE p1.Price = (SELECT MIN(p2.Price) FROM
    Product p2)
    ```

3.  Containers

    - Manage BLOBs into containers, for example images container
    - Configure access: anonymous, public, authenticated, SAS token
      (with expiry dates)
    - SAS tokens can be configured for files

4.  File Share

    - Create with access tier, storage quota
    - Manage files:
      - Desktop
      - `az copy` CLI command - specific source file, destination
        container/file

## Module 4: Datawarehouse Analytics

### Data Storage and Processing in Azure

Ingest:

- Azure Data Factory (ADF)
  - Data integration service to automate data moving and transformation
- Databricks
  - Apache Spark based platform
    - Spark supports multiple languages (e.g. Python, Java, Scala, C#,
      R)
  - Uses Azure security
  - Integrates with Azure and PowerBI
  - Can process from different data sources

Model, & Serve:

- Azure Synapse Analytics
  - Analytics engine
  - Synapse SQL, pipelines, Link, Studio, Spark
  - Transform data for analytics processing, generate reports

Visualize:

- PowerBI can do visuals, ad hoc queries
- Azure Active Directory = authentication for PowerBI and Analysis
  Services

Store:

- Azure Data Lake Storage
  - Repository of data
  - Organizes data into directories
  - Support POSIX and RBAC permissions
  - Compatible with Hadoop distributed file system

1.  Azure HDInsight

    - Distributed processing compute Spark processing engine
    - Apache Kafka (messages), Hadoop (storage), Hive (query) supported

### Data Ingestion in Azure

- ADF - heterogenous ingestion
  - Linked server - data store, databricks
  - Trigger \> Pipeline \> Dataset
  - Uses parameters, integration runtime, control flow
- PolyBase - file based data sources made to look like tables
- SQL Server Integration Services (SSIS) - heterogenous - load, mine
  data, files

### Example: Ingest data in Synapse for analytics processing

- Create a storage account
  - Create a new file share, hot tier
  - Upload file
- Create a ADF
- Create an Azure Synapse Analytics workspace
  - Add SQL pool
  - At resource in Azure portal, open Synapse studio
    - Data \> Databases
      - New SQL script, create a table
- In ADF, set up new copy data
  - Select source as Azure File Storage and the file
  - Set destination as Synapse
  - Set up data to table mapping

## See Also

- [Microsoft Power BI](/garden/notes/005-tech-microsoft-powerbi) - [Microsoft Power
  BI](id:a624927c-e3c0-4019-9a29-55fa523ec621)
