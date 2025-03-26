---
date: 2024-11-20
filetags: ":amazon:aws:training:epubnote:"
id: d0606acc-53c1-429d-8d4a-5c522dff53c8
title: AWS Data Architecture
---

Source: My personal notes from AWS training courses and cloud training
at work

## End to End Data Architecture

Concepts in Data Architecture:

- Options for data services

- Integration

- Governance

- Goals for data: findable, accessible, interoperable, reusable from
  "Fair Data Principles"

### Data Pipelines

Data Source –\> Data Ingestion –\> Data Integration, governance –\> Data
Processing –\> Analytics \<– User

Analytics –\> Data Capture for human personalization –\> Data
Integration

Analytics applications can be BI, ML, AI

- Need to manage unstructured and structured data
- Structured data can use pipeline described above
- Unstructured data
  - Can put unstructured data in object store
    - Data Extraction, example using AI services
    - ETL
    - Metadata catalog - data path, source, owner, type of data, etc.
  - Connect catalog with query engine with governance for user
    - Can provide access to raw data

### Scaling Data

Data –\> Analytics applications –\> items below:

- Data ingestion
  - Batch
  - Data sharing
  - Querying
  - Example: Data in S3 –\> Amazon Redshift compute to Redshift managed
    storage –\> Analytics
    - S3 has security, compliance, and audit with high availability
      - Open table formats: Apache Iceberg, Hudi, Delta Lake
        - ACID transactions
        - Keep track of changes
      - Accessible from different locations
    - Partition data:
      - Choose attributes used in filters as partition columns
      - Choose attributes with low cardinality (low uniqueness) to avoid
        over-partitioning
      - Example: Apache Iceberg offers partitioning benefits
    - Can use columnar file formats (ex. Parquet)
    - Data compressions
      - Example: using gzip for files that can e split
    - Optimize file size, not too small to avoid opening many files
      during data operations
    - Update strategy like copy on write/merge on read, depends on
      frequency of certain operations
  - Streaming Ingestion
    - Example: Apache Kafka / Amazon Management Streaming for Apache
      Kafka / Amazon Kinesis Data Streams –\> Data on S3 and/or Amazon
      Redshift –\> Analytics
  - Replication, Change data capture
    - Put data using instant replication
    - Example: Amazon RDS/data services with CDC with "Zero-ETL" to
      allow data movement –\> Amazon Redshift \<–\> S3 with auto copy,
      materialized views
      - Amazon Redshift –\> Analytics
      - "Zero-ETL" allows easy configuration of choosing tables to
        replicate
- Data integration and processing
  - Example:
    - AWS Glue - Using Python, Spark and connectors to
      discover/prepare/integrate data
    - AWS Elastic Map Reduce (EMR)
      - Uses S3
      - Open source frameworks like Spark
- Application integration
  - Orchestrate different engines running on data
  - Example:
    - AWS Step Functions
      - Workflow in steps, can call APIs like AWS services or others
      - Integrates with AWS services, good for near real time
    - Amazon Management Workflows using Apache Airflow - open source
      workflow manager based on Python
      - Graphical workflows to manage multiple tasks
        - Tasks using Python, AWS Step Functions
      - Large number of connectors
      - Open source, Good for complexity
- Data stores
  - Vector data stores for AI use. Examples:
    - Amazon Aurora PostreSQL Compatible, RDS PostgreSQL
    - Amazon OpenSearch, Memory, Neptune Analytics, DocumentDB
  - Vector data considerations when choosing services:
    - Search performance
    - Warm up Index
    - Algorithms
    - Memory optimized EC2 instance families
    - Batch indexing performance
- Governance
  - Data quality: AWS Glue
  - Access controls: AWS Lake Formation
  - Discovery/share/manage: Amazon DataZone
  - ML models: Amazon SafeMaker governance for ML
- AI Generative Application Development
  - AI applications, RAG, integration with vector database
  - Example:
    - Amazon Bedrock
    - Amazon Quicksight - dashboards can be built using natural language
      with AI
