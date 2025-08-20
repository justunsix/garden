---
description: Package manager for Kubernetes
filetags: ":helm:k8s:kubernetes:epubnote:"
id: 7ed92686-1a85-46cc-8483-6fa1fc0587a2
title: Helm Snippets
---

``` shell

# List charts installed
helm ls

# Add a repository
helm repo add bitname https://charts.bitnami.com/bitnami

# Install a chart
helm install <chartname>

# Install a chart with my-values.yaml to override with custom values
helm install --values my-values.yaml <chartname>

# Install with our name
helm install <custom_name> --values my-values.yaml <chartname>
helm install mongodb --values my-helm-values.yaml bitnami/mongodb

# Only changed items that are changed
helm upgrade <chartname>

# Roll back to previous version
helm rollback <chartname>

# Similar to install with --values but set a specific value on CLI
helm install --set version=2.0.0

# Uninstall a deployed chart
## Find chart
helm ls
helm uninstall <name>

```
