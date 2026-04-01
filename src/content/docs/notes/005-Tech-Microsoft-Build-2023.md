---
filetags: ":microsoft:build:event:artificial-intelligence:training:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: 43e6a78d-fb35-4f7d-865b-9756d1954950
title: Microsoft Build 2023
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

# Inject the power of the cloud and AI into your development workflow 2023-05-23

Source: [Inject the power of the cloud and AI into your development
workflow](https://build.microsoft.com/en-US/sessions/01f6a7ae-d371-43d5-9e6c-9ed2cf853d94?source=/favorites)
Training Description: How you can use Dev Box and Deployment
Environments, along with Visual Studio, Visual Studio Code, and GitHub
Copilot to increase developer productivity.

Speakers: Amanda Silver, Shayne Boyer, Isidor Nikolic, Leslie Richardson

## Introduction

- Combine cloud and artificial intelligence for better developer
  experience
- Address disruptions: hybrid work, vulnerabilities, systems complexity,
  business interruptions

## Better Developer Experience

- Visual Studio products for multi language development
- Goals and results: faster setup, boilerplate generation, issues
  troubleshooting, happier developers

### GitHub Copilot

Conversional AI with context of code. Sample use cases:

Development:

- Explain what old code does, how to use old code
- Check possible errors and handle errors and insert handlers
- Generate new code during updates
- Create units test

Troubleshooting:

- Explain what the exception means and how to fix it
- Explain errors or incorrect values and how to test/fix them

### Dev Box

- Addresses issue of setting up a new development environment
  - Ready to code
  - Project based
  - Managed, secure
- Dev Box is a cloud hosted development environment that has all the
  tools and dependencies to develop and run your application
  - Single sign on

## Accelerating Teams

- Deploying Microsoft Dev Box
  - Shared definitions
  - Network, Azure Region, vNet, domain joined
  - Separate for projects
  - Pay for use
- Example: Visual Studio + dependencies

### GitOps and Azure Deployment Environments

- Deployed from git configuration
- Deployed environments manually or CICD
- Managed pools, network

### DevSecOps - Shift Security to Development (Left)

Demo:

- Check in changes, but secrets, like API key, were detected in the code
  and tool prevents the check in
- Tool also detects history has secrets
- Set up pull request, set up production like environment for test, load
  test fails
- Ask Copilot about the specific code line that is causing the
  performance issue
- Check load test in CICD is successful
- CICD infrastructure is discarded

Products:

- GitHub Advanced Security for Azure DevOps
  - Code scanning, secret scanning, dependency scanning
- Azure Load Testing
  - Can use Apache JMeter scripts

## Developing Intelligent Apps

Demo:

- Using OpenAPI - see API endpoint
  - Integrate ChatGPT plugin to your app which is just a web API you
    deploy that ChatGPT can use
- Using Codespace:
  - In Visual Studio Code, can highlight and ask Copilot about code,
    generate code
  - Install ChatGPT plugin in ChatGPT to allow us to ask questions using
    our API - copy manifest from your app and install in ChatGPT
  - Can debug in Visual Studio Code in Codespaces while querying in
    ChatGPT
- ChatGPT can combine multiple APIs to answer questions
- ChatGPT plugin sample application to allow connecting your APIs to
  ChatGPT to enable AI-based chat experiences:
  <https://aka.ms/chatgpt-plugin-sample> –
  <https://github.com/binderjoe/openai-plugin>

## See Also

- [Microsoft](/garden/notes/005-tech-microsoft)

### Resources

- [Microsoft After Ignite Training on Microsoft
  Learn](https://learn.microsoft.com/en-us/training/topics/ignite/)
- [Designing secure Azure SQL Database
  solutions](https://learn.microsoft.com/en-us/azure/azure-sql/database/secure-database-tutorial?view=azuresql)
