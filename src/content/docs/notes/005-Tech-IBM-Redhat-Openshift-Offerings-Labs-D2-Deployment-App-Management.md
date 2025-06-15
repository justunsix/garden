---
description: "OpenShift deployment, application management, monitoring,
  and collaborative development, with the option to choose from four
  programming languages: Java, Node.js, Python, or .NET."
filetags: ":redhat:ibm:openshift:lab:workshop:epubnote:"
id: 8137c221-e247-43df-9f25-369007a1f605
title: Red Hat Immersion 2023 Service Offerings and Labs - Deployment
  and App Management
---

Getting Started with OpenShift for Developers

## Container Technology

- Easy to scale

- Lightweight

- Mature, suitable for cloud

- Container is the smallest compute unit

  - Package app and dependencies as unit
  - Created from base images
    - Layers: app, runtime (e.g. Java), OS
    - Image registry, versions
  - Immutable

## Why Kubernetes (k8s)?

- History: application divided into microservices
  - Distributed deployment in network of services
  - Each microservice have their own data
  - Advantages:
    - Easier to scale specific services
    - Availability of services decoupled
- Open source software to manage container workloads across cluster of
  nodes like scale and integrate them

### Understanding k8s Objects

- k8s has API
- Node: host machine of containers
  - Worker nodes
  - Master nodes - manage node activity
- Pod: group of 1 or more co-located containers
  - Smallest unit of scale
- Service: single endpoint for collection of replicated pods, like a
  load balancer
- Deployment: specific container runtime in terms of pods like name of
  app, image, replica
- Cluster: set of nodes
  - Master: api, etcd: persistent state of cluster, scheduler,
    controllers
    - etcd should be backed up to keep cluster state
    - Manage worker nodes like their locations
  - Nodes (kubelet)

### Tools

- cri-o RHEL Container Runtime
  - Secure architecture
  - Optimized for k8s
  - Runs any OCI compliance image including docker
- Podman: manager

### OpenShift Monitoring

- OpenShift has cluster monitoring
  - Metrics and their storage via Prometheus
  - Alerts via Prometheus Alertmanager
  - Metrics visualization via Grafana
- Observability
  - Tools: EFK:
    - Elasticsearch (ES) - search and analytics
    - Fluentd - logs and sends to ES
    - Kibana - web UI for ES
  - Users: Cluster admin can see logs and users can see logs for their
    projects
  - Logs can be forwarded like to Splunk

### Dev vs Ops

- Usually OpenShift setup of manager nodes, persistent storage and
  controlling resources is done by ops. Dev can access projects and
  manage pods
- OpenShift gives many operators, access from Operator Hub:
  - Console
  - Monitoring
  - Auth
  - DNS
  - k8s control
  - DNS

### OpenShift Features

1.  Serverless

    - Based on KNative, Allows deployment functions

2.  Service Mesh

    - Use case: Increased troubleshooting complexity with many
      containers. Need to trace requests, external services.
    - Service Mesh handles a common infrastructure layer with common
      policies and code for security, metrics, tracing, failure
      handling, traffic management - code as a service
      - Mesh can be configured
      - Function actions: secure, observe, connect, control
        - Tools: Jaegar, Kiali, Prometheus, Grafana

3.  Platform Management and Development

    - Console
    - Helm charts to package, install, and update
    - OpenShift CLI
    - IDE plugins - ex. VS Code, IntelliJ
    - OpenShift Local - cluster for developer machines
    - DevSpaces - collaborative k8s web based IDE and developer stacks

### Questions

- Master and worker locations?
  - Master and worker nodes can be on same host, only for small use
    cases, recommended to be separate
- How to manage different environment configurations?
  - Can do by same image and assemble image in DevOps with different
    configurations and secrets, database, and ConfigMaps

### Workshop

See <https://github.com/justunsix/openshift-k8s-tests>

## See Also

- [Red Hat Immersion 2023 Service Offerings and
  Labs](../005-tech-ibm-redhat-openshift-offerings-labs)
