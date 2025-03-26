---
filetags: ":docker:epubnote:"
id: 4a17b5a3-3c43-42d4-a17c-9c2699a9d9d0
title: Docker Snippets
---

## Image Management

``` bash

# Create a docker setup with the current project
# Go through guide based on project configuration
docker init

# Get an image, the latest version
docker pull redis

# List images on local
docker images

# Compare images
docker scout compare ...

# Scan image for vulnerabilities
docker scout cves image-name:tag

# Build image, name with my-app and tag 1.0
# Use Dockerfile in current directory .
docker build -t my-app:1.0 .

# Tag an image with repository for pushed later
docker tag my-app long-repository-name/my-app:1.0

# Push the image
docker push long-repository-name/my-app:1.0

# Push an image to Docker Hub, assume logged in already
docker push myusername/myapp:latest

# Delete an image
docker rmi image_id

# Create volume
docker volume create --name app-data1

# List volumes
docker volume ls

# See volume details, like file location
docker inspect <volume-name>

# See history of, layers of an image
docker history <image-name>

```

## Container, Run Management, Debugging and Logs

``` bash

# Run Container in attached mode with terminal output
# Command can also pull image if not present
# Ctrl + c to terminate
docker run redis

# Run container in detached mode
docker run -d redis

# Run a specific image with environment variables
docker run -e POSTGRES_PASSWORD=mysecretpassword postgres:14.7

# Run redis with -p to find host port 6000 to container port 6379
# Host ports must be available and not bound already
docker run -p 6000:6379 redis

# Run detached mode with port mapping and with specified name
docker run -d -p 6000:6379 --name redis-old redis

# Run with a named volume -v and path of data in container, requires volume already created
docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

# Check running containers and manage them
docker ps
# Start, stop containers
docker stop id_of_container
docker start id_of_container

# List running or not running containers
docker ps -a

# Check logs
docker logs container_id
# Check logs with name, names are randomized
docker logs container_name

# Run commands in container with exec
# -it - interactive terminal
# /bin/bash - which shell to use
docker exec -it container_id /bin/bash
# Use shell if bash not available
docker exec -it container_id /bin/sh
# Enter container as a user, 0 for root
docker exec -u 0 -it container_id bash

# Delete a container
docker rm container_id

# List network
docker network ls

# Use docker compose to start containers
docker-compose -f mongo-docker-compose.yaml up
# Notice default network is created
# and logs of both containers are shown

# Stop composed containers, remove network
docker-compose -f mongo-docker-compose.yaml down

# Run specific commands from different images
docker compose run

# Watch changes and reload changes per compose.yml settings
# Good for code changes and testing
docker compose watch

# Scan directory for vulnerabilities
docker scout quickview fs://

```

## Repositories

``` bash

# Log into repository
docker login ip_address:port
docker login 1.1.1.1:8083

# Log into Docker Hub
docker login

```
