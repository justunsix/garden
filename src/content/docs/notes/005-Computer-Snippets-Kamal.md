---
filetags: ":kamal:snippets:epubnote:"
id: b5064ecf-6e06-4975-bb8f-5c4098d7403a
title: Kamal Snippets
---

Source: Introduction video and documentation from [Kamal — Deploy web
apps anywhere](https://kamal-deploy.org/)

``` shell

# Example setup of a web application and test run
docker build -t myapp .
docker run -d -p 8080:80 --name myapp myapp

# Initialize kamal in project
kamal init
# Copies kamal configuration files, secrets
# Update config/deploy.yml with
# - service, contain image, container host server
# - SSL settings, DNS, proxy
# - accessory like database and restricted port
# - network

# deploy.yml file can be duplicated and named differently for a second deployment as an override
# the new deploy.htz.yml will reuse original settings and only override settings you choose, for example servers

# Set up host server
kamal setup
# Make sure docker is installed, image is push/pulled, set up proxy
# Requires project git repository is setup and committed
# Set up accessories

# Set up host server given a different config/deploy.htz.yml exists in the project
kamal setup -d htz
# config/deploy.htz.yml can override settings in the default config/deploy.yml

# Deploy changes
kamal deploy
# After project change, build image, push and pull image and deploy

# View logs
kamal logs

# View logs for alternate configuration
kamal logs -d htz

# Go into console
kamal console

```
