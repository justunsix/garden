---
filetags: ":azure:data:epubnote:"
id: 7200e72b-33f4-4ca3-ae75-91d939b75ecd
title: Azure Data Factory
---

## Azure Data Factory - Microsoft Learn - Usage, Components

From: [Introduction to Azure Data Factory - Azure Data Factory \|
Microsoft
Learn](https://learn.microsoft.com/en-us/azure/data-factory/introduction)

### Usage Concept

- Problem: How to organize and manage processes to turn data into
  business intelligence
- Solution: Service to extract-transform-load (ETL),
  extract-load-transform (ELT), and integrate data. Data is integrated
  regularly with data storage, analytics services for reporting and
  business intelligence.

Azure Data Factory provides a service for the solution for data
workflows (pipelines), movement, and transformation at scale.

See [ADF visual
guide](https://learn.microsoft.com/en-us/azure/data-factory/media/introduction/data-factory-visual-guide.png):

- Problem: raw, unorganized data in different formats and sizes –\> data
  transformation –\> analytics –\> actionable insights
- ADF: data integration service for data manage movement and
  transformation from different data source to analytical resources

### How ADF Works

- Connect and collect
  - Collect data from on premise, cloud, (un/semi)structured, different
    times
  - Centralize location and process it
- Transform and enrich
  - Process or transform data using data flows
  - Execute on
    - Apache Spark, without need to understand/program Spark
    - Compute like Hadoop, Spark, Data lake analytics, machine learning
- CI/CD and Publish
  - CICD of data pipelines supported by Azure DevOps and GitHub
  - Load data to data stores like databases/warehouses (Azure SQL, data
    warehouse, Cosmos DB)
- Monitor
  - Service/pipeline monitoring, alerting and managed service
  - Dashboard

### ADF Components

- Pipelines
  - Group of activities to do work on data
  - Arguments can be passed to it
  - Pipeline run: single pipeline execution
- Activities
  - Processing step in a pipeline
  - Example might be a Hive activity: Hive query on an Azure HDInsight
    cluster to transform and analyze data
  - Types: movement, transformation, control
- Datasets
  - Data structures in data stores
- Linked services
  - Connection information to external resource like Azure storage
    account, database
- Data Flows
  - Transformation logic on data
  - Can be built into library of data transformations
- Integration Runtimes
  - Compute for activity and linked service execution. Runtime is where
    activity runs or gets started from.
  - May be close to data store or target compute service to meet
    performance, security, and compliance needs
- Triggers
  - Unit of processing determining when a pipeline starts
- Parameters
  - Key-value pairs of a configuration
  - Used by activities
  - For example, a dataset and a linked service ares both typed
    parameters and can be reused and referenced
- Control flow
  - Management of pipeline activities that includes: chaining in
    sequence, branching, setting parameters in pipeline, and passing
    arguments to start pipelines (on demand or from trigger).
  - Includes state passing, loops, that is, for-each iterators
- Variables
  - Temporary values in pipelines
  - Can be used with parameters to pass values

## Integration Runtime

From: [Integration runtime - Azure Data Factory & Azure Synapse \|
Microsoft
Learn](https://learn.microsoft.com/en-us/azure/data-factory/concepts-integration-runtime)

### Overview

- Integration runtime (IR) is compute infrastructure used by ADF and
  Azure Synapse pipelines to do data integration across different
  networks for:
  - Data flows
  - Moving data like copy, conversions
  - Activity dispatch - call and monitor transformation activities with
    compute like Databricks, Azure SQL database
  - SQL Server Integration Services (SSIS) package execution
- The integration runtime provides a bridge between activities and
  linked services and are created in the ADF and Azure Synapse UI or
  activities, datasets and flows that reference them.

### Types

- Azure integration runtime, can:
  - Run data flows in Azure
  - Copy activities
  - Dispatch transform activities in a public network to other resources
- Self-hosted
  - Run copy between cloud data stores and data stores on private
    networks
  - Dispatch transform activities ina on-premises or Azure virtual
    network
    - Useful for bring your own drivers to custom data stores like MySQL
  - Requires Java Runtime Environment (JRE) on the IR
  - The self-hosted IR only makes [outbound HTTP based connections to
    the
    internet](https://learn.microsoft.com/en-us/azure/data-factory/concepts-integration-runtime#self-hosted-ir-network-environment)
- Azure-SSIS

For choosing a type for your use case and specific features of each type
see:

- [Integration runtime - Azure Data Factory & Azure Synapse \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/data-factory/concepts-integration-runtime)
- [Choose the right integration runtime configuration for your
  scenario - Azure Data Factory \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/data-factory/choose-the-right-integration-runtime-configuration)

### Create and Configure a Self-Hosted Integration Runtime (SHIR)

From: [Create a self-hosted integration runtime - Azure Data Factory &
Azure Synapse \| Microsoft
Learn](https://learn.microsoft.com/en-us/azure/data-factory/create-self-hosted-integration-runtime?tabs=data-factory)

- Single IR can access multiple data sources and can be shared with
  another ADF in the same Azure tenant

- Location of the IR can be anywhere, recommendation is close to the
  data source(s) and on a separate machine to prevent resource
  competition.

- Data sources can be used by multiple IRs

- IRs can enable usage of cloud and on premise resources as if they were
  on the same network.

- IR tasks may fail if FIPS-compliant encryption is enabled, if so,
  disable it.

  ``` plantuml
  @startuml

  title Data flow steps for copying with a self hosted integration runtime

  cloud Azure {
    [Azure Data Factory]
    [Azure PowerShell or Portal]
    [Cloud storage]
  }

  rectangle On-premise {
    [Integration Runtime (self-hosted),2 ]
    [On-premises storage]
  }

  [Integration Runtime (self-hosted),2 ] -->  [On-premises storage] : Read-write requests, 1
  [Integration Runtime (self-hosted),2 ] --> [Azure Data Factory] : Control Channel, 3
  [Integration Runtime (self-hosted),2 ] --> [Cloud storage] : Read-write requests, 4
  [Azure Data Factory] <--> [Azure PowerShell or Portal] : 1

  legend right
    1. Person create self hosted IR in ADF using Azure portal or PS and created linked service for on premise data store and specify the IR
    2. Self hosted IR has encrypted credentials and can be stored locally. Proxy is present is configured during IR registration.
    3. ADF pipelines communicate with IR to schedule and manage jobs. IR polls queue for work.
    4. IR copies data between data sources, copy direciton and source/destinations are set in pipelines
  endlegend

  @enduml
  ```

  <figure>
  <img
  src="../media/plantuml-Tech-Microsoft-Azure-Data-Factory-copy-pattern-epubnote.png" />
  <figcaption>Copying data from on premise to cloud storage</figcaption>
  </figure>

1.  Ports and Firewalls

    The IR uses port HTTP 443 for variables outbound connections
    described at:
    <https://learn.microsoft.com/en-us/azure/data-factory/create-self-hosted-integration-runtime?tabs=data-factory#ports-and-firewalls>

## See Also

### Resources

- [Introduction to Azure Data Factory - Azure Data Factory \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/data-factory/introduction)
- [My Microsoft Learn Azure Data Factory
  Collection](https://learn.microsoft.com/en-us/users/justintung/collections/mo3rt63z3wmjjx)
  - [Introduction to Azure Data
    Factory](https://learn.microsoft.com/en-us/training/modules/intro-to-azure-data-factory/?ns-enrollment-type=Collection&ns-enrollment-id=mo3rt63z3wmjjx)
  - [Integrate data with Azure Data Factory or Azure Synapse
    Pipeline](https://learn.microsoft.com/en-us/training/modules/data-integration-azure-data-factory/?ns-enrollment-type=Collection&ns-enrollment-id=mo3rt63z3wmjjx)
  - [Orchestrate data movement and transformation in Azure Data Factory
    or Azure Synapse
    Pipeline](https://learn.microsoft.com/en-us/training/modules/orchestrate-data-movement-transformation-azure-data-factory/?ns-enrollment-type=Collection&ns-enrollment-id=mo3rt63z3wmjjx)
  - [Operationalize your Azure Data Factory or Azure Synapse
    Pipeline](https://learn.microsoft.com/en-us/training/modules/operationalize-azure-data-factory-pipelines/?ns-enrollment-type=Collection&ns-enrollment-id=mo3rt63z3wmjjx)
  - [Data integration at scale with Azure Data Factory or Azure Synapse
    Pipeline](https://learn.microsoft.com/en-us/training/paths/data-integration-scale-azure-data-factory/?ns-enrollment-type=Collection&ns-enrollment-id=mo3rt63z3wmjjx)
