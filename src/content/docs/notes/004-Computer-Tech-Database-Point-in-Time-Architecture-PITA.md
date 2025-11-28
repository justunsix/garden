---
filetags: ":database:epubnote:"
id: 566cfa72-235f-469c-bba9-02fbce33da02
title: Database Point in Time Architecture (PITA)
---

Point in Time Architecture (PITA) is also known as Replaced Timestamp or
Audit/History Architecture

## Use Case for Point in Time Architecture (PITA) and Concepts

Source: [A Point in Time Database Design: A Comprehensive
Guide](https://medium.com/@vipulkr1698/a-point-in-time-database-design-a-comprehensive-guide-18c2cb4160d1)

Need to keep:

1.  **History** of information, current and historical. Need to know
    state of database over time
2.  **Audit trail**: Understand information at a point in time and
    changes made to the database

Useful for compliance and audit, recovery and rollback, and queries at
specific times.

Concept:

- No information is deleted or directly updated in the database.
  Instead, one can see an image of the database as it existed in a
  previous time along with the current image.

### Implementation Concepts

PITA captures:

- Transaction validity - values in the database for a period
- Effective period - time when the values are valid based on business
  requirements, effective periods are inclusive, for example effective
  periods could be day 3 there is a value and on day 4 the value changes
- Any entity would only have one state for any point in time which is
  active and effective at the same time

1.  Design

    - A database's implementation may limit the granularity of the time
      increments in the period, for example at minimum 3 seconds for
      some SQL servers
    - Database tables design would check:
      - Time regions cannot start at the same time (primary key
        constraint)
      - Effective period start and end date matches permitted
        granularity (constraint)
      - Time regions cannot overlap (constraint with function)

2.  Table Type Options

    1.  Dictionary / Code Table

        - Used to find the current version of the value for an object
        - Table can include:
          - Data: Effective period, creation date, last update date,
            user who did the last change
            - Effective period is period start and end attributes
            - Effective period must be considered in business meaning of
              it, for example effective date of someone's birth country.
              For that person, the valid countries on those in existence
              when the person was born
        - Operations: Create, read, update,
          - No deletion of data

    2.  Header

        - Unchanging parts of objects
        - Data like:
          - Identifier
          - Other attributes that do not change
          - Creation data - system assigned for tracking
        - Operations: create, read
          - No delete, if updates needed, use details type tables

    3.  Details / Full Table

        - Change history of object related to a header table or primary
          key of table which has business meaning
        - Data like:
          - Business attributes
          - Effective period start and end
          - Creation and replacement timestamps
          - Identifier
        - Operations: create, read, update, delete (no physical
          deletion, though records can be logically replaced)
          - Update/delete operations should make sure changes are
            separated in time by at least the smallest precision the
            database implementation can do. For example, during a bulk
            upload in SQL server, ensure each change has at least a 3
            milisecond interval
        - Partitioning options:
          - Can be partitioned on active records using the effecitive
            period end point
          - Another partition with records with replaced timestamp in
            the past

    4.  Log

        - Log of events
        - Data and operations similar to header table but it is just
          event data
        - Operations: create, read

3.  Implementation

    - Identify requirements that require implementing a particular PITA
      type table
    - Choose the PITA type table for data
    - Do not mix types

## Database Design: A Point in Time Architecture

Source: [Database Design: A Point in Time
Architecture](https://www.red-gate.com/simple-talk/databases/sql-server/database-administration-sql-server/database-design-a-point-in-time-architecture/#:~:text=What%20is%20Point%20In%20Time,any%20previous%20point%20in%20time.) -
redgate - Article gives an example implementation of PITA and tips on
selecting data.

Allows users to ask the database to present an image of the database at
any previous point in time

PITA database design guarantees support for history and audit trail that
are usually not supported in OLTP databases

- No information is physically deleted or updated in a PITA database
- All changes are logged regardless for the business reasoning, for
  example a misspelled name being corrected appears like a name change

### Requirements of PITA Database Implementation

- Physical delete and update is not allowed
- Inserts need timestamps

Need to know

- Who inserted a row and when
- Who replaced a row and when
- What was the replaced row, before the replacement

Columns to support above could be:

- DateCreated - insert date
- DateEffective - date the row became effective
- DateEnd - date the row is not effective
- DateReplaced - date the row was replaced by another row
- OperatorCode - unique identifier of person/system that created the row

See [Database Point in Time Architecture (PITA) Enterprise
Implementation](/garden/notes/004-computer-tech-database-point-in-time-architecture-pita-enterprise-implementation) -
[Database Point in Time Architecture (PITA) Enterprise
Implementation](id:7728787c-4f8d-4fc8-b2f3-db8083b89bcc) for an
alternate naming by certain entities and explanation of columns.

Notes:

- DateCreated allows rows to be inserted before they might be effective
  through DateEffective

### Dealing with Inserts - Using DateCreated

View data at a given point of time

``` sql

SELECT * FROM AdventureWorks.Sales.SalesOrderHeader
WHERE DateCreated < [some PTA date of interest]

```

- If retrofitting a database to support PITA, you need to use a value to
  fill in existing rows with DateCreated, for example the date of the
  update command.
- When filling in DateCreated, can use a default value or insert trigger

### Dealing with Deletes - Using DateEnd

View data before a certain point of time

``` sql

SELECT * FROM AdventureWorks.Sales.SalesOrderHeader
WHERE DateEnd < [PTA_date]

```

Logically delete a row by updating its DateEnd

### Dealing with Updates

Go through steps:

- Flag existing row as not effective past a date
- Copy existing row and insert it as a new row and change columns that
  were changed and put a new value of DateEffective
- Can be implemented using an Instead-Of Update trigger - update
  existing rows with DateReplaced like with GetDate() or UTCDate().
  Update the DateEnd with business appropriate date.

``` sql

-- ####
-- Create tables

CREATE TABLE [dbo].[Test_PTA_Table](
   [TestTablePK] [int] IDENTITY(1,1) NOT NULL,
   [TestTableText] [varchar](50)
COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [DateCreated] [datetime]

NOT NULL CONSTRAINT [DF_Test_PTA_Table_DateCreated]

DEFAULT (getdate()),
   [DateEffective] [datetime] NOT NULL,
   [DateEnd] [datetime] NULL,
   [OperatorCode] [varchar](50)

COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
   [DateReplaced] [datetime] NULL

CONSTRAINT [DF_Test_PTA_Table_DateReplaced]
DEFAULT (getdate()),
 CONSTRAINT [PK_Test_PTA_Table] PRIMARY KEY CLUSTERED
(
   [TestTablePK] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]

-- #######
-- Trigger

CREATE TRIGGER [dbo].[Test_PTA_Table_Update_trg]
-- ALTER TRIGGER [dbo].[Test_PTA_Table_Update_trg]
   ON  [dbo].[Test_PTA_Table]
   INSTEAD OF UPDATE
AS
   SET NOCOUNT ON
   DECLARE @key int
   SET @key = (SELECT TestTablePK FROM Inserted)

   UPDATE Test_PTA_Table
      SET DateEnd = GetDate(), DateReplaced = GetDate()
      WHERE TestTablePK = @key

   INSERT INTO dbo.Test_PTA_Table
   (TestTableText, DateCreated, DateEffective, OperatorCode, DateReplaced)
   (SELECT TestTableText, GetDate(), GetDate(), OperatorCode, NULL
FROM Inserted)


```

### Dealing with Selects

Need to:

- Exclude data inserted/updated since the date
- Include data as it was on that date and exclude deletes prior to that
  date
- For updates, only include last update before the date

Select criteria:

- DateCreated is less than or equal to the PTA date of interest.
- DateEffective is greater than or equal to the PTA date.
- DateEnd is either null or greater than the PTA date.
- DateReplaced is either null or less than the PTA date.

Example with a row that was updated 3 times before that date:

- The first and second rows will have a DateEnd and a DateReplaced that
  are not null, and both will be less than the PTA date.
- The third row will have a DateEffective less than the PTA date, and a
  DateReplaced that is either null or greater than the PTA date.

### Implementing PITA

- Consider what columns that the business needs to track history for -
  should be columns with attributes that can change and changes impact
  business
- Columns where attributes changes are often called Slowly Changing
  Dimensions (SCD) which have types:
  - Type 1 – columns where changes are of little or no interest to the
    organization
  - Type 2 – columns where changes must be tracked and history recorded

### Using Domains

- In data modelling, a domain defines something like a column - default
  values, description, check constraints, nullability, but does not
  specific a table
  - Then when data modelling, just specific the domain and it inherits
    all things specified before instead of specifying a data type.
  - Benefit is ability to change the domain definition in one place,
    like changing the data type and have all changes in all tables
    updated
  - What if a domain like CustomerID as a PK is different as a FK?
    create a set of domains - one as PK and other as all instances of
    the domain as a FK

### Sample Transactions

See source for example tables

Things to consider:

- Add an original PK column if primary key column changes based on
  entity changes
- When a Type 2 update changes in a parent table, the update must occur
  (cascade) in related tables. Example person is a parent table of
  addresses
- Logical deletes with relationships have to handles carefully if
  related entities are still active in some way. Example are products in
  an inventory or being sold for a vendor that no longer exists

## See also

- [Database Point in Time Architecture (PITA) Enterprise
  Implementation](/garden/notes/004-computer-tech-database-point-in-time-architecture-pita-enterprise-implementation) -
  [Database Point in Time Architecture (PITA) Enterprise
  Implementation](id:7728787c-4f8d-4fc8-b2f3-db8083b89bcc)
