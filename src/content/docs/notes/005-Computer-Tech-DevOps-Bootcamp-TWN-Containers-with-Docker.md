---
description: What are and how to use containiners, Docker, Commands;
  Develop run build push and deploy containers
id: e3a9ebe3-c3b4-448a-ac9d-ca64db5c5f50
title: DevOps Bootcamp - Containers with Docker
---

Source: My personal notes from DevOps course by TechWorld with Nana

- Demo project: deploy and set up Nexus as a Docker container, create
  private Docker repository on Nexus and push/fetch from repository

## What is a Container

- Way to package application with all necessary dependencies and
  configuration
- Portable, easily shared
- Makes deployment easier

### Where are they stored?

- Containers are stored in a container repository
  - Private repositories
  - Public repositories:
    - [Docker Hub](https://hub.docker.com/)

### Use case of containers

- Consistency and ease of development:
  - Application Development: all needed services and dependencies are
    inside container instead of developer installing locally on
    different OS
  - Isolated environment
  - Packaged complete configuration
  - One command to install application: docker run …
  - Multiple versions of app on host possible
- Portable, consistent deployment:
  - Complete application package instead of developer telling operations
    steps to set up application
  - Avoid dependency conflicts
  - Configuration as code instead of documentation
  - DevOps integration: package all configuration in on place, no impact
    to server except Docker runtime
- Other Container Technologies: containerd, cri-o

## Container vs Image

- Container has layers of images

- Base image is Linux base image which are small like alpine Linux

- Application image on top

- Docker image is the actual package that is portable and can be shared

- Container is the environment that is running

  - File System
  - Environment configuration
  - Application image
  - Network, ports binds

- Summary: Image is what is shared, container is what is running

### Working with Docker

- Can use Docker Desktop, Linux can run docker natively, Windows and
  MacOS require Docker desktop with Docker engine

- Try running docker postgres image from public Docker Hub. No login or
  configuration needed due to public repository

  - Docker will pull image and then images being pulled

- Layers can be reused across Docker containers if they are the same

``` bash

# Run Postgres container and start postgres
docker run -e POSTGRES_PASSWORD=mysecretpassword postgres:13.10

# Easy to run another version at same time
## Notice only new layers are pulled
## Other layers can be reused
docker run -e POSTGRES_PASSWORD=mysecretpassword postgres:14.7

# Check running containers
docker ps

```

## Docker vs Virtual Machine

- Operating Systems have 2 layers: kernel and applications
  - Applications run on kernel
- VMs and Docker both are virtualization tools
  - Docker virtualizes the applications layer and uses host kernel
  - VM virtualizes both the kernel and application players
- Images
  - Docker: Small in order of megabytes
  - VM: Couple of GB
- Speed
  - Docker: containers start in seconds
  - VMs: can take minutes
- Compatibility:
  - Docker: Requires Linux host
    - Docker Desktop uses a hypervisor layer with a lightweight Linux
      distro for Windows and MacOS
  - VM: Runs on all OSs

## Docker Architecture and Its Components

- Containers existed before Docker, though Docker made them easier to
  use

- Docker Engine - all functions in 1 application:

  - Server - manage, pull images and containers
    - Container runtime
    - Volume - persist data
    - Network - network for container communications
    - Build images
  - API - interact with server
  - CLI - client to server

- Need only a container runtime? can use containerd, cri-o

- Need only a container builder? buildah

## Main Docker Commands

See [Docker Snippets](../005-computer-snippets-docker)

### Container Port vs Host Port

- Multiple containers can run on Host
- Host ports are bound to container ports
  - Host ports must be unique, though multiple containers could be
    listening on the same post

## Debugging Docker Containers

See [Docker Snippets](../005-computer-snippets-docker)

like docker logs, docker exec

## Docker Demo - Project Overview

Example process

1.  Pull image from public repository like Docker Hub
2.  Develop app
    - Develop JavaScript (JS) app with MongoDB
      - JS frontend
      - NodeJS backend that connects to database
      - MongoDB with MongoExpress UI
    - Pull MongoDB public image
    - Do JS work
3.  Commit to git
4.  CI server builds image
    - Jenkins does build and creates artifacts
    - Build app, uses Dockerfile to Docker image
5.  Push to private repository
6.  Deployment server pulls from private repository and public images,
    then deploys
    - Pull private image and MongoDB image
    - Running container

## Developing with Docker

Repositories for profile management app

- Starting code:
  <https://gitlab.com/twn-devops-bootcamp/latest/07-docker/js-app/-/tree/feature/starting-code>
- Final code:
  <https://gitlab.com/twn-devops-bootcamp/latest/07-docker/js-app>

### Development

- Access app with <http://localhost:3000>
- Want to connect JS app to MongoDB database for data persistance and
  MongoExpress for UI

``` shell

# Get images for database
docker pull mongo
docker pull mongo-express 

# check images
docker images

# Create network for app communications
docker network create mongo-network

# Run mongodb image with:
# Use default MongoDB port of 27017
# Username and password
# with network previous created
docker run -p 27017:27017 -d --name mongodb \
-net mongo-network
-e MONGO_INITDB_ROOT_USERNAME=admin \
-e MONGO_INITDB_ROOT_PASSWORD=password \
mongo

# Run mongo express to connect to mongodb
# Server will be the name of the mongodb container
docker run -d \
 --network mongo-network \
 --name mongo-express \
 -p 8081:8081 \
 -e ME_CONFIG_MONGODB_ADMINUSERNAME=admin \
 -e ME_CONFIG_MONGODB_ADMINPASSWORD=password \
 -e ME_CONFIG_MONGODB_SERVER=mongodb \
 mongo-express
# See mongo-express at http://localhost:8081
# Create a new database to use with NodeJS

# Check logs after doing some development and inserts
docker logs mongodb | tail

```

### Docker Network

- Docker has an isolated network. Containers can talk to each other
  using their container names
- Apps on the host can use host ports to connect to containers

### NodeJS and JS App

- Using commands above, NodeJS can connect to the mongodb at
  "<mongodb://admin:password@localhost:27017>" from mongodb docker run
  command. Usually, you would use a separate user and not the admin user
  and put the password in a secret.
- Server.js will query mongodb and list users and update users

## Docker Compose - Run multiple Docker Containers

- Instead of running multiple containers manually using `docker run`,
  we'll use docker compose file
  - Helps structure your commands
  - Compose will automatically set up a single network for the app, but
    there is option to specify networks

Example `mongo-docker-compose.yaml`

``` yaml

version: '3'
services:
  # my-app:
    # image: ${docker-registry}/my-app:1.0
    # ports:
     # - 3000:3000
  mongodb:
    image: mongo
    ports:
     - 27017:27017
    environment:
     - MONGO_INITDB_ROOT_USERNAME=admin
     - MONGO_INITDB_ROOT_PASSWORD=password
    # Path to mongodb data storage inside container
    volumes:
     - mongo-data:/data/db
  mongo-express:
    image: mongo-express
    # Restart always to make sure mongo-express 
    # restarts if it cannot connect to mongodb
    restart: always
    ports:
     - 8081:8081
    environment:
     - ME_CONFIG_MONGODB_ADMINUSERNAME=admin
     - ME_CONFIG_MONGODB_ADMINPASSWORD=password
     - ME_CONFIG_MONGODB_SERVER=mongodb
    # Help specify order of container start up
    # so mongodb should start first
    depends_on:
     - "mongodb"
# Using volume defined above on host's local storage
volumes:
  mongo-data:
    driver: local

```

``` shell

# Use docker compose to start containers
docker-compose -f mongo-docker-compose.yaml up
# Notice default network is created
# and logs of both containers are shown

# List running containers
docker ps

# Stop composed containers, remove network
docker-compose -f mongo-docker-compose.yaml down

```

- Note that data is lost when containers are turned off if storage is
  not specified

## Dockerfile - Build a Docker Image

- Use case: Want to package an application for deployment in an
  environment

- What is a Dockerfile?

  - Blueprint for an image
  - Must always be saved as `Dockerfile` with no file extension
  - Example for JS app
    - Base on existing image: node
    - `RUN` command only affects container and can run multiple commands
    - Copy artifact (jar, war, bundle.js) into an image using `COPY`
      command. `COPY` command runs on the **host**
    - `CMD` is entrypoint command, only runs a single command, could
      also be a script

Example Dockerfile for Node and JS app

``` Dockerfile

# Specific tagged image of node
# Image will have its own Dockerfile
# Alpine is a lightweight Linux image as a base of the node image
FROM node:20-alpine

# Option to set environment variables in image
# but good practice to specify outside like in Docker compose
ENV MONGO_DB_USERNAME=admin \
    MONGO_DB_PWD=password

RUN mkdir -p /home/app

# Best practice, only include application files
# Do not include things like Dockerfile, docs
COPY ./app /home/app

# Set default dir so that next commands executes in /home/app dir
WORKDIR /home/app

# will execute npm install in /home/app because of WORKDIR
# Get latest node modules at image build time
RUN npm install

# no need for /home/app/server.js because of WORKDIR
# running node server.js
CMD ["node", "server.js"]

```

- Once Dockerfile and image is set up, a CI server can help build the
  image and push to a repository. Other people or deployment servers can
  use the image from the repository.
- If Dockerfile changes, new image must be built

## Private Docker Repository

- Goal is create a Docker private repository on AWS ECR. There are many
  other registry options like Nexus and DigitalOcean

### Image Naming in Docker Registries

- Standard is registryDomain/imageName:tag
- Examples
  - DockerHub docker.io/library/mongo:4.2
  - AWS ECR registry-long-name/my-app:latest

### Using AWS Elastic Container Repository (ECR)

- On AWS, Create a new Elastic Container Repository (ECR). On ECR, each
  image has its own repository. Different tags (versions) of the images
  are stored in the repository.
- Name ECR after app
- Use "View push commands" button to use with AWS CLI to use with docker
  login after [Configuring settings for the AWS
  CLI](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)

``` shell

docker build -t my-app .
# Tag app in prpearation for repository push
docker tag my-app long-repository-name/my-app:1.0
# Push to AWS ECR
docker push long-repository-name/my-app:1.0 

```

- See image is in AWS ECR
- These steps are like what a CI server like Jenkins would build and
  push images to a repository

## Deploy docker application on a server

- Update JS app DB connection string in `server.js`, server name instead
  of localhost will now be mongodb, which is the name of the server
  specified by docker compose file
- Push new image
- Server gets image from container registry
- Update Docker compose file to pull image from private repository like
  AWS ECR and ports for app
- Server needs to have `docker login` for private repository

``` shell

# Pull images, run them
docker-compose -f mongo.yaml 

```

- Full app and database will be available on the server

## Docker Volumes - Persisting Data

- Use case: persist database container data

- Set up volumes at the services level of docker compose file

- When containers with volumes are started, docker will replicate data
  to those container(s), so data is persisted after starts and stops

### Docker Volume Locations

- Depends on operating system with Docker desktop:
  - Windows: `C:\ProgramData\docker\volumes`
  - Linux/MacOS: `/var/lib/docker/volumes`
    - On MacOS, the data is inside the Docker engine host and not on the
      MacOS host itself
      - See the VM data with
        `docker run -it --privileged --pid=host debian nsenter -t 1 -m -u -n -i sh`,
        then visit that var directory
- After those directories, individual hashes will show up

## Create Docker Hosted Repository on Nexus

- Can push images to Nexus

- Create a new repository, type is docker (hosted)

  - Start with defaults

- Create a new role that has access to the Docker hosted repository

  - Create nx-docker role, choose view-docker-hosted-\*
  - Assign to new or existing users
  - Config repository connector http (not secure) like 8083. Port must
    be different than Nexus

- Get repository login information from Nexus Realms

  - in Security \> Realms:
    - Activate the Docker Bearer Token

- On docker client machine, add Nexus http address as an insecure
  registry

  - On Linux, modify json settings or in Docker Desktop on
    Windows/MacOS, modify Docker engine settings like

``` json

{
  "insecure-registries" : [ "hostname.cloudapp.net:5000" ]
}

```

- Use `docker login ip_address:port`
  - Make sure port does not conflict with Nexus and firewall on Nexus
    server is open
  - Input credentials
- Tag the image with repository name, image name and tag
- docker push the image

## Deploy Nexus as Docker Container

- Previously, for Nexus on Digital Ocean Droplet:
  - Install Java
  - Download and install Nexus
  - Create user
  - Deploy Nexus

### Run Nexus as a Docker container on a Droplet

- Create Droplet, 4cpus, 8 GB RAM, 160 GB Disk
  - Open firewall for Nexus and Docker
- SSH to server

``` shell

# Install Docker
sudo apt update
snap install docker

# Use Nexus sonatype/nexus3 image from DockerHub
# Set up data volume for nexus
docker volume create --name nexus-data
docker run -d -p 8081:8081 --name nexus -v nexus-data:/nexus-data sonatype/nexus3

# Verify Nexus is listening on 8081
ss -lntup

# Go into container and see user is nexus
docker exec -it nexus3 /bin/bash
# Go to /nexus-data in container for persistent storage

```

## Docker Best Practices

- Use official Docker images as base images
  - Example, instead of using a base OS image and install programs, use
    the program's official image like node
- Use tagged base images instead of untagged versions which will always
  use the latest, like use node:20.0.2
- Choose the right base image
  - Bases on full operating systems have utilities, but will be large
    and have more security vulnerabilities
  - Small operating system distro will have less storage and smaller
    security risk profile
    - Example: alpine, node:20.0.2-alpine
      - Security oriented
  - If you don't need specific utilities, use small base images
- Order Dockerfile commands from least to most frequently changing to
  optimize caching image layers
  - Will improve cache and build time in case of changes
  - Layers are task/commands used to create the image
    - For example, making a change to code and COPY command layer will
      be changed
    - When one layer in Dockerfile is changed, later layers will also be
      re-built
  - Structure the Dockerfile to only run commands for certain changes
    like this example where npm install only needs to run during
    package.json changes

``` Dockerfile

FROM node:20.0.2-alpine

WORKDIR /app

COPY package.json package-lock.json

RUN npm install --production

COPY myapp /app

CMD ["node", "src/index.js"]

```

- Keep image size small to efficiency and security
  - Use `.dockerignore` to exclude files and folders like .git, .cache,
    .md, README, sensitive files
- Exclude build only files - use multi stage builds
  - Apps may require many build dependencies like test, temp, developer
    tools, and build tools, but are not needed for running the
    application
    - Examples: package.json, pom.xml, JDK, mvn, gradle
  - Example below where an image is used for build, then only relevant
    build output is copied to the final image. The build image is
    discarded

``` Dockerfile

# Build stage

FROM maven AS build

WORKDIR /app

COPY myapp /app

RUN mvn package

# Run stage
FROM tomcat
COPY --from=build /app/target/file.war /usr/local/tomcat/...

```

- Set user with least privileges to start application
  - Use a specific user instead of root to prevent security risks on
    container and host
  - Some base images already have users like node

``` Dockerfile

# Create group and user
RUN groupadd -r tom && useradd -g tom tom

# Set ownership and permission
RUN chown -R tom:tom /app

# Switch to user
USER tom

CMD node index.js

```

- Scan images for vulnerabilities
  - Use `docker scout cves <image-name:tag>`
  - Upgrade libraries and apply fixes

### Summary of Above Practices

1.  Use Official Docker Images as Base Image
2.  Use Specific Image Versions
3.  Use Small-Sized Official Images
4.  Optimize Caching Image Layers
5.  Use `.dockerignore` to exclude files and folders
6.  Make use of "Multi-Stage Builds"
7.  Use the Least Privileged User
8.  Scan Your Images for Vulnerabilities

## See Also

- [Docker Snippets](../005-computer-snippets-docker) - [Docker
  Snippets](id:4a17b5a3-3c43-42d4-a17c-9c2699a9d9d0)
