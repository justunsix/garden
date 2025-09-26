---
filetags: ":podman:kubernetes:k8s:snippets:epubnote:"
id: cff51a5c-156b-4f2e-a49f-17a61dd46f76
title: Podman Snippets
---

``` shell

# List running containers
podman ps

# See all containers
podman ps -a

# Stop a container
podman kill container_name
podman kill (podman ps)

# Help
podman --help
podman -h

# Search for images
podman search search_term

# Pull an image with repository specified
podman pull quay.io/podman/hello
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
podman exec it container_name sh

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

# Volumes - list
podman volume ls

# Volume - create
podman volume create mydata

# Volume - see details of a volume like disk location
podman volume inspect mydata

# Volume - Run image with volume mydata
podman run -d --name webapp -v mydata:/usr/share/nginx/html nginx

# Volume - clean up unused volumes
podman volume prune

```

## Podman Machines

``` shell

# Podman machine host for Windows, macOS start
podman machine start

# Podman machine stop
podman machine stop

# Podman machine rootful mode, stop and start after for use
podman machine set --rootful

# List Machines
podman machine ls

# Machine information
podman machine info

# podman machine connections
podman system connection list

```

## Podman Desktop Setup on Windows with WSL

Source: [Windows \| Podman
Desktop](https://podman-desktop.io/docs/installation/windows-install)

``` shell

# pwsh: Enable WSL Feature without default Ubuntu Linux
wsl --update
wsl --install --no-distribution

```

Restart computer, then in start podman-desktop:

- Run through set up of podman machine
- With WSL choose user mode networking, leave other defaults
- After all setup, in dashboard, verify podman is running

In the background, a default podman machine will be running.

## Podman Desktop with Minikube Kubernetes Cluster

Source: <https://podman-desktop.io/docs/minikube>

In podman desktop extensions, install minikube extension and make sure
minikube is installed

``` shell

# Check profiles if any
minikube profile list

# If on Windows and WSL, require rootful machine
podman machine stop
podman machine set --rootful
podman machine start

# Start minikube cluster using podman driver
minikube start -d podman

# Check pods and context
minikube kubectl get po -A
kubectl config current-context
kubectl get pod

# Open minikube dashboard
minikube dashboard

# Stop cluster
minikube stop

```

## See Also

- [Minikube Snippets](../005-computer-snippets-minikube) - [Minikube
  Snippets](id:c430e255-a071-45a5-873c-da3104149bdc)
