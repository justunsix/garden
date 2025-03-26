---
filetags: ":amazon:aws:training:epubnote:"
id: 9c4c71e2-d6e8-45bd-a881-57cec5a31a3f
title: AWS Lab Serverless Real Time Data Processing
---

Source: My personal notes from AWS training courses and cloud training
at work

## About Lab - Alien Attack

Every Alien Attack Immersion Day starts with a friendly competition of
Alien Attack (<https://game.alienattack.ninja/>) (branched from an open
source version of Space Invaders
(<https://github.com/dwmkerr/spaceinvaders>)), before diving into deeper
'levels' of AWS serverless application development.

- Join space invaders like game based on
  <https://github.com/dwmkerr/spaceinvaders> to play a session
- Game is running as a serverless application in cloud

## Building a Serverless Near Real time Data Processing Solution

Concept:

Users (producers) –\> serverless app –\> Manager (consumer)

Elaboration of serverless app component

|                     |             |                  |
|---------------------|-------------|------------------|
| Ingestion           | Processing  | Consumption      |
|                     | Storage     |                  |
|                     | Hosting     |                  |
| Operations Security | Reliability | Performance Cost |

### Serverless common requirements

- Security, RBAC
- Real-time processing
- Storage
- Minimize infrastructure cost

1.  Serverless benefits

    - No manual infrastructure creation
    - Automatic scaling
      - Automatic geographical location for users
    - Pay only on use
    - High availability and security

### Message Processing vs Stream Processing

- Message
  - The individual message is the unit of work
  - Computation/ processing per message
  - Message occurrence can vary
  - Dead Letter Queue (DLQ) functionality built in
    - Failed messages are automatically sent to be reprocessed. Repeated
      failed messages are sent to DLQ for troubleshooting
  - Messages are deleted after consumption
  - No need to track the position
- Stream
  - The message stream is the unit of work
  - Complex computation on many messages
  - Constant stream of messages
  - No built-in DLQ functionality
  - Messages are available after consumption until expiration
  - Each client needs to track the current

position in the stream

### Business use cases for using data

- Time critical decisions: real/near real time
  - Data can lose value over time
- Traditional business intelligence: batch historical reports in order
  of days/months

Example use cases:

- Real-time business metric reporting
- Near real-time event reporting from beacons in intelligent retail
  stores
- Near real-time financial transactions reporting
- Near real-time event processing (mobile apps, IoT)
- Gamification scenarios (where a scoreboard can be handy?)
- Near real-time monitoring patient status in hospitals

### AWS Architecture

- Static Website
  - Amazon Route 53
  - Amazon CloudFront
  - S3
- Security
  - Amazon Cognito
    - Can federate with identity providers
    - Fully managed application identity
  - Amazon Identity and Access Management (IAM)
    - Example: Application Managers and End users
- Ingesting and consuming
  - Amazon API Gateway
    - Managed and secure APIs
      - API keys, manage limits
    - Support easy deployment, control, and consumption of API
  - Amazon Kinesis Data Streams
    - Streaming service
    - Data can stay 24 hours to 7 days, can act as a temporary storage,
      cache for short term data
  - Kinesis Data Firehose
    - ETL function, for example to S3, Redshift, Elasticsearch, splunk
- Storage
  - AWS Systems Manager
  - Amazon DynamoDB, managed NoSQL
    - Example: user specific information
    - Document or key-value
    - Fast, event driven works well with serverless
  - S3 - long term data store
- Processing
  - AWS Lambda
    - Example events as triggers:
      - API gatewamy
      - Asynchronous event, S3, SNS
      - Poll-based

Diagram of how architecture works to run
<https://github.com/dwmkerr/spaceinvaders> with user authentication,
scoreboard tracking, user sessions, user data in DynamoDB

![](../media/Tech-Amazon-AWS-Lab-Serverless-Real-time-data-Architecture-1.png)

### AWS Development

1.  About Cloud9

    - Cloud based IDE with web browser
    - Use case:
      - Build serverless applications
      - Real time collaboration

2.  Cloud Development Kit

    - CDK application
      - Construct stack(s) with constructs:
        - Service –\> Lambda
        - S3 –\> DynamoDB
      - Output CloudFormation template
      - Template used for resource creation

## Lab

- Use Cloud9 with git repo to fix broken parts of the application,
  service configuration:
  - Authentication/Authorization
  - API gateway
  - Streaming
- Create Websocket API so manager can sync game across users
- Use code repo to start:
  <https://github.com/aws-samples/aws-alien-attack>
- Follow more labs at: <https://alienattack.workshop.aws/>
