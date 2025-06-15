---
filetags: ":database:epubnote:"
id: 7728787c-4f8d-4fc8-b2f3-db8083b89bcc
title: Database Point in Time Architecture (PITA) Enterprise
  Implementation
---

Source: Guidance at work for standard implementation of PITA for
databases

For a summary of PITA and why would you use it, see [Database Point in
Time Architecture
(PITA)](../004-computer-tech-database-point-in-time-architecture-pita) -
[Database Point in Time Architecture
(PITA)](id:566cfa72-235f-469c-bba9-02fbce33da02)

## Attributes in all Data Entities

Data entities are data tables used for operations

| Name | Comment | Data Type | Mandatory |
|----|----|----|----|
| Effective Date | Date information takes effect | Date | Yes |
| End Date | Date info ceases to be in effect | Date |  |
| Create Timestamp | Date and time info was created | Timestamp | Yes |
| Create Operator ID | ID of user, application, other that created info | Varchar20 | Yes |
| Replaced Timestamp | Date and time that info is not valid and or replaced | Timestamp |  |

- Create Timestamp has an acronym CTS
- Replaced Timestamp has an acronym RTS. If it is Null, the row is
  considered active and true today
  - Operational systems will likely use rows where RTS is Null
  - To look at historical data, we look at all rows that have RTS as
    Null and a Date

## Attributes for history and audit trail in Code Entities

**Code Entities** contain lists of valid values.

| Name | Comment | Data Type | Mandatory |
|----|----|----|----|
| Effective Date | Date information takes effect | Date | Yes |
| End Date | Date info ceases to be in effect | Date |  |
| Last Update Timestamp | Date and time info was created or last updated | Timestamp | Yes |
| Last Update Operator ID | ID of user, application, other that created or updated info | Varchar20 | Yes |

- Last Update Operator ID and Timestamp are only used for code tables
- The End Date is a logical delete of a code table entry

## Using the Attributes

The attributes above allow recording two types of updates:

1.  Correction - information was the entered in error
    - Existing row will have Replaced Timestamp set to the day the
      correction transaction occurred, indicating the row is no longer
      current and has been replaced
    - Add a new row with the current (correct) information. The End Date
      and Replaced Timestamp are null.
2.  True change - information that was correct for a time and is now
    changed
    - Existing row will have Replaced Timestamp set to the day the
      change transaction occurred
    - Add a new row with identical information plus the End Date. Note
      this step is in addition to the correction update described above.
    - Add a new row with the current information. The End Date and
      Replaced Timestamp are null.

These methods allow:

- Track information changes
- See historical information on the date information was created or
  changed
- See records at a certain point of time
- Audit trail of who made changes to what records and why
- Users can investigate transactions

More attributes can be used for other business needs.

## Data Entities Example with Timestamps, Changes, No Gaps

| SN  | CTS        | Profession | Eff-date   | End-date   | RTS        |
|-----|------------|------------|------------|------------|------------|
| 123 | 1990-01-01 | Designer   | 1990-01-01 | null       | 1990-11-03 |
| 123 | 1990-11-03 | Designer   | 1990-01-01 | 1990-09-30 | null       |
| 123 | 1990-11-03 | Architect  | 1990-10-01 | null       | null       |

### Changes

A person was a Designer in early 1990, then got a new job as an
Architect in late 1990. The RTS and CTS tells us the change to the rows
occurred in 1990-11-03.

SN is a the primary key or business key used for identify a subject of
transactions. For the example, it is a person changing jobs.

The effective date can be back dated for future dated at time of
creation.

In the example, the person stopped being a designer in Sept, while the
change to the database was made later in November. The people managing
the database were informed of the change after the person had stopped
their previous job.

The reason the first row has an RTS is because the row had a End Date of
null, which needs to be corrected. The next row has the correct End date
of the person's job and is the correct information.

### Gaps or No Gaps

For the person, there could be gaps in their profession history. In the
example, there is no gap since the person stopped being a designer on
Sept 30 and on Oct 1 became an architect. There could have been a gap if
the person started their next profession later.

### Overlaps, Contiguous

Overlap - When two rows are both active for the same business key

Contiguous - When there are no overlaps or gap between two rows of data
for the same business key. In other words, there is always one active
row for the business key.

## Code Table Example

| Country-CD | Description  | Eff-Date   | End-Date   | LU-OpID | LU-TS      |
|------------|--------------|------------|------------|---------|------------|
| GE         | East Germany | 1900-01-01 | 1991-05-28 | Peter   | 1991-05-28 |
| GE         | West Germany | 1900-01-01 | 1991-05-28 | Peter   | 1991-05-28 |
| GM         | Germany      | 1991-05-29 | null       | Peter   | 1991-05-28 |

The example shows a country code table when East and West Germany merged
into Germany.

In Code Tables, because there is no RTS, we only know the last update
date and operator ID and not who originaly updated the row the first
time.

## Applying PITA Architecture to Databases

PITA attributes must be included in the logical data model (LDM) for all
entities during database design. The attributes will support audit and
history requirements.
