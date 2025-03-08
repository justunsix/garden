---
filetags: ":devops:security:epubnote:"
id: 9329dbfe-ee56-4bda-93d7-6bf7a8816b1d
title: Secure DevOps
---

## Docker Image Security

Recommendations from [How to handle security updates to containers OSes?
:
devops](https://www.reddit.com/r/devops/comments/zxdtqd/how_to_handle_security_updates_to_containers_oses/)
Reddit

- Use scratch image with just app binaries
- Periodically update the Dockerfile with base image or use latest
  - Option: Manage the base image yourself
  - Option: Instead of latest tag, tag releases and upgrade them
    gradually using CICD / pull requests

## See Also

- [Secure DevOps: Security Principles and
  Practices](../500-8-tech-security-secure-devops-principles-practices) -
  [Secure DevOps: Security Principles and
  Practices](id:4430aaeb-2a31-4f60-8a77-3e2bffae9eac)
