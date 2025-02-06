---
filetags: ":podman:snippets:epubnote:"
id: cff51a5c-156b-4f2e-a49f-17a61dd46f76
title: Podman Snippets
---

``` shell

# List running containers
podman ps

# See all containers
podman ps -a

# Help
podman --help

# Search for images
podman search <search_term>

# Pull an image with repository specified
podman pull docker.io/library/httpd

# Pull image from Docker Hub
podman pull docker.io/nixos/nix

# List images
podman images

# Run container
podman run -dt -p 8080:80/tcp docker.io/library/httpd
## -d detached mode
## -t pseudo-tty to run commands in interactive shell
## -p port forwarding

podman run -it image_name

# See container details
podman inspect -l

# Stop container
podman stop <container name or id>
# Stop last started container
podman stop -l

# Remove container
podman rm <container name or id>
# Remove last started container
podman rm -l

# Export pod definitions to k8s yaml like
podman generate kube wordpress-pod > wordpress-pod.yaml

```
