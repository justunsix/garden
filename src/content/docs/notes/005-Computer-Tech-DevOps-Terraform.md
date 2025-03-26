---
filetags: ":devops:terraform:epubnote:"
id: df7e9ded-8c8b-4ede-8d31-7ad229c1b7d1
title: Terraform - infrastructure as code
---

Source: [Terraform explained in 15 mins \| Terraform Tutorial for
Beginners - YouTube](https://www.youtube.com/watch?v=l5k1ai_GBDE)

## Introduction and More Details

See [Infrastructure as Code with
Terraform](../005-computer-tech-devops-bootcamp-twn-infrastructure-as-code-with-terraform) -
[DevOps Bootcamp - Infrastructure as Code with
Terraform](id:726c1b68-0c45-49c8-a7bc-1cc5a4bbc65e)

## What is Terraform used for, Use Cases

Provision infrastructure, platforms, and services.

Use Case, you want:

1.  Provisioning infrastructure - To use AWS to build 3 containers and
    deploy your apps, services, private network space, EC2 server
    instances, install Docker and tools
2.  Deploy applications

Terraform is used for infrastructure provisioning such as creating
infrastructure, user permissions, create servers, install services.

Continuing with the use case, you created the infrastructure, now you
want:

- Add more servers
- Increase security
- Reconfigure infrastructure

Terraform can automate continuous changes. Such as promote
infrastructure changes in DEV to PROD and/or create same infrastructure
in PROD.

### Terraform and Ansible Differences and When to Use Them

They appear to do the same thing?

| Ansible                           | Terraform                               |
|-----------------------------------|-----------------------------------------|
| Infrastructure as Code            | Same                                    |
| Mainly Configuration tool         | Mainly Infrastructure Provisioning tool |
| Configure existing infrastructure |                                         |
| Install/update software           | Can deploy apps                         |
| Mature                            | Newer                                   |
|                                   | Advanced in orchestration               |

- Ansible is better for configuring existing infrastructure
- Terraform is better for infrastructure

Both tools should be used together for their strengths.

## Declarative vs Imperative Approach

- Terraform uses Declarative language - you define the end state
- Imperative approach defines exact steps to get to end state

## See Also

- [Ansible](../005-computer-tech-devops-ansible) -
  [Ansible](id:9d393a61-59de-4540-9495-0c2122cf3d59)
- [Terraform - Azure](../005-computer-tech-devops-terraform-azure) -
  [Terraform - Azure](id:1a54acd2-4463-4917-bb08-dfcb4a0e8ced)
