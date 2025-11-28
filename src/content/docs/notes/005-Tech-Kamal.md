---
id: f47686a2-2d19-419f-8c11-da3ebb099496
title: Kamal - Deploy web apps anywhere
---

\#:filetags: :kamal:epubnote:

Use case is deploy web application in containers anywhere like cloud, on
premise, virtual machines, and bare metal. Benefits are no downtime,
rolling restarts, accessory (example databases, networking) management,
and remote builds. It simplifies web application deployments for use
cases that require less than complexity than Kubernetes.

[Kamal Snippets](/garden/notes/005-tech-snippets-kamal) - [Kamal
Snippets](id:b5064ecf-6e06-4975-bb8f-5c4098d7403a) shows example usage
for a simple web application and database which will be a kamal
accessory.

## Configuration

It requires IP address of target machines and installs/uses the Docker
engine. Scaling can be done with adding servers in configuration.

Kamal can manage SSL/TLS certificates with given DNS information.

Common commands can be run with kamal aliases like kamal logs to see
application logs
