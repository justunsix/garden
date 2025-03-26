---
date: 2024-11-20
filetags: ":amazon:aws:training:epubnote:"
id: 58cf4cd6-e560-486b-8204-8310ef612026
title: AWS Serverless Application Development
---

Source: My personal notes from AWS training courses and cloud training
at work

## Best Practices in Serverless

Overview:

- Serverless design
- Functions
- Infrastructure as Code
- Testing
- Development Security Operations (DevSecOps)

### What is Serverless?

- A culture with focus on business value using technology that is
  suitable for building and running applications

- Benefits:

  - Faster development to production to give business value
  - Continuous experimentation

- Example service:

  - Design: Event Source –\> Function –\> Call other services
    - Events like data state changes, requests
  - AWS Lambda service handles Function part
    - Functions can transform data

### About AWS Lambda

3 phases

- Init
  - Create new environment to run execution
  - Download code/image
    - Packaged as layer
  - Initialize runtime
  - Run function pre-handler initialization: can be optimized by user
    - Example: Get secrets, handle connections, peristent data
- Invoke
  - Run function handler code: can be optimized by user
    - Good practice to move business logic to a separate area inside
      code of function
  - Continue with more requests
- Shutdown
  - Runtime turns off

### Design

Considerations on using functions:

- How much logic to put into functions?
  - Avoid large functions
  - Can separate complex functions to sub functions, like routing logic
    - Individual actions can be split into its own function or
      functional groups
    - Balance number of functions with management, security
      considerations
    - Can group functions by:
      - Business context
      - Teams
      - Security permissions
      - Technology
- How much is the function doing?
  - Business logic
  - Complex logic
  - Is it too simple?

### Example architecture in AWS

S3 front end, API management, managed services for
queue/workflow/pubsub, AWS Lambda for functions, S3 storage

Client –\> API Gateway –\> Multiple functions –\> Database / Backend
services

- Remember API gateway can integrate directly with backend services if
  it makes sense instead of using functions as only as simple proxies
- Orchestration (central control): AWS Step Functions
  - Example: write steps which are functions, coordinate steps between
    functions using low code
    - Intrinsic functions in step functions: arrays, JSON,
      encoding/decoding, math and other
- Choreography: Amazon EventBridge
  - Sources –\> EventBridge (event is pushed to target) –\> Targets
- Example custom integration: Amazon DynamoDB with Change Data
  Capture (CDC) –\> Function \> Event handling like EventBridge

### Monitoring and Performance Examples

- Use AWS X-Ray to check AWS Lambda function performance and execution
  information and run times
- Optimize logging: structured logs stored with S3
- SnapStart for Java functions - takes a shot of most of init phases for
  resuming snapshot for repeated calls
- Adjust AWS Lambda capacity, optimize memory using AWS Power Tuning and
  Lambda recommended settings after runs have been tracked
  - Running on Graviton2

### Concurrency

- Concurrency is running multiple requests at the same time assuming AWS
  Lambda capacity is not reached
- Can reserve concurrency for given function

### Infrastructure as Code

Create AWS Cloud Formation templates using simplified:

- AWS Servless Application Model (SAM)
  - Reuse policy template for security practices
- AWS Cloud Development Kit (CDK)

### Testing

- Do testing to improve code speed and quality
- Help document code functionality
- Unit, integration, end to end tests
- Testing strategies for automated tested: Emulators, Mocking (mock
  cloud components locally), Testing in Cloud

### DevSecOps

- Implement controls like: pipelines, private endpoints and networks,
  logging enabled with retention periods, resource tags, only use
  supported runtimes, environment variables are encrypted at rest
- Code/IAC linter, Config, certificates
- Security analysis
