---
filetags: ":java:application:microsoft:epubnote:"
id: 956282c1-6520-452d-a693-350ddf4e75fa
title: Microsoft Java Apps
---

## Modernize Your Java Apps with Microsoft Azure 2023-04-18

### Demonstration - Copilot and Java Apps

- VS Code with Java extensions
- Annotations with GitHub copilot help with code generation
  - Java code
- Jump to different languages SQL, Terraform, docker-compose.yml

### Java on Container Apps

- Use Azure Container Apps

Use cases:

- Microservices
- API
- Web Apps
- Event driven processing
- Background

1.  Containerize Java Apps

    - Self contained Dockerfile with all Dependencies

    - Avoid large base images with unneeded software

    - Secure and scalable build strategy

    - Run as non-root user

    - JVM tuning

      - Heap memory
      - Pod replicas

    Hierarchy:

    Environment:

    - App
      - Revision - immutable version
        - Replica - multiple
          - Container
    - Integrations
      - Pipelines
      - Secrets management
      - Cross app connections

    1.  Demonstration

        Deploy Spring Boot microservices using DAPR to Azure container
        apps

        using PowerShell `az` commands to create environment,
        replica/container config and variables for dapr

        Set shell environment variables for addresses

        Integration with application insights
