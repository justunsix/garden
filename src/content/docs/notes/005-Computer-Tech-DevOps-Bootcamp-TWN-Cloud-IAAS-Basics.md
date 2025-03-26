---
description: Basics of cloud, providers, infrastructure as a service
  (IAAS). Create a virtual server and deploy an app.
filetags: ":devops:nana:bootcamp:cloud:iaas:epubnote:"
id: 9134bbf2-717c-4a7c-a30f-3d4deead8bd1
title: DevOps Bootcamp - Cloud and IaaS Basics
---

Source: My personal notes from DevOps course by TechWorld with Nana

## Introduction to Cloud & Infrastructure as a Service (IaaS)

- Later in course, we'll set up Nexus Artifact Repository, Jenkins Build
  Automation, and Deploy apps on server

- Use case for IaaS: an application needs to run somewhere and use
  Jenkins on a server, can buy servers (on premise) or delegate
  infrastructure and its management to a business (IaaS)

- IaaS service provider examples: AWS, Google Cloud, DigitalOcean,
  Microsoft Azure

## Set Server on DigitalOcean

- Example: Use DigitalOcean for a server due to reduce complexity /
  power compared to AWS
  - Need DigitalOcean account, create Droplet
  - Create Ubuntu Server
- Steps will be similar for other IaaS providers

### Steps

- Choose location close to you
- Choose
  - OS type: Ubuntu Linux
  - Sizing
  - Authentication: SSH, password
    - Users
    - Create/reuse a public SSH key
      - Example: reuse existing public key `cat ~/.ssh/id_rsa.pub`
  - Most defaults should work ok
- When server is up, connect using SSH port 22 using server IP/DNS
  - e.g. =ssh username@1.1.1.1
    - Using SSH key, login will be automatic without password
    - DigitalOcean login: by default, can use root for first time
- Server security: configure a server firewall to only allow access on
  specific ports
  - DigitalOcean: Droplet \> Firewall, Create
    - Inbound rule: Set type SSH, TCP, 22, All sources or range
    - Outbound: default allow all
    - Apply to Droplet(s)

1.  Server Work after SSH

    ``` shell

    # As root
    apt update
    ## JRE 8 for Nexus later
    apt install openjdk-8-jre-headless

    ```

## Deploy and Run Application Artifact on Server

Using
<https://gitlab.com/twn-devops-bootcamp/latest/05-cloud/java-react-example>,
build a JAR file and run it

``` shell

# On local machine
git clone https://gitlab.com/twn-devops-bootcamp/latest/05-cloud/java-react-example
cd java-react-example
gradle build

# Copy to remote server using secure copy
## Set user name and directory as needed
scp build/libs/java-react-example.jar username@1.1.1.1:/username

# On remote server
# See file in username's home
java -jar java-react-example.jar
## or run in background
java -jar java-react-example.jar &
# Observe application start and look for port

# Check app running
ps aux | grep java

# Check ports with active connections
## Install netstat if needed
netstat -lpnt

```

- Using port, add to firewall a new inbound rule, for example: Custom
  type, TCP, 7071, All sources
- Visit application at \<server ip\>:port

## Create and configure a Linux user on a cloud server

Best practice is:

- Create a user for running an application and only give privileges it
  needs to run the application
- Create individual user accounts for people using the server

``` shell

# Create users, set password, name
adduser user1

# Add user to sudo group
usermod -aG sudo user1

# Log in as a the user from other accounts
su user1
# Notice root uses # in prompt, users use $

# Configure SSH key for user1
## Get local using cat ~/.ssh/id_rsa.pub
mkdir .ssh
sudo vim .ssh/authorized_keys
# Paste the public key into the authorized_keys file and save
## From local, you can now ssh using the ssh user1@1.1.1.1

```
