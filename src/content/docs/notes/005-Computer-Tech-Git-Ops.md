---
filetags: ":git:gitops:operations:iac:epubnote:"
id: a141cf92-ebca-4db8-8908-98965d8aab76
title: GitOps
---

Sources: [Defining GitOps -
GitHub](https://github.com/readme/featured/defining-gitops)

## Definition

Technology pattern

The [desired
state](https://github.com/open-gitops/documents/blob/main/GLOSSARY.md#desired-state)
of a GitOps managed system must be:

### Declarative

A system managed by GitOps must have its desired state expressed\*
[declaratively](https://github.com/open-gitops/documents/blob/main/GLOSSARY.md#declarative-description).

### Versioned and Immutable

- Desired state is
  [stored](https://github.com/open-gitops/documents/blob/main/GLOSSARY.md#state-store)
  in a way that enforces immutability, versioning and retains a complete
  version history.
- Can be audited
- Any version control system can be used, git, Kubernetes are not
  requirements.

### Pulled Automatically

Software agents automatically pull the desired state declarations from
the source.

### Continuously Reconciled

Software agents
[continuously](https://github.com/open-gitops/documents/blob/main/GLOSSARY.md#continuous)
\*observe actual system state and try to apply through
[reconciliation](https://github.com/open-gitops/documents/blob/main/GLOSSARY.md#reconciliation)
the desired state.

## Technology Examples

- Kubernetes
- Flux
- ArgoCD
- Jenkins
- GitHub actions
- Terraform, Nomad
- Open Container Initiative
