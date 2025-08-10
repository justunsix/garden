---
filetags: ":database:epubnote:data-warehouse:data-lake:"
id: b3f202ea-9b8a-434b-b5ad-096a321e117e
title: Data Warehouse vs Data Lakehouse vs Data Lake
---

Source: [Data Lake vs. Data Warehouse vs. Data Lakehouse: Which One to
Choose? - IBM - YouTube](https://youtu.be/PQFWQmL3fLY)

## Data Warehouse

Source of data is structured data like CSV, CRM systems, and sales data.
Data is loaded into data warehouse using Extract Transform and Load
(ETL) and then data is processed into reports and analytics for users.

- Use Case: Optimized for SQL analytics, real time use
- Data type: Structured
- Storage cost: high due to organized data
- Performance: high due to organization
- Schema: fixed - structure of data is known before storage
- Scability: Expensive, difficult

## Data Lake

Sources of data can be anything like structured, semi-structured, and
unstructured data. Data is put directly into Data Lake. Data goes
through a Extract Load and Transform (ELT) and then used for artificial
intelligence (AI) and machine learning (ML) use cases.

- Use case: Store and access raw data
- Data type: Structured, unstructured, semi structured
- Storage cost: low, uses less expensive object storage
- Performance: low as data is not as organized
- Schema: flexible meaning schema can be provided during load or access
- Scability: Low cost, easy

## Data Lakehouse

Merges concepts of data warehouse (data management) and data lake
(scalability and storage).

Sources of data is varied and any type like a data lake. Metadata is
added to the data lakehouse to help with data structure and governance.
Data can go through ETl and/or ELT and users can use it for analytics
and ML.

- Use Case: Hybrid analytics
- Data type: all types like data lake
- Storage cost: low
- Performance: high, closer to data warehouse
- Schema: flexible
- Scability: Low cost, easy
