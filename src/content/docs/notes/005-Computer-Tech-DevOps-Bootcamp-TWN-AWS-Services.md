---
description: AWS is a popular IaaS platform. Learn AWS services and
  concepts with demo projects like IAM, regions, VPC private network,
  EC2 virtual servers, CICD with Jenkins, and AWS CLI.
filetags: ":devops:nana:aws:amazon:epubnote:"
id: 1c5571ed-de33-4381-a6f0-f27033cc72a5
title: DevOps Bootcamp - AWS Services
---

Source: My personal notes from DevOps course by TechWorld with Nana

## Introduction to Amazon Web Services (AWS)

- AWS is a collection of many services
  - Based on your use case, you only need to learn a handful of services
    - It is useful to look at service categories like Compute (EC2),
      Storage (S3), Database, Networking & Content Delivery (VPC),
      Security Identity & Compliance (IAM), Containers (Container
      Registry, k8s)
- Scopes of services
  - When creating a new account, user automatically gets an global scope
    account and allows services in regions and availability zones.
  - Scopes and examples:
    - Global: IAM, billing, Route53 DNS
    - Region: S3, VPC, DynamoDB
    - Availability zone (AZ): EC2, EBS, RDS

## Create an AWS Account

- Account provides free tier for some services and 1 year credit for
  some services
- Check pricing of services to verify what you might be charged.
  Recommend set up services and delete them after use / learning

## Identity and Access Management (IAM) - Manage Users, Roles and Permissions

- Using AWS IAM service

  - Who is allowed to access services
  - Management AWS groups

- By default, AWS account creation gives a root users with unlimited
  privileges

- Good practice is create an admin user with less privileges

### Start using IAM

Go to AWS \> Services \> IAM

- Admin user can create users, groups, permissions and still have less
  privileges than root user
- Can have system users for automation like for Jenkins to push images

Definitions:

- Users: people
- User groups: grant access to multiple IAM users
- Roles: granting AWS services access to other services like EC2 access
  to S3
  - Roles must have have policies, also known as permissions
  - Must be assign to AWS service to allow permissions for service
- IAM role vs IAM user
  - Users are human or systems
  - Roles allows AWS services to act like users to do tasks. They are
    needed as policies (permissions) cannot be assigned directly to AWS
    services. AWS services are assigned roles

### Creating an IAM Admin User

- Create user \> Admin
- Provide user access to console and/or programmatic access through
  command line
  - Give both for now
  - Command line can use access keys
- Good practice is create users in group and assign policies/permissions
  in group
- Can also assign permissions directly to user, should be least
  privilege
- After creation, can see console sign in and password

### Log into IAM Admin User

- Sign out of the root account
- Sign into the console with the admin user and reset password

### Programmatic access

- Set up command line access
- Go to the account security credentials through account information at
  top right, find the Command Line Interface (CLI) access key section

## Regions and Availability Zones (AZ)

- Cloud providers have physical data centres hosting servers all over
  the world

- **Region** is a physical location where data centres are clustered

  - For example Singapore, Frankfurt, Sydney

- **Availability Zone** is a discrete data centre allowing recovery from
  failures and data replication

- During cloud resource creation, you choose the region and should be
  close to your usage location of the services

  - For example, choose a region close to your users or distribute

### Virtual Private Cloud (VPC) - Manage Private Network on AWS

- In each region, default VPC is available
  - Inside VPC are Availability Zones (AZ)
  - Components in region will start in VPC
- Services \> Networking & Content Delivery (VPC) \> VPC
- VPC is an isolated network in cloud, spans all AZs (subnets) in that
  region
- Large organizations could have multiple VPs in different regions

Virtual representation of the network infrastructure:

- IPs, network configuration
- Subnets (sub networks) are components of VPC are in AZs
  - Private and public subnet is determined by firewall rules
  - Private
    - Restrictions by firewall rules, no external traffic is permitted
    - Permitted connections inside VPC can be permitted
      - For example, a database
  - Public
    - Firewall allows external traffic on specific ports
      - For example, a web app
  - Subnets (AZs) will have internal private IPs or communication in VPC
    only, not for internet
    - Subnets will have ranges
- Public IPs for components, components will also have private VPC IPs
- Internet Gateway connects the VPC to the internet

Control access:

- Configure firewall to secure components
  - Can be configured at subnets level
    - Network Access Control Lists (NACL)
  - Configuration at components level (like EC2) which will be a
    security group
- IP ranges
- Most simple applications do not need advanced network configuration

## Classless Inter-Domain Routing (CIDR) Blocks Explained

- CIDR blocks (pronounced like cider) are present in AWS subnet screens.
  They are range of IP addresses
- Example: 172.31.32.0/20

What does 172.31.0.0/16 mean?

- We have a range starting at 172.31.0.0 and ending at 172.31.255.255
  - Each dot range has a maximum of 255
- /16 gives 65.536 IP addresses, lower number, more IPs are available
  - IP addresses can be represented as binary digits. The /number
    specifies how many binary digits are fixed
    - /24 means 24 of 32 digits are fixed from the binary representation

### Tools

IP Calculator: <https://mxtoolbox.com/subnetcalculator.aspx>

IP Calculator with binary values: <http://jodies.de/ipcalc>

Calculate sub-CIDR blocks:
<http://www.davidc.net/sites/default/subnets/subnets.html>

### Calculate Sub CIDR block for subnet

- CIDR blocks can be divided to distribute IPs to subnets in VPC

## Introduction to Elastic Compute Cloud EC2 Virtual Cloud Server

This section will use this project:
<https://github.com/techworld-with-nana/react-nodejs-example>

- Goal is deploy web app on EC2 instance: create a virtual server, SSH,
  install Docker, and run Docker container from private Docker Hub,
  configure firewall to reach web app

### Create EC2 Instance

- Services \> Compute \> EC2

- Launch instance

  - Pick configuration like name, meta tags, sizing
  - Use Amazon Linux AMI which is optimized for AWS, note 2023 and later
    images are based on Fedora
  - Use t2.micro (1 CPU, 1 GB RAM)
  - Set up key pair for SSH
    - Can create key pairs in AWS and download private key for local
      storage
      - Use .pem for Linux and MacOS for OpenSSH
      - Use .ppk for Windows like for using PuTTY
  - Set up network
    - Using default VPC
    - Can select subnet / AZ (optional)
    - Need public IP for use with SSH
    - Set firewall rules for instance using a security group
      - Reminder: security group applies to instance level
      - Restrict SSH to "My IP" for now
  - Storage - leave default
  - Verify summary and launch instance

- Go to the EC2 Dashboard to verify EC2 instance was created. See in
  resource details:

  - Networking: VPC and subnet info, IP addresses and DNS names of
    instance
  - Security group
  - Storage
  - Tags

- Left navigation has other resource details and relationships like
  Elastic Block Store for storage

### Connect to EC2 Instance and Set up Docker

``` shell

# Move .pem / .pkk to a secure personal folder and permissions
mv server.pem ~/.ssh
chmod 400 ~/.ssh/server.pem

# Find IP from EC2 > Networking
# Use default AWS EC2 user
ssh -i ~/.ssh/server.pem ec2-user@server_ip

# Note private IP of instace is displayed at prompt

# Update package manager, install Docker
sudo yum update
sudo yum install docker

# Start Docker daemon for container use and confirm
sudo service docker start
ps aux | grep docker

# Add EC2 user to Docker group, logout for change to be done
sudo usermod -aG docker $USER

```

### Run Web Application on EC2

- Use the Docker image generated by
  <https://github.com/techworld-with-nana/react-nodejs-example>
- Push the image to your private repository
- Note image starts node server.js on port 3080

While logged in as ec2-user on EC2 instance

``` shell

# Log into Docker Hub (default for docker login)
docker login

# Get image from private repo and run
docker pull nanatwn/demo-app:1.0
docker images
docker run -d -p 3000:3080 nanatwn/demo-app:1.0
docker ps

```

- AWS console: make app accessible using AWS EC2 instance Networking
  - Change security group, add port TCP 3000, any source
  - Can access app at EC2 IP or DNS with port 3000

## AWS and Jenkins - Deploy to EC2 server from Jenkins Pipeline - CI/CD Part 1

### Project Used

- Java-maven-app (used to create the aws-multibranch-pipeline):
  <https://gitlab.com/twn-devops-bootcamp/latest/09-aws/java-maven-app>
  - Starting code:
    <https://gitlab.com/twn-devops-bootcamp/latest/09-aws/java-maven-app/-/tree/starting-code>
  - Jenkins shared library starting code -
    <https://gitlab.com/twn-devops-bootcamp/latest/09-aws/java-maven-app/-/blob/starting-code/Jenkinsfile-SharedLibrary>

### Previous Learning and Next Steps

- Learned how to build app, image, and push to a private repository
- Want to add to Jenkins flow, deploying the image. Will add EC2 as a
  deployment server
- Connect EC2 to Jenkins using ssh (ssh agent), then docker run on EC2

### Set up Jenkins

- Add SSH Agent plugin
- Add a new multi branch pipeline targeted for AWS
  - In pipeline scope, add SSH credentials for EC2 instance to Jenkins,
    use the `server.pem` you used in previous work
  - For credential kind, select SSH username with private key
    - id: any name
    - username: ec2-user (AWS Default user)
    - private key: enter contents of .pem file directly into form
- Use credential in Jenkins
  - Check the syntax inside Jenkins UI's pipeline job \> Pipeline syntax
    - Search for SSH agent and select
      - Select AWS EC2 credential
      - Generate pipeline script

### Jenkinsfile - Connect to EC2 and Run Docker

- Change Jenkinsfile and add SSH agent in deploy step
- Add shell commands to ssh, suppress warning of host key checking with
  `-o StrictHostKeyChecking=no`
- No need for Docker login as in previous step, we already configured
  docker login on machine

``` Jenkinsfile

stage("deploy") {
    steps {
        script {
          // work
         def dockerCmd = 'docker run -d -p 8080:8080 nanatwn/demo-app:1.0'
         def ec2Instance = "ec2-user@18.184.54.160"
         sshagent(['ec2-server-key']) {
                sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${dockerCmd}"
            }
        }
    }
}


```

- Configure EC2 instance networking firewall / security group to permit
  Jenkins server to access EC2 instance
  - Add Jenkins server IP to source for SSH rule
- Run pipeline to see ssh login and docker commands

### Executing Complete Pipeline

`Jenkinsfile` overview from
<https://gitlab.com/twn-devops-bootcamp/latest/09-aws/java-maven-app>,
jenkins-jobs branch:

- Use shared library with maven app build groovy scripts
- Environment variable with IMAGE<sub>NAME</sub> for use in other stages
- Do build, push of Docker image, then go into EC2 instance to pull/run
  image

### Considerations

- Deploying App using SSH is can used for all servers (cloud, on
  premise, local)
- Connecting to a server and starting 1 Docker container is a simple use
  case, ok for small projects
- For complex setups for 10-100+ containers, will need a container
  orchestration tool like kubernetes (k8s)

### Using Docker Compose to Deploy Application

- For example, an app with web, database, middleware containers
- Approach: copy docker-compose file from code repo to deployment
  server, run docker compose on deployment server

## AWS and Jenkins, Docker Compose - Deploy to EC2 server from Jenkins Pipeline - CI/CD Part 2

- Use `docker-compose.yaml` to run multiple containers
- Approach:
  - Install docker compose on EC2, make docker-compose executable
  - Create `docker-compose.yaml`
  - Update Jenkinsfile to use `docker-compose.yaml` on EC2

### Create docker-compose.yaml

- Start java-maven-app and postgres database
- Use image environment variable
- Java Maven will use port 8080

``` yaml

version: '3.8'
services:
    java-maven-app:
      image: ${IMAGE}
      ports:
        - 8080:8080
    postgres:
      image: postgres:15
      ports:
        - 5432:5432
      environment:
        - POSTGRES_PASSWORD=my-pwd

```

### Update Jenkinsfile

- Secure copy the `docker-compose.yaml` to EC2 and script files to
  ec2-user's home directory
- `server-cmds.sh` will set the image name and start docker compose with
  `export IMAGE=$1 \ docker-compose -f docker-compose.yaml up --detach`
  - `server-cmds.sh` allows executing multiple commands on the server as
    one line in Jenkinsfile

``` Jenkinsfile

stage("deploy") {
    steps {
        script {
            echo 'deploying docker image to EC2...'
             def shellCmd = "bash ./server-cmds.sh ${IMAGE_NAME}"
            def ec2Instance = "ec2-user@18.184.54.160"
             sshagent(['ec2-server-key']) {
                sh "scp server-cmds.sh ${ec2Instance}:/home/ec2-user"
                sh "scp docker-compose.yaml ${ec2Instance}:/home/ec2-user"
                sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${shellCmd}"
            }
        }
    }
}

```

- Check in changes and run pipeline to see deploy stage completion

## AWS and Jenkins, Complete Pipeline - Deploy to EC2 server from Jenkins Pipeline - CI/CD Part 2

- Goal: set the Docker image name dynamically

- Add the version environment variable from Maven build at beginning of
  pipeline

- Reuse the environment variable IMAGE<sub>NAME</sub> in the other
  stages

- Commit version updates at end of pipeline

- Recommend in future, extract groovy script into groovy functions
  without details in `Jenkinsfile`

``` Jenkinsfile

#!/usr/bin/env groovy

library identifier: 'jenkins-shared-library@master', retriever: modernSCM(
    [$class: 'GitSCMSource',
    remote: 'https://gitlab.com/twn-devops-bootcamp/latest/09-aws/jenkins-shared-library.git',
    credentialsID: 'gitlab-credentials'
    ]
)

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage('increment version') {
            steps {
                script {
                    echo 'incrementing app version...'
                    sh 'mvn build-helper:parse-version versions:set \
                        -DnewVersion=\\\${parsedVersion.majorVersion}.\\\${parsedVersion.minorVersion}.\\\${parsedVersion.nextIncrementalVersion} \
                        versions:commit'
                    def matcher = readFile('pom.xml') =~ '<version>(.+)</version>'
                    def version = matcher[0][1]
                    env.IMAGE_NAME = "$version-$BUILD_NUMBER"
                }
            }
        }
        stage('build app') {
            steps {
                echo 'building application jar...'
                buildJar()
            }
        }
        stage('build image') {
            steps {
                script {
                    echo 'building the docker image...'
                    buildImage(env.IMAGE_NAME)
                    dockerLogin()
                    dockerPush(env.IMAGE_NAME)
                }
            }
        }
        stage("deploy") {
            steps {
                script {
                    echo 'deploying docker image to EC2...'

                    def shellCmd = "bash ./server-cmds.sh ${IMAGE_NAME}"
                    def ec2Instance = "ec2-user@18.184.54.160"

                    sshagent(['ec2-server-key']) {
                        sh "scp server-cmds.sh ${ec2Instance}:/home/ec2-user"
                        sh "scp docker-compose.yaml ${ec2Instance}:/home/ec2-user"
                        sh "ssh -o StrictHostKeyChecking=no ${ec2Instance} ${shellCmd}"
                    }
                }
            }
        }
        stage('commit version update'){
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'gitlab-credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                        sh 'git remote set-url origin https://$USER:$PASS@gitlab.com/twn-devops-bootcamp/latest/09-AWS/java-maven-app.git'
                        sh 'git add .'
                        sh 'git commit -m "ci: version bump"'
                        sh 'git push origin HEAD:jenkins-jobs'
                    }
                }
            }
        }
    }
}

```

### Container Orchestration

- For more complex applications with more containers, use kubernetes

## Introduction to AWS Command Line Interface (CLI) - Part 1

### See Also

1.  Resources

    - [AWS CLI - Getting
      Started](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

    1.  CLI Commands

        - [AWS CLI Commands used in this chapter - CLI Command
          twn-devops-bootcamp on
          GitLab](https://gitlab.com/twn-devops-bootcamp/latest/09-aws/cli-commands/-/blob/main/aws-cli-commands.md?ref_type=heads)

### Introduction

- In previous chapters, we used AWS UI console to create and setup EC2
  instance
- AWS CLI allows programmatic access to manage AWS resources
- Benefits of using the CLI are:
  - Automation and speed
  - Efficient batch operations
  - Version control
  - Reproducible

### Using the CLI

- Set up access key and secret,
- Check resources
- Create an EC2 instance, new security group, create new SSH key pair

``` shell

# * AWS Configure - set login information

# going forward use
aws configure sso

# aws configure
# aws configure set aws_access_key_id  "YOUR_ACCESS_KEY_ID"
# export AWS_ACCESS_KEY_ID="YOUR_ACCESS_KEY_ID"
# export AWS_SECRET_ACCESS_KEY= "YOUR_SECRET_ACCESS_KEY"

# * AWS EC2 Service

aws ec2 help

## List Security groups
aws ec2 describe-security-groups --group-ids "YOUR_GROUP_ID"
## List VPCs
aws ec2 describe-vpcs
aws ec2 create-security-group --group-name "YOUR_GROUP_NAME" --description "ENTER_DESCRIPTION" --vpc-id "YOUR_VPC_ID"
aws ec2 describe-subnets
aws ec2 describe-instances
aws ec2 describe-instances --filters Name="ENTER_FILTER_NAME",Values="ENTER_VALUE" --query "Reservations[].Instances[].InstanceId"
aws ec2 run-instances --image-id "YOUR_AMI_ID" --count "ENTER_NUMBER" --instance-type "YOUR_INSTANCE_TYPE" --key-name "YOUR_KEY_NAME" --security-group-ids "YOUR_SECURITY_GROUP_ID" --subnet-id "YOUR_SUBNET_ID"
aws ec2 authorize-security-group-ingress --group-id "YOUR_GROUP_ID" --protocol "ENTER_PROTOCOL" --port "YOUR_PORT_NUMBER" --cidr "YOUR_CIDR_BLOCK"
aws ec2 create-key-pair --key-name "YOUR_KEY_NAME" --query "ENTER_QUERY" --output text > "YOUR_PEM_FILE"

```

## Introduction to AWS Command Line Interface (CLI) - Part 2

- Can use aws \<command\> describe- –filters to list components and
  filter on resources

- Create groups as needed like for developers, builders

- `Arn` means Amazon Resource Name

- Below creates and manages a group, user and group policy / permissions

  - Create the user login profile and give them access to change and get
    password using a policy document

- Delete resources in the same order

``` shell

# * AWS IAM Service

aws iam help

# Create and manage group
aws iam create-group --group-name "YOUR_GROUP_NAME"
aws iam create-user --user-name "YOUR_USER_NAME"
aws iam add-user-to-group --user-name "YOUR_USER_NAME" --group-name "YOUR_GROUP_NAME"
aws iam get-group --group-name "YOUR_GROUP_NAME"
aws iam attach-user-policy --user-name "YOUR_USER_NAME" --policy-arn "YOUR_POLICY_ARN"
aws iam list-policies --query `Policies[?PolicyName=="`YOUR_POLICY_NAME`"].Arn` --output text
aws iam attach-group-policy --group-name "YOUR_GROUP_NAME" --policy-arn "YOUR_POLICY_ARN"
aws iam list-attached-group-policies --group-name "YOUR_GROUP_NAME"

# Allow user to login to web console, set their password
aws iam create-login-profile --user-name "YOUR_USER_NAME" --password "YOUR_PASSWORD" --password-reset-required
aws iam get-user --user-name "YOUR_USER_NAME"
aws iam create-policy --policy-name "YOUR_POLICY_NAME" --policy-document "YOUR_FILE_NAME"
aws iam create-access-key --user-name "YOUR_USER_NAME"

```

## AWS and Infrastructure as Code (IAC) Terraform Preview

- Use case: Many commands are executed to set up the environment. It is
  difficult to understand an overview of all resources we created.
- Recommend to use automation tools to keep track of history and
  automate changes. Meet needs of:
  - Versioning
  - Consistency
  - Automation
- Can use Terraform to provision infrastructure, create and management
  resources

## Container Services on AWS Preview

- Use case:
  - Past work was creating an EC2 instance to run containers with Docker
  - How to scale to many containers?
- AWS services to support use case:
  - Container registry
  - Container service
  - Elastic Kubernetes Service (EKS)
  - Red Hat OpenShift Service on AWS
