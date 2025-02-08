---
filetags: ":tech:podman:epubnote:"
id: 18ae89c3-e170-4f25-b51e-e705e12566a0
title: Podman
---

## About Podman

Source: [Podman vs Docker in 2024: What's Really Different? - Better
Stack on YouTube](https://www.youtube.com/watch?v=SIvoAOpXZPg)

- Cross platform

- Has podman desktop

- Can replace Docker for running containers

- Can manage pods like K8s

- Podman can interact with K8s, for example, export pod definitions to
  k8s yaml like

  - `podman generate kube wordpress-pod > wordpress-pod.yaml`

### Architecture

- Docker: Client-server model, Docker daemon has root privileges
  - Vulnerability
- Podman: CLI opens a new process for a container
  - Integrated with SystemD
  - No Daemon
  - Containers run in rootless mode by default
    - Users can have root access in containers, but will have
      unprivileged access in host

### Docker vs Podman

- Docker has a large ecosystem, 3rd party tools

- podman may require more building ready made images

- podman ecosystem is growing

- Choose podman when:

  - Security is important
  - Working with K8s
  - Need lightweight container engine
  - Want SystemD integration

- Choose docker when:

  - Want a mature ecosystem, documentation, more beginner friendly
  - Need Docker Swarm for orchestration
  - Team already knows Docker

- Alternatively, use both and decide on their strengths or use them for
  specific use cases

## Tools

- Podman desktop - podman compose, kubectl
  - Containers
  - Running containers
  - Containers terminal
  - Images
  - Volumes
  - K8s dashboard - linked to kubectl
    - Nodes, deployments, volumes
