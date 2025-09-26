---
date: 2022-07-12
filetags: ":devops:github:microsoft:tech:epubnote:"
id: 3fd2590f-06c4-420a-8c54-ee75fc7466e2
title: Microsoft GitHub DevOps
---

## Microsoft Modern DevOps 2023-09-27

Session led by Eldrick Tongambou Wega

### KPIs and Metrics

- Good metrics = comparable, true/honest, simple, actionable
  - Common metrics may lack one of these values
- Kanban metrics
  - Recommended ones:
    - Work in progress
    - Lead time

### Shifting Security Left

- Security at:
  - Pull requests, merge, code/test, project configuration

### Collaboration with DevOps

- Innersourcing - mindset to use collective knowledge of organization
  - Managing source code in organization
  - Get started:
    - Start with a repo on sharing code
  - Visible repositories, documentations
  - Raise issues
  - Allow pull requests from anyone
  - Social liking for popularity
  - Insights to see code usage
  - Packages on centralized libraries
    - Private, public libraries

1.  Structuring Organizations

    - Public sector - starting to use more open source
    - Good practice - less organizations as possible
      - Central organization
      - Public organization
      - Private, sensitive organization

## Microsoft Technology - Microsoft Azure Virtual Training Day: DevOps with GitHub

2022-07-12, 13

Taught by Steven Murawski (Day 1), Jessica Deen (Day 2)

### Agenda Day 1

- Introduction
- Getting started with DevOps Building in security and quality
- Managing the flow of work Operating software in the cloud
- Delivering change to the cloud

### Introduction Day 1

- Use case: Tailwind Traders are trying to improve internal
  collaboration. They lack collaboration and shared tools.
- What is DevOps?
  - "DevOps is often defined as a culture of collaboration between
    operations and development engineers working together in the entire
    service lifecycle, from product design through the development
    process to production operations"
  - "DevOps is the union of People, Process, and Products to enable
    continuous **delivery of value** to our end users." - Donovan Brown
- Why DevOps?
  - Quicker value delivery though faster implementation
  - Less human errors and downtime
  - Increase innovation - better time to market, incident recovery,
    faster deployments
  - Free time of people to do other tasks and creative work
    - Use automation for consistency and repeatability
  - Develop \> Deliver \> Operate \> Plan

### Tools

1.  Source control

    - A form of version control
    - Uses concept of code repositories
    - Tracks changes made within repositories
    - Allows for cross-team collaboration
    - Example: GitHub
    - Components
      - Code
      - .gitignore - untracked files
      - Branches - isolate work
      - Commits - track changes
      - Tags - annotaions, can point to specific releases

    1.  Git Project components

        - `README.md` file - Document your project
        - `SECURITY.md` file - Define your security policy
        - `LICENSE` file — Define the license for your project
        - `CODEOWNERS` file — Define who is responsible for code
        - Pull Requests — Request to merge your changes
          - Can add changes, comments
          - Pull request can follow a workflow
        - Issues — Track issues/bugs/features
        - Releases — Bundle specific iterations of your project

2.  Microsoft Teams

    - Used for collaboration
    - Chat, meet, call, collaborate on app or web browser
      - Managing files
      - Can conmnect with AzureDevOps boards, GitHub integration
    - In a channel, using connector, can link GitHub webhooks to
      Microsoft Teams

3.  Visual Studio Code

    - Lightweight, open source, and cross-platform editor
    - Can create/manage branch in branch management in status bar
    - Sync branch with GitHub to origin and create get pull request (PR)
    - Pull request can trigger GitHub actions to verify PRs
    - Use [Microsoft Liveshare
      extension](https://code.visualstudio.com/learn/collaboration/live-share)
      to share VS Code sessions with others for troubleshooting

### Managing the flow of work Operating software in the cloud

- Tailwind Traders agreed on their tools.

1.  Go with Scrum

    - Prioritized product backlog, organized into sprints, reviewed by
      product owner
    - Principles:
      - Product is built incrementally
      - Frequent inspection and adaption (course correction)
      - Transparency (Product and Sprint backlogs are public)
      - 3 people roles: Product Owner. Development Team, Scrum Master
      - Scrum Teams are self-organizing and cross-functional
      - Executives agree with Scrum rules and workflow
    - Iron triangle:
      - Quality
      - Time/Date
        - Estimates, ideally focus on small tasks of 4 hours or less
        - "Tasks" should be at most 4 units of 4 hours
      - Scope/Features

2.  Azure DevOps

    - Backlog
      - Manage work items
        - Manage tasks
      - Manage sprint
    - Kanban board show progress and status of work
    - In GitHub commit, can link to commit using identified in commit
      (e.g. #ab234)

3.  Branching Strategy

    - Possibilities:
      - Long running branches: dev, test, release. See
        [GitFlow](https://www.atlassian.com/git/tutorials/comparing-workflows/gitflow-workflow)
    - Trunk based development
      - Master - main branch
      - Development branch - merged periodically
      - Feature A - merged immediately when done
      - Feature B - merged immediately when done
      - How to avoid frequent bugs with frequest commits to master? use
        feature flags

    1.  Feature Flags

        - Use feature flags to activate/deactivate features, turns code
          activation as a business or user decision
        - With code, it is an `if... else` statement
        - Use cases:
          - A/B testing
          - New feature testing
          - Soft launch
          - Incremental rollout
          - Rollback - turn off flag
        - Use Azure App Configuration to manage feature flags - "Feature
          Manager" function
          - Add flags
          - Can configure:
            - How many users will get feature? (e.g. 50%)
            - User groups
        - In code
          - Add ASPNETCore feature management pack
          - Connect to Azure app configuration
          - Get feature management
          - Manage feature flags in code:
            - View, layout: xml tags
            - Controller Code: Check feature manager

4.  Maintaining Quality with Pull Requests

    - Problems: PRs pile up waiting for review, want to see PRs in
      visual environment
    - Solution: Automation
      - Using GitHub Actions
        - Set up PRs to be displayed in kanban board
        - Dynamically deploy to staging slots that are linked to PRs.
          When PR is merged, remove staging instance.

### Delivering change to the cloud

Use case: Tailwind Traders is missing automation to deploy changes to
cloud and is afraid of production deployments.

- Continuous integration and continous delivery/deployment (CICD)
  - Continuous integration
    - Your changes work with everyone elses, your code and tests will
      build, run, validate code
  - Continuous delivery
    - You have deployable work
    - Including infrastructure and dependencies
    - Automates delivery, new build artifact is available and it is
      deployed
  - Continuous deployment
    - Deploy piece of work, can be to any environment
    - Repeatable
  - Good practice:
    - Continuous deployment to somewhere
    - Know deployments can have issues
- Trunk based development
- Protect production and secrets

GitHub Actions:

- Automate build, test, deploy to a specific environment like production
- Use GitHub secrets. keys to embed in CI pipeline
- Azure Key vault to securre keys, secrets, certificates
- Can use approvals before deployment

1.  Protecting Production

    - Use short lived topic branches. Short lived = less than a day
    - Use PRs for merging
    - GitHub has a PR trigger

    1.  Trunk-based Development

        - trunk/main
        - topic branches frequently merged into trunk/main
        - release branch - can be used for support reasons, should never
          be merged into main

        <figure>
        <img
        src="../media/Tech-Microsoft-DevOps-GitHub-2022-07-12-15-03-18.png" />
        <figcaption>Trunk-based Development</figcaption>
        </figure>

        - Have automation occur during PR completions

        - Not every merge to main has to go to production, you should
          test before promotion

        - You can create a release branch with a successful tested
          release and promote that release to production

        - Use Azure bicep to create/manage infrastructure as code

        - For each PR, create a RG with suffix PR \#, include all PR
          resources into the RG. Look at deployment.

    2.  Deployment Slots

        - Using deployment slots, you can deploy to staging or
          production slots. They are a deployment tool, not an
          environment tool.
        - Can modify actions to deploy to a UAT environment for example.

2.  Future Ideas

    - Rotate credentials in Key Vaults when an admin asks a Teams Bot
    - Automatically build a new development environment

### Day 1 Resources

- [Learn Azure](https://docs.microsoft.com/en-us/learn/azure)
- [DevOps Engineer
  Certifications](https://docs.microsoft.com/en-us/learn/certifications/devops-engineer/)
- [VS Code](https://code.visualstudio.com/)
- [Microsoft DevOps](https://docs.microsoft.com/en-us/devops/)

### Agenda Day 2

- Introduction
- Getting started with DevOps Building in security and quality
- Managing the flow of work Operating software in the cloud
- Delivering change to the cloud

### Getting started with DevOps Building in security and quality (Day 2)

- Security
- Apply security in containers
- Build quality and gain confidence

Use case: Tailwind traders's website runs on ASP.NET Core + React,
Docker container on Azure App Service.

- They want:
  - Quality - decoupled microservices for ease of maintenance
  - Confidence - know their processes
  - Security - need secure architecture, reviews

1.  Security and Vulnerability Management

    - Use of many dependencies, that means many people have access to
      code you use
    - Need to shift security for left to whole DevOps process and people
      = "DevSecOps"

    1.  Framework

        - Pre-commit
          - Threat modeling
          - IDE security plug-in
          - Pre-commit hooks
          - Secure coding standards
          - Peer review
        - Commit
          - Static code analysis
          - Security unit tests
          - Dependency management
          - Credential scanning
        - Deploy (CD)
          - Infra as code (IaC)
          - Security scanning
          - Cloud configuration
          - Security acceptance tests
        - Operate and monitor
          - Continuous monitoring
          - Threat intelligence
          - Blameless postmortems

    2.  Solutions

        Dependency Insights:

        - Real-time inventory
        - License compliance
        - Vulnerability alerting

        Vulnerability Management:

        - Code scanning
        - Secret scanning
        - Largest vulnerability database
        - Automated security updates

        CodeQL:

        - Code analysis
        - Vulnerability hunting tool
        - Community of security experts

    3.  GitHub - security functionality in repos

        - Can scan code for vulnerabilities

        - Scan for leaked secrets in public/private repos

        - Move website to Azure k8s, multiple containers

        - Repo

          - Deploy
            - Helm
              - Using helm to ease deployment of APIs and microservices
          - Source
            - Code corresponding on microservices

        1.  What to do

            Go to Security tab of GitHub

            - Set up security policy
            - Look at security advisories
              - e.g. Helm's advisories
            - Turn on dependency alerts and code scanning
              - Enable Dependabot:
                - Alert
                - Updates (automatic PRs for easy upgrades)
              - Enable code scanning

            Azure Security Centre

            - Go to Security Centre to check vulnerabilities
            - Scan containers
              - Can check vulnerabilities in Azure Container Registry
                images
            - Manage secrets
              - In Azure Key Vault
                - e.g. Postgres key, database connection string
                - certificates
                - Set active, expiration dates

2.  Container Security

    1.  Kubernetes (k8s) Architecture

        1.  Self managed

            App/workload definition \> K8s API endpoint \>
            self-management main node (API Server, etcd, scheduler,
            controller manager, …)

            OR

        2.  Managed

            App/workload definition \> K8s API endpoint \> Azure managed
            control plane

        3.  Container Layers

            - Every line in Docker is another layer
              - e.g. Alpine base, additional layers
              - Image layers are read only
            - Multi-stage docker files
              - Different base layers for stages of the container
            - It is like a multi-layer cake. What is baked into the
              cake.
            - If there are vulnerabilities in the layers, they are
              running in the container and may have root access

    2.  Container DevOps

        Using GitHub Actions

        - Using Azure Bicep to provision cloud resources
        - Build container images
        - Deploy the microservices
          - Use helm

        Use case: there are vulnerabilities in the containers

        - Add Scan image for vulnerabilities
          - Use Azure scan GitHub action
        - Add public scan results to Azure security centre

        GitHub actions report will show issues and Azure Security centre
        will also show the issue and CICD source of the error (e.g. link
        to GitHub PR CICD that activated the scan)

3.  Quality

    We want to gain confidence in our changes.

    - Using VS Code extension "Bridge to Kubernetes" to replace your
      private namespace deployment API with your own local code. Then
      you can test the remote, with debugging local functionality. It is
      like putting your own computer into the cloud instance you are
      testing.

    - Review of PR GitHub actions

      - Login to AKS
      - Create namespace
      - Helm install of PR

### Managing the flow of work Operating software in the cloud (Day 2)

Agenda:

- Understand application behaviour
- Prepare incident response
- Guide incident response with automation

1.  Understand application behaviour

    - Goals for monitoring:
      - Improve time to detect
      - Reduce remediation time
      - Enable learning operations data, telemetry
    - Sources of monitoring data:
      - Real user monitoring
        - Service Level Indicators (SLI) aimed to meet Service Level
          Objectives (SLO)
      - Synthetic transactions
      - Telemetry

    Use case: Tailwind Traders has data going into monitoring

    - Azure application insights's application map allows exploration of
      services their logs.
    - While exploring logs, find a Kusto log query that gives an error,
      turn it into an alert.
      - Convert Kusto query into alert. Only the error criteria, can
        remove time filters and summary since the alert will do it.
      - Set up an action group for notifications

2.  Responsible Incident response

    - Establish a designated responsible individual (DRI) rotation
      (e.g. on call schedule)

      - DRI does:
        - Respond to alerts, incidents in time target
        - Coordinating with partner service DRIs
        - Do escalation for high priority issues
        - Tip: define a DRI instead of just having everyone working on
          the issue

    - Identify an escalation path

    - Set response time targets

    - Scheduling shifts - Solution: Teams and Shifts App

      - Add people to shifts, schedule shifts
      - Scheduling can be repeated once set

    - Incident Notifications - Good practices:

      - Specifically directed
      - Actionable
      - In need of human intervention

3.  Guiding Incident Response with Automation

    Focus on things delivering business value:

    - Manual, repetitive tasks to automation

    - Reduce human interaction to reduce variability in response

    - Protect production with notification and response

    - Solution: Azure logic app for automation of incident notification

      - With incident, look up who is on call, notify them in Teams
      - Create new logic app, when an HTTP request is received with
        alert schema
      - Use MS Teams connector (can use personal, service principal)
      - Create new channel with incident
      - Find all shifts that cover incident time period
      - Find on call people for those shifts
      - Post in chat the alert information and mention people in shift
