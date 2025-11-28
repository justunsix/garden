---
date: 2023-11-29
description: "Day 1: Red Hat Openshift Essentials - About Platform and
  Business Uses"
filetags: ":redhat:ibm:openshift:lab:workshop:epubnote:"
id: 1f4500be-1d52-47cb-92c1-ff9fd8bd5b5c
title: Red Hat Immersion 2023 Service Offerings and Labs - Features and
  Services
---

## About Red Hat and Openshift

- Red Hat known for Linux, Openshift, open source contributions,
  developer tools - many built in Ontario
- Openshift
  - For service designers, full stack developers, DevOps
  - Used by many organizations and Canadian regions

## British Columbia Developers' Exchange - Todd W.

- BC Developers' Exchange goal was to increase digital delivery in
  public service
- Issue: public service projects found that development took many months
  and delivery years leading to outdated solutions

### Why using technologies is important?

- Agile - small chunks

- Consistent improvement, delivery of services

- Dr. Eliyahu Goldratt, developer of the Theory of Constraints, speaks
  to this issue directly: "Technology can bring benefit if, and only if,
  it diminishes a limitation."

- Reality of IT is complex, fragmented, and many connections - people,
  process, and technology

### How to Improve Digital Delivery?

Use a platform to address infrastructure, application, people & process
areas:

- Infrastructure
  - Simplify
    - Automated
      - Example firewall operator accessible to developers for self
        service
    - Complexity abstracted
    - Secure by default
- Application
  - Standardize
    - Lower cognitive load, developers don't need to know everything
    - Opinionated frameworks
    - Reuse
- People & Process
  - Accelerate
    - X as a Service
    - Feedback from all teams, not just platform
    - DevSecOps

Found people need quick start guides and physical solutions, not just
principles.

### Vision, Mission, Physical Platforms

- Vision was focusing on success of app delivery teams, digital
  transformation will follow
  - Quicker hiring, procurement
  - Treat developers like customers
  - Make platform like a product

### Building Platform

- Need people with DevOps skills, pathfinder team when creating
  platform:
  - Sponsor
  - Product owner
  - Architect
  - Developer
  - Operation admin
  - UX/CX designer
  - Policy/process analyst
  - Communications expert
- Start small, communicate and sell to others

### Platform operating model

- Self service

- Environment Standardization

- Auto scaling

- Community sharing, standards, common approaches

- Automation: testing, software

- Infrastructure as Code

- Platform engineer, app developer have different and integrated roles
  and tools

- Performance measures of platform:

  - App delivery time, rate, total app hosting
    - Cost/time reduction compared to traditional deployment
  - Stable and secure architecture
    - Reduced vulnerabilities fix time
  - Automate hybrid
    - Short change window
  - Digital transformation
    - App delivery

### Platforms

- Openshift
  - On Premise
  - Azure clusters
- Tools: Rocket.chat, keycloak, GitHub, Selenium, Jenkins, sonarqube

## Develop, Deploy and Connect Cloud Native Applications - Suleiman S.

Agenda: APIs, events and messaging, enterprise integration, data
integration

- Common needs: hybrid cloud, cloud native development, IT automation
  and management
  - Monolith app to component microservices
  - Automate k8s app operations –\> Openshift
  - Runtimes, frameworks to build apps on k8s –\> Red Hat Application
    Services
    - Pick right technology/tool in platform
  - Tools and standard process –\> Red Hat Openshift Dev Spaces - cloud
    IDE

### Tools and Frameworks

- Migration toolkit for applications (MTA) - legacy to modern apps
- Java
  - OpenJDK
    - Standardize Java across environments, production ready
  - Development patterns, microservices
  - Cloud/container native Java
  - Enterprise Application Platform - Red Hat JBoss
    - Jakarta EE server
    - Cluster, modular
  - Java App Frameworks - Quarkus
    - For cloud native lightweight containers
- Web Server - Red Hat JBoss
  - Apache web server, Tomcat, load balancer
- Single Sign On - Red Hat SSO
  - IAA, integration with existing directories
  - Optimized for OpenShift
  - Supports SAML, OpenID
- In-memory distributed data - Red Hat Data Grid
  - Optimized for container, cluster, cross region
  - Get data from different data sources
- API Management - Red Hat 3scale API Management
  - Security gateway
  - Analytics, performance analytics

### Event Driven Architecture, Integration

- Messaging
  - Red Hat AMQ (Active Messaging Queue)
  - Functions: event notification, enterprise messaging, support
    microservices, integrate to other systems
- Integration
  - Apache Camel - Red Hat has multiple implementations
  - System integration: data transformation, connections, routing,
    workflow, data validation
- Connection Options
  - Public IPs
  - VPN Network
  - Virtual Provider Network (e.g. vendor based)
  - Overlay Network - Red Hat Service Interconnect
    - Developer controlled
    - Network isolation on application layer
    - Two services on different clusters establish trust with tokens,
      mutual TLS
    - No code, network, admin rights needed

## Red Hat OpenShift vs Cloud provider Kubernetes Services - Chris G.

- Spectrum: Do it yourself to managed services to additional support
  turnkey

  - On AWS, Azure, GCP

- Red Hat tests and validates components in a stack for you

- Managed platform reduce work load on local team such as testing,
  monitoring set up

- Support is through licensed subscriptions

## Automation: Ansible - Taymour E.

See [Ansible](/garden/notes/005-computer-tech-devops-ansible) -
[Ansible](id:9d393a61-59de-4540-9495-0c2122cf3d59)

## Red Hat Learning Subscription

- Training for teams - self paced, lab environments, forums
- Early access training
- Skill paths - SRE, developers, system admin, management
  - Platforms: OpenStack, RHEL, OpenShift, Ansible
- OPS seats are available

## See Also

- [Red Hat Immersion 2023 Service Offerings and
  Labs](/garden/notes/005-tech-ibm-redhat-openshift-offerings-labs)
