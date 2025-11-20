---
date: 2025-09-09
filetags: ":microsoft:fabric:epubnote:"
id: 444c1c69-ea8b-4858-a008-2ce3a61ae4ee
title: Data Basics and Use Cases with Microsoft Fabric
---

Source: Training session from a 2025 Hackathon at work with data theme

## Data Basics

Use case: Using structured data (sheets, databases) and unstructured
data (emails, images, media) to get information and knowledge from the
data to make decisions.

Uses of data include: helping users, help people make decisions,
business processes, improving services, for example find inefficiencies
and do planning with performance metrics

### Using Data

A challenge with data is "garbage in, garbage out", referring to quality
of the data input will affect the output used for decisions.

1.  Explore data - check its strengths and weaknesses
2.  Clean the data - look for missing values, errors, outliers
3.  Determine how to use the data to present a story

## Example use case and Implementation

An organization has many departments that has different parts of data on
an individual. When the person uses services in the organization, the
different systems do not seem to integrate with each other.

### Team Roles

- Business expert - understands meaning of data and its contents, how
  data is used to help users
- Data scientist - how to predict services based on data, select
  scientific approach, statistics, models and algorithms
- Developer - builds solution

### Tools and Technologies

- Databricks: cloud data analytics and machine learning (ML) using tools
  like Apache Spark
- Power Platform and Apps: application low code platform
- Microsoft Fabric: all in one data analytics, storage and processing

### Approach

1.  Set standards for data like a person's name format
2.  Match: use algorithms to find records that are likely the same
    person
3.  Combine: put records of the same person together

Example design

Data sources (A) –\> Prepare and transform (B) –\> Analyze (C)

A. Structured and unstructured data as input B. Pipelines to transfer,
process, use inside a data lake. Integrates with notebooks, Spark jobs
C. Analyze using SQL analytics, Power BI
