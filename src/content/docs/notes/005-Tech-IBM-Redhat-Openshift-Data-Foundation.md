---
id: 84428d10-a790-493f-b1d2-349861cb0d44
title: Redhat Openshift Data Foundation (ODF)
---

Source: [Red Hat OpenShift Data
Foundation](https://www.redhat.com/en/technologies/cloud-computing/openshift-data-foundation)

ODF was previously Red Hat OpenShift Container Storage

Use case is software defined storage for containers. Integrates data
services in the platform with features like security, governance,
discovery, continuity like backup, and management data like compression.

Example use cases involve data like databases, Kafka messaging,
pipelines, integration with infrastructure monitoring, and disaster
recovery.

## Openshift Data Foundation Components

- Rook, a orchestration operator - automates administration
- ceph, persistent storage operator
  - File, block volume, object store
- nooband - multi cloud gateway operator
  - Object buckets
  - Dynamic buckets
  - Namespace buckets

Installed as an operator called OpenShift Data Foundation. On
installation, set up a storage system.

## Benefits

- Allows management of persistent volumes and block storage
- Works with multiple clouds, on premise, and protocols
- Scaling of storage
- Support and management in one place
