---
filetags: ":devops:nana:bootcamp:terraform:epubnote:"
id: 726c1b68-0c45-49c8-a7bc-1cc5a4bbc65e
title: DevOps Bootcamp - Infrastructure as Code with Terraform
---

Source: My notes from DevOps course by TechWorld with Nana

## Introduction to Terraform

### What is Terraform?

- Automate and manage infrastructure, platforms, and services.
- Open source Mozilla Public License copy left
- Uses declarative language:
  - Say what you want the end result to be, not all steps are required
  - Terraform will figure it out vs imperative language where you
    specify all steps

### Tools for Infrastructure Provisioning

For example, deploy applications, micro services containers on AWS

On AWS:

- Prepare infrastructure:

  - Private network, VPC
  - EC2 servers, users and permissions
  - Install Docker and tools
  - Security (firewalls, vnet)

- Deploy applications

- Infrastructure deployment and applications may be separate teams

- Terraform is used for first part = infrastructure deployment

- After creation, we want to make changes to the infrastructure like
  adding servers, changing security rules

- Terraform can automate:

  - Continuous changes to the infrastructure
  - Replicate infrastructure such as promote from DEV to staging to PROD

### Differences of Ansible and Terraform

Similarities:

- Both are infrastructure as code (IAC)

Differences:

- Terraform - mainly infrastructure provisioning tools, good for
  orchestration
- Ansible - mainly configuration tool (configure infrastructure, deploy
  apps, manage software), more mature relative to Terraform

In summary:

- Ansible: Better for configuring infrastructure
- Terraform: Better for provisioning infrastructure

Use both for cover infrastructure management

### Terraform Architecture

How does Terraform connect to the platform provider?

2 main components:

- Core
  - Plans what needs to be created/updated/destroyed from current to
    desired states
  - Connect to providers
  - Executes plan with providers
- 2 input sources:
  - TF config
  - State
- Providers - they provide access to the platform's resources
  - AWS - EC2, users, …
  - Azure
  - IaaS…
  - Kubernetes - services, deployments, namespaces, …
  - PaaS
  - Fastly, SaaS

``` plantuml
[TF config] --> [2 input sources]
[State] --> [2 input sources]
[2 input sources] --> [CORE]
```

### Example Configuration File

Hashicorp Configuration Language (HCL)

- Specify provider then its resource and attributes

``` hcl

# Configure the AWS Provider
provider "aws" {
  version = "~> 2.0"
  region = "us-east-1"
}

# Create a VPC
resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

# K8s example
provider "kubernetes" {
  config_context_auth_info = "ops"
  config_context_cluster “mycluster"
}

resource "“kubernetes_namespace" "example" {
  metadata {
    name = "my-first-namespace"
  }
}

```

### Declarative vs Imperative

- Declarative = end state
  - For example, I want 5 servers, this network configuration, AWS user
    with these permissions
  - To make changes, specify now 7 servers, this firewall configuration,
    user will following permissions
    - Terraform will figure out changes required
    - You know the current setup by looking at the configuration file
- Imperative = step by step
  - For example, create a server, create a network, create a user, add
    permissions
  - To make changes, remove 2 servers, add firewall, add permission to
    AWS users

1.  Advantages of Declarative approach

    - During provisioning, both approaches are similar.
    - The advantage is in updating the infrastructure.

    For example, removing 2 servers:

    - Imperative config file
      - Remove 2 servers
      - Add firewall config
      - Add permission
      - …
    - Declarative config file
      - Down to 7 servers
      - Use this firewall configuration
      - Users have these permissions

    With Terraform, just adjust old configuration file and re-execute
    it:

    - Clean configuration file
    - Known desired state

### Terraform Commands for Different Stages

- Desired state in Terraform (TF) configuration file

- `refresh` : query infrastructure provider to get current state

- `plan` : compare current state to desired state, create an execution
  plan

  - Only a preview, no changes

- `apply` : execute the plan

  - Changes are made to the infrastructure

- `destroy` : destroy the resources/infrastructure

  - Done in order

### Key Takeaways

- TF is a tool for creating and configuring infrastructure
- Universal IaC tool for multiple providers
  - Different cloud provider
  - Different technologies
- Use 1 tools to integrate all different technologies like AWS, K8s,
  Jenkins, VMWare, etc. so you don't need to know APIs for all those
  tools. TF abstracts it from you.

## Install Terraform & Setup Terraform Project

## Providers in Terraform

## Resources & Data Sources

## Change & Destroy Terraform Resources

## Terraform commands

## Terraform State

## Output Values

## Variables in Terraform

## Environment Variables in Terraform

## Create Git Repository for local Terraform Project

The project files used in this lecture can be found here:

<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/terraform-learn>

## Automate Provisioning EC2 with Terraform - Part 1

The project files used in this lecture can be found here:

Starting code:
<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/terraform-learn>

## Automate Provisioning EC2 with Terraform - Part 2

## Automate Provisioning EC2 with Terraform - Part 3

In this lecture the files used are committed to the following project
branch towards the end of the video:

<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/terraform-learn/-/tree/feature/deploy-to-ec2-default-components>

## Provisioners in Terraform

The project files used in this lecture can be found here:

<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/terraform-learn/-/tree/feature/provisioners>

## Modules in Terraform - Part 1

## Modules in Terraform - Part 2

## Modules in Terraform - Part 3

The final modularized project files used in this lecture can be found
here:

<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/terraform-learn/-/tree/feature/modules>

## Automate Provisioning EKS cluster with Terraform - Part 1

The project used in the following three lectures can be found here:

<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/terraform-learn/-/tree/feature/eks>

## Automate Provisioning EKS cluster with Terraform - Part 2

## Automate Provisioning EKS cluster with Terraform - Part 3

## Complete CI/CD with Terraform - Part 1

The project files for the next three lectures can be found here:

Starting code:

<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/java-maven-app/-/tree/feature/starting-code>

Final project:

<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/java-maven-app/-/tree/jenkinsfile-sshagent>

## Complete CI/CD with Terraform - Part 2

The installation documentation for Terraform can be found here:
<https://developer.hashicorp.com/terraform/downloads>

The project files used in this lecture can be found here:

Terraform Learn:
<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/terraform-learn/-/tree/feature/eks>
Java-maven-app:
<https://gitlab.com/twn-devops-bootcamp/latest/12-terraform/java-maven-app>

The installation documentation for Docker Compose standalone can be
found here: <https://docs.docker.com/compose/install/standalone/>

## Complete CI/CD with Terraform - Part 3

## Remote State in Terraform

## Terraform Best Practices

## See Also

- [Terraform](../005-computer-tech-devops-terraform) - [Terraform -
  infrastructure as code](id:df7e9ded-8c8b-4ede-8d31-7ad229c1b7d1)
