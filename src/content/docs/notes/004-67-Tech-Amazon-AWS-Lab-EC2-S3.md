---
filetags: ":amazon:aws:training:epubnote:"
id: 94a59b6f-1481-461b-9640-333dba6091d1
title: AWS Lab EC2 S3
---

Source: My personal notes from AWS training courses and cloud training
at work

## About AWS

Benefits

- Security, scalability, updates
- Geographical distribution of availability zones/content delivery,
  dedicated network lines (no public sharing)
- Pricing: pricing reductions,
  - Plans for savings
    - Example for EC2:
      - On-demand
        - Variable workloads
      - Reserved instance with 1 or 3 year commitment
        - Steady usage
      - Savings plans with flexible access to compute
      - \- Commited access to flexible access
      - Spot instances: Spare EC2 capacity with savings off on-demand
        prices
        - Good for: Fault tolerant, flexible, stateless workload
          - Example: Short compilation of a program
        - Up to 90% discount from on demand
- Environment: Energy, water efficiency

## Introduction to Amazon EC2

- Choices for compute:
  - Elastic Compute Cloud (EC2)
    - Virtual servers in cloud
    - EC2 is used be the other choices
  - Amazon ECS, EKS, and Fargate
    - Container management service for running Docker on managed cluster
      on EC2
  - AWS Lambda
    - Serverless compute for stateless code execution in response to
      triggers
- EC2 options:
  - Linux, Windows, MacOS
    - Windows Server
    - Linux distros: Amazon Linux, Debian, SUSE, CentOS, RHEL, Ubuntu
      - Other images supported
    - Mac: including M1 instances
  - Arm, x86
  - General purposes or workload optimized
    - Example: Compute optimzed, memory optimization, Accelerated
      (AI/GPU) workload, Storage optimized
  - Bare metal disk, networking
  - Variety of images to choose - AMIs
  - Different purchase options

### EC2 Instance Naming and Sizing

``` txt

Instance generation
 |
 |     Instance size
 |      |
c7gn.xlarge
| ||
| Attributes
|
Instance family

```

Instance sizing could be like

c7gn.8xlarge

2 x …4xlarge

4 x … 2xlarge

8 x … xlarge

### AWS EC2 Hardware: Graviton Processor, Chips

- AWS Graviton Processor:
  - Best price/performance for cloud workload
  - Compute, memory efficiency
- GPUs:
  - AWS Inferentia: lower cost for deep learning models
  - AWS Trainium: high performance deep learning training
- AWS Nitro System: Networking, Storage, Security
  - Nitro Card: storage, networking, monitoring, security
  - Nitro security chip integrated into motherboard

### EC2 Attributes

- Amazon Machine Image (AMI)
  - Image can be started, can be reused to start multiple instance
- EC2 Security Groups
  - Virtual firewall required for instance networking
  - Security group rules configuration
- EC2 specific Credentials
  - Linux - SSH Key pair
  - Windows - Admin password
  - Key pairs
    - Private keys not stored by AWS

## Storage in AWS

### Use case for Cloud storage

- Pay as you go
- Ease of use
  - Managed infrastructure
  - Security, availability
  - Self service administration
- Speed and scaling

### About Storage

1.  Block vs File vs Object

    - Block Storage
      - Raw Storage
      - Data organized as an array of unrelated blocks
      - Host File System places data on disk
      - Ex: Hard Disks, Storage Area Network (SAN) Storage Arrays
    - File Storage
      - Unrelated data blocks managed by a file (serving) system
      - Native file system places data on disk
      - Ex: Network Attached Storage (NAS) Appliances, Windows File
        Servers, NetApp OnTap
    - Object Storage
      - Stores Virtual containers that encapsulate the data, data
        attributes, metadata and Object IDs
      - API Access to data
      - Metadata Driven, Policy-based, etc.
      - Ex: Ceph, OpenStack Swift

2.  Storage attributes

    - Durability: target data loss if any
      - Example: 2 copies on 1 site, multiple sites will increase
        durability
      - Metric: 1 in how many objects may have access issues
    - Availability: target downtime
      - Metrics: minutes and seconds of downtime
    - Security: encryption at rest, in transit
    - Cost: per storage unit like \$ / GB
    - Scalability: storage size, number of users, flexility to increase
      size
    - Performance: metrics like bandwidth
    - Integration: use with API or with other services

3.  Storage Options

    Choose appropriate storage for use case

    - Block Storage: disks
    - Backup: AWS backup
      - Cloud, on premise backup
    - File storage: different file systems available
    - Object storage: S3 options
    - Data transfer:
      - Storage gateway
        - Example: Shares for users
      - AWS DataSync
        - Move data in/out of cloud

### Block Storage

- Used for EC2 instance storage
  - Attached directly to server for high I/O
  - Use for variety of workloads requiring high performance
    - Applications
    - Databases
    - Analytics
    - Files
  - Secure, reliable
- Amazon Elastic Block storage - functions like traditional storage
  array
  - Common use is general purpose SSD (gp3), balance of volume size and
    performance
  - Example
    - iOps io2, block express with higher performance
    - sc1, cold storage
- Snapshots - backups in S3
  - Restore in same region or copy to other region
  - EBS snapshots, capture incremental changes
  - Archive tier for cost effective long term retention

### Shared File Systems

- Available for different use cases like applications, user storage,
  data science, temporary storage, file cache
  - Options depending on items like IOps, price/performance, latency
- Elastic File System (EFS): different tiers depending on usage:
  performance, throughput
- Amazon FSx for Windows File Server

### Object Store - Amazon Simple Storage Service (S3)

- Web accessibility, API/HTTPS
- Example: Can host a website
- Different options depending on:
  - Access frequency
  - Access/creation frequency
  - Archival
  - S3 Intelligent tiering can move data between tiers depending on
    actual use
- Management:
  - Organize with tag, version, metadata
  - Monitor
  - Replicate and tier
    - Replication in regions
  - Modify
    - Object Lock, notifications
  - Access and Security
    - Protect sensitive data using discovery and classification like
      Amazon Macie in S3

## EC2 Lab

- Log into Event Learning space
- Goal is create an EC2 instance and connect to it

### Create EC2 Instance

- Create new key pair
- Launch new EC2 instance using key pair with user specific launch
  script to start a web server with an index page
  - Set up IAM role to allow EC2 instance to use session manager to
    connect
  - Connect IAM role to EC2 instance. Setting up the session manager in
    the instance can take time like 30+ mins

## S3 Lab

- Deploy cloud formation template with EC2 instance to query S3 bucket
  to be created
- Create bucket in S3, add objects, set roles and security
- Enable bucket versioning, upload new version of files
- Set up lifecycle management, for example retention schedules
