---
date: 2023-03-07
filetags: ":microsoft:tech:azure:open-source:epubnote:"
id: 2b9f9a5e-c9c6-4786-ac3f-86d8d7efd9bd
title: Azure Open Source Day 2023
---

## Agenda

- See app-building demos using Azure and the latest in open-source
  technologies, cloud-native architectures, and microservices.
- Tips and best practices for open source from industry leaders at
  companies like HashiCorp, GitHub, and Redis.
- Learn to build cloud-native apps for relational and nonrelational data
  with Azure Cosmos DB, now supporting PostgreSQL.
- Discover new capabilities in IaaS, PaaS, containers, and serverless
  computing, including Azure Kubernetes Service (AKS).

## Introduction

Open source advantages:

- Distributed global development and many developers can participate
- Choice in people, software, collaboration
- Open standards
- Vendor neutral and competing companies work together
- AI assisted software development, though disadvantage is security
  problems like spam pull requests, intrusion use

## Demonstration - Open Source + AI to Build an Intelligent App

Pet spotter app, connect owners with their lost pets called "Petspotr"

- Use ML classification model to identify pet and allows found pets to
  match to their owner's pictures

### Walk Through

- Visual Studio Code - extension for k8s

  - Bridge to k8s - manage k8s

- Bicep: Infrastructure as Code

  - Bicep is open source, has extension fro AKS
  - Azure key vault, k8s, cluster sizes and configuration
    - Containers
    - Azure Cosmos Redis DB
  - AKS cluster built using Bicep configuration file
  - Bicep assists with specification of resources with Intellisense,
    telling you required fields and values
  - Push bicep to git, GitHub action deploys infrastructure
  - K8s
    - import kubernetes
    - Configures all k8s resources
    - Use dapr for backend configuration

- Kubernetes (k8s)

  - Distributed Application Runtime (Dapr)
    - Dapr manages complexity of microservices
    - Dapr client can
      - Help programs communicate with state store
      - Handle redis provisioning
      - Publish / subscribe to topics
      - Run programs like front/back end locally in containers
    - Dapr dashboard shows it takes care of use of cloud resources when
      deployed

- Web application: report lost pets and found pets

- Azure load testing - for CI/CD

- Playwright - cross-browser testing for web apps and has extension for
  VS Code

- Machine learning

  - Using huggingface.co ML model, use existing models, image
    classification
    - Why "huggingface" - interest in AI recognizing emotions like a hug
    - Azure ML can access Hugging Face foundational models with popular
      models instead of large one time setup (e.g. GPT 2)
  - Azure ML
    - Configure pipeline for input/outputs, pytorch
    - Python, set inputs of pet metadata
    - Build pipeline to update pet spotter app model with uploaded
      pictures
    - During found pet, get image, call model and predict if images have
      a prediction score match, if match, notify owner
    - If match found, use sendgrid to send email, email asks owner to
      confirm if found pet is a match
  - Florence - foundational model for image, video recognition available
    with Azure ML
  - Responsible AI toolbox - mitigation and tracker to support look at
    performance of data

- KEDA - Kubernetes Event-driven Autoscaling

  - Use to test k8s to ensure production readiness under load and
    autoscale

- Scalability

  - Azure Cosmos DB set to autoscale on resource units from low to high
    activity with a minimum, maximum
  - Azure load testing
    - Can use open source JMeter script to simulate users and tests
  - Products
    - Azure MySQL can be auto scaled
    - Power Apps, PowerBI integration with Azure Cosmos
    - Azure Redis cache, storage of json documents
    - Virtual machine scale sets
      - VMs with baseline processing and can expand CPU

## References

- [Azure-Samples/PetSpotR: Demo application that showcases a modern,
  cloud-native application -
  GitHub](shttps://github.com/azure-samples/PetSpotR)
