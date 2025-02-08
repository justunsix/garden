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
podman search search_term

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

# Run container with interactive terminal
podman run -it image_name

# Go into container terminal
podman exec it api sh

# Run containers and create a kubernetes deployment for them
podman run -d --name web nginx
podman run -d --name db postgres
# save deployment.yaml in nushell or bash redirect to new file
podman generate kube web db > deployment.yaml
# deployment.yaml can be applied to k8s cluster

# Runs pods locally and view them
podman play kube deployment.yaml
podman pod ps

# See container details
podman inspect -l

# Stop container
podman stop container_name_or_id
# Stop last started container
podman stop -l

# Remove container
podman rm container_name_or_id
# Remove last started container
podman rm -l
# Remove multiple containers
podman rm -f container1 container2

# Export pod definitions to k8s yaml like
podman generate kube wordpress-pod > wordpress-pod.yaml

# See processes in a container
podman top container_id

# List pods
podman pod ps

# Create pod, managed namespace
podman pod create --name webapp

# Run pod with redis
podman run -d --pod webapp --name redis redis
# -d detached
podman run --rm --pod webapp redis redis-cli -h localhost SET mykey "Hello from Redis"
podman run --rm --pod webapp redis redis-cli -h localhost GET mykey

# See details of pod
podman pod inspect webapp

# See logs
podman logs --container redis

# Windows, macOS start podman host
podman machine start
# List Machines
podman machine ls

```
