---
description: Understand build automation and continuous integration (CI)
  and implementation in Jenkins with pipelines
id: 094b261a-e926-4e2e-973d-7e1ab180b845
title: DevOps Bootcamp - CICD with Jenkins
---

Source: My personal notes from DevOps course by TechWorld with Nana

## Overview

- About build automation
- Deploy Jenkins
- Install and use build tools
- Create Freestyle job
- Docker in Jenkins, pull, build and push
- Build pipelines, tests with Jenkinsfile and manage and deploy apps
- Build multibranch pipeline
- Configure automated versioning
- Jenkins shared repository

## Introduction to Build Automation

- Use case: developer checks in code in repo, do tests and push to build
  repository, publish new release
  - If done manually, would take much of developer time
- Use a dedicated server to do the test and build with push to
  repository, deploy to server
  - For example, use tools like docker, npm, gradle
  - Trigger automatically
  - Complete process is called build automation

### Jenkins can do build automation

- Has user interface

- Has tools

  - docker
  - Store credentials to repositories

- Can run tests, build artifacts, deployment

  - Example: npm test, gradle test, mvn test
  - Test environment like database

- Automatic triggers and scheduling

- Send notifications

- Will integrate with Docker, build tools, repositories, deployment
  servers

- Example use case: Code hosted on Gitlab, have Java Gradle app, build
  Docker images, push to Nexus, deploy to AWS EC2

  - Jenkins plugins can integrate with each item

## Install Jenkins

- Only needs to be installed once, set up credentials to services to
  integrate

- Install Jenkins on a server, example DigitalOcean Droplet

  - Option is install directly on server or Jenkins official image in
    Docker container

- Create 2 cpu, 4 GB RAM, 80 GB Droplet with Ubuntu server

  - Add firewall rules
    - port 22 SSH
    - port 8080 for Jenkins

On new server:

``` shell

# Install Docker
sudo apt update
sudo apt install docker.io

# Run Jenkins
# Port 8080 for web access
# Port 50000 for master and worker nodes communications
# Use volume
docker run -p 8080:8080 -p 50000:50000 -d \
-v jenkins_home:/var/jenkins_home \
--restart=on-failure jenkins/jenkins:lts-jdk17

docker exec -it container_id bash
# Get to admin password
# can also find on the server host with docker inspect jenkins_home
cat /var/jenkins_home/secrets/initialAdminPassword

```

- Access Jenkins on server<sub>ip</sub>:8080
- Initialize Jenkins:
  - Use password on container
- Install suggested plugins
- Create first admin user

## Introduction to Jenkins UI

- User roles:
  - Administrator - manage Jenkins system, users, cluster, nodes,
    install plugins, backup Jenkins data
    - See Manage Jenkins menu
  - User - dev / ops teams creating jobs to run workflows
    - See New Item in main menu

## Install Build Tools in Jenkins

- Create jobs to automate apps workflow, like with Java Maven project,
  Node app
  - Tests: mvn test, npm test
  - Build archive file: mvn package, npm pack
- Need tools installed on Jenkins
  - Option: Install plugin using UI
  - Option: Install tools directly on Jenkins server
- Configure plugin for Maven
  - Manage Jenkins \> Plugins
  - Manage Jenkins \> Tools
    - Set/install versions with installers or other options
- Install npm and node in Jenkins containers instead of using plugins

``` shell

# Enter Jenkins container as root to make changes to Jenkins
docker exec -u 0 -it container_id bash

# Check Linux distro
cat /etc/issue

apt update
apt install curl

# Install nodejs and npm for that distro
curl ...
apt install nodejs

# Verify node and npm install
node -v
npm -v

```

## Jenkins Basics Demo - Freestyle Job

Repositories for this section:

- Starting code:
  <https://gitlab.com/twn-devops-bootcamp/latest/08-jenkins/java-maven-app/-/tree/starting-code>

- Final code:
  <https://gitlab.com/twn-devops-bootcamp/latest/08-jenkins/java-maven-app>

### Creating a Job

- Main Page \> New Item
- Create new job, Freestyle job
  - Simple setup for small scale project
  - In Production, usually use pipeline and multi-branch pipeline
- Add build steps
  - Execute shell command
    - npm –version
  - Invoke top-level Maven target
    - Choose maven version
    - Goals (any mvn command): –version
- See job details
  - Build
  - Console output
    - Notice where the mvn program is stored

Considerations:

- Shell command is more flexible
- Plugin asks for specific variables
- Plugins must be installed and configured (like what to install) first
  - For example, can install NodeJS plugin, configure it and have it
    available for jobs

### Job - Configure Source Code Management - Git Repository option

Select job created before

- Set repo URL
- Credentials like username/password, keys
- Branches

When running job will:

- Check out code
- Perform actions on it

### Storage

- Job information stored on Jenkins in
  /var/jenkins<sub>home</sub>/jobs/names-of-jobs
- Repository information like git checkouts is stored at
  /var/jenkins<sub>home</sub>/workspace/names-of-jobs

### Job, using the Repository

- Change branch to \*/jenkins-jobs
- Update shell command to

``` shell

chmod +x  ./freestyle-build/sh
./freestyle-build/sh

```

### Create a job to build: java-maven-build

- Configure Source code Management
  - java-maven-app
- Change branch to \*/jenkins-jobs
- Set up maven plugin with
  - Goal: test
  - Goal: package
- Run job
- Changes will be made in
  /var/jenkins<sub>home</sub>/jobs/java-maven-build and
  /var/jenkins<sub>home</sub>/workspace/java-maven-build

## Docker in Jenkins

### Make Docker available in Jenkins

- Mount volumes of host's Docker runtime into Jenkins container so
  Docker is available in Jenkins

``` shell

# Stop existing container
docker stop jenkins_id

# Mounting /var/run/docker.sock (socket) will
# enable Docker in container
# Reuse existing jenkins_home
docker run -p 8080:8080 -p 50000:50000 -d \
-v jenkins_home:/var/jenkins_home \
-v /var/run/docker.sock:/var/run/docker.sock
--restart=on-failure jenkins/jenkins:lts-jdk17

# Go to container
# Install docker in Jenkins in container
docker exec -u 0 -it jenkins_id bash
curl https://get.docker.com/ > dockerinstall && chmod 777 dockerinstall && ./dockerinstall

# Add rw permissions to Jenkins user and others to socket
chmod 666 /var/run/docker.sock

```

- docker commands are not available in Execute shell job tasks

### Building Docker Image

- Add docker command in java-maven-build job after mvn package task
- Add execute shell
  - `docker build -t java-maven-app:1.0 .`
- `docker images` in container will show image is built

### Push to Docker Repository

- Will use a private repository on Docker Hub
- Manage Jenkins \> Credentials \> system \> Global credentials
  - Add new Docker Hub username/password credential
- Add to job use secret text or file
  - Use username and password (separated)
    - Define variables
      - USERNAME
      - PASSWORD
    - Choose credentials

Execute shell tasks:

``` shell

# add to tag the docker hub user
docker build -t dockerhubuser/java-maven-app:1.0 .
# login into docker hub, default for docker
# so no need to define repository
# pipe password into command
echo $password | docker login -u $username --password-stdin
docker push dockerhubuser/java-maven-app:1.0

```

### Push to Nexus Repository

1.  Set up Docker to allow insecure repositories

    - Since Nexus is running on HTTP, need to allow insecure repository
      protocol in Jenkins
    - Configure `/etc/docker/daemon.json` on host of container since
      host has the docker runtime

    ``` json

    {
        "insecure-registries":["nexus_ip_address:port"]
    }

    ```

    - Restart docker on host to apply config, it will stop all
      containers
      - `systemctl restart docker`
    - Restart Jenkins container on host
    - Re-apply Jenkins permissions to /var/run/docker.sock inside
      container as root `chmod 666 /var/run/docker.sock`

2.  Set up Job, Push to Repository

    - Add credentials for Nexus with username with password
    - Configure java-maven-build job, choose nexus repository
      credentials in secrets task

    ``` shell

    # Reference Nexus
    docker build -t nexus_ip:port/java-maven-app:1.0 .
    echo $password | docker login -u $username --password-stdin nexus_ip:port
    docker push nexus_ip:port/java-maven-app:1.0

    ```

## Freestyle to Pipeline Job

History:

- Previous common practice was freestyle job does a single job like
  build, test, package, push,
- Users could chain these freestyle jobs into a pipeline.
- Limitations/background on chained freestyle jobs:
  - Configuration using UI instead of scripting
  - Limited to Input Fields of Plugins
  - Not recommended for multi-stage workflows
- They are still good for learning and understanding basics of plugins
  and using tools

Recommendation:

- Move from UI to scripted infrastructure as code (IAC)
  - For CICD
  - Scripting - pipeline as code

## Introduction to Pipeline Job

- Go to: New Item \> Pipeline
- Connect pipeline to source code management (SCM)
  - Choose pipeline script from SCM
    - Can be script from SCM - best practice is have pipeline script in
      git repository
      - Choose branch \*/jenkins-jobs
      - Script path: Jenkinsfile
  - For inline pipeline written inside Jenkins, checkbox of "Use Groovy
    Sandbox" means using a restricted set of Groovy use without need for
    Jenkins admin approval
  - Pipeline is written in script using Groovy, language similar to Java
- Create a Jenkinsfile in repo, Jenkinsfile is standardized name
  - Written in Groovy
  - Scripted:
    - First syntax
    - Groovy engine
    - Scripting capabilities
    - Learning required
  - Declarative
    - Easier to use, less flexible than scripted
    - pipeline - top level
    - agent - where to execute
    - stages - tasks
      - Can call functions

Example stage

``` Jenkinsfile

pipeline {

  agent any
  stages {
    stage("build") {
      echo 'building the application'
    }
  }
}

```

Advantages of scripted pipeline job vs chained freestyyle jobs:

- Scripted capabilities
  - Conditionals
  - Loops
  - Parallel tasks
  - Set variables
- Less plugin management
- Each job has multiple stages, though no need to chain jobs

## Jenkinsfile Syntax

- Conditions
- Variables
- Get Jenkin's environment or plugin variables like credentials
- Post job execution step
- Environment variables
  - There are builtin variables, see at
    <https://jenkins_instance:8080/env-vars.html>
- Input parameters - use case: user can select choices, like which
  environment to deploy to or which version to use
  - Will prompt user within Jenkins to set parameter

``` Jenkinsfile

def gv

// Groovy script to check git changes
CODE_CHANGES = getGitChanges()

  pipeline {
    agent any
      parameters {
        string(name: 'VERSION', defaultValue: '', description: 'version to deploy to prod')
          choice(name: 'VERSION_TO', choices: ['1.1', '1.2', '1.3'], description: "Version to keep")
          booleanParam(name: 'executeTests', defaultValue: true, description: 'where to run tests')
      }
    // Environment variables defined here
    // can be used in pipeline
    environment {
      NEW_VERSION = getNewVersion()
        // Use Jenkins credentials plugin
        // and binding plugin for variables
        SERVER_CREDENTIALS = credentials('credentials_id_in_jenkins')
    }
    // Build tools like mvn, gradle, jdk
    // Requires pre-configured in Jenkins Tools
    tools {
      maven 'Maven'
    }
    stages {
      stage("init") {
        steps {
          script {
            gv = load "script.groovy"
          }
        }
      }
      stage("build jar") {
        // Check for code changes example
        when {
          expression {
            BRANCH_NAME == 'dev' && CODE_CHANGES == true
          }
        }
        steps {
          echo 'building application'
            // reference variable
            echo "building version $(NEW_VERSION)"
        }
        steps {
          script {
            gv.buildJar()

          }
        }
      }

      stage ("test") {
        where {
          expression { params.executeTests }
        }
        steps {
          sh "Do tests"
        }
      }
      stage ("test_branch") {
        // Conditionals
        when {
          expression {
            // Built in Jenkins variable
            BRANCH_NAME == 'dev' || BRANCH_NAME == 'master'
          }
        }
      }

      stage("build image") {
        steps {
          script {
            gv.buildImage()
          }
        }
      }

      stage("deploy") {
        // User selects a choice
        input {
          message "Select the environment to deploy to"
            ok "Environment selected"
            parameters {
              choice(name: 'ENV_TARGET', choices: ['dev', 'uat', 'prod'], description: "Target environment to deploy to")

            }

        }
        steps {
          // Use crendentials only in stage it is used
          withCredentials([
              usernamePassword(credentials: 'credentials_id_in_jenkins', usernameVariable: USER, passwordVariable: PWD)
          ])
            sh "some script ${USER} ${PWD}"
            sh "deploying ${VERSION}"
            // To assign variables to input, use in script section or file
            script {
              echo "Deploying to ${ENV_TARGET}"
                env.ENV_T2 = input message: "Select 2nd environment to deploy to", ok "Done", parameters: [choice(name: 'ENV_TARGET', choices: ['dev', 'uat', 'prod'], description: "2nd target environment to deploy to")]
                gv.deployApp()
            }
        }
      }
    }
    // After stages, can define =post= for steps at end of job,
    // can always be executed regardless of job status
    post {
      always {
        //
      }
      success {
        //
      }
      failure {
        //
      }


    }

```

### Groovy Scripts

- Good practice is to extract script details to a groovy script

Full Jenkins file with multiple stages using a script.groovy with
functions in it:

- Uses maven tools, so mvn commands are available in each stage
- In script, use credentials defined in Jenkins

``` Jenkinsfile

def gv

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        // Load groovy script defined at top level
        // All environment variables will be accessible in script
        stage("init") {
            steps {
                script {
                    gv = load "script.groovy"
                }
            }
        }
        stage("build jar") {
            steps {
                script {
                    gv.buildJar()

                }
            }
        }

        stage("build image") {
            steps {
                script {
                    gv.buildImage()
                }
            }
        }

        stage("deploy") {
            steps {
                script {
                    gv.deployApp()
                }
            }
        }
    }

}

```

Groovy script with functions

``` groovy

def buildJar() {
    echo 'building the application...'
    sh 'mvn package'
}

def buildImage() {
    echo "building the docker image..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        sh 'docker build -t nanatwn/demo-app:jma-2.0 .'
        sh 'echo $PASS | docker login -u $USER --password-stdin'
        sh 'docker push nanatwn/demo-app:jma-2.0'
    }
}

def deployApp() {
    echo 'deploying the application...'
}

return this

```

- When looking at Jenkins job output, view:
  - Outputs
  - Status
  - Stage status and messages
  - Can replay build and change script without changing source code

## Create complete pipeline

See `Jenkinsfile` and `script.groovy` from
<https://gitlab.com/twn-devops-bootcamp/latest/08-jenkins/java-maven-app/-/tree/master?ref_type=heads>

## Intro to Multibranch pipeline

- Previous section was a pipeline built for a specific branch
- Usually teams have git repositories with multiple branches where work
  is happening

Common needs:

- Want to have tests run on every branch
- Deployments use main branch
  - Test, build, and deploy
- Pipelines for all branches

### Jenkins Multibranch pipeline

- Can use a multbranch pipeline for above needs
- New item: my-multi-branch-pipeline or type multibranch pipeline
  - Add git repository with script path `Jenkinsfile`
  - Can add regex filter for branch names, leave .\* to match all while
    pipeline will detect branches
  - Jenkins will scan for a `Jenkinsfile` in each branch, if not
    present, it will skip the branch, then run them. Most branches in
    development will eventually have a `Jenkinsfile`

### Branch based logic for Multibranch Pipeline

- One branch likely has the Jenkinsfile to be used for most other
  branches
- Logic is:
  - Test is used for all branches
  - Build and deploy is only for main - need to add conditionals, see
    example below
- In Jenkins job detail, can scan repo for new branches for pipeline
  runs on them

``` Jenkinsfile

def gv

pipeline {
  agent any
    tools {
      maven 'Maven'
    }
  stages {
    stage("init") {
      steps {
        script {
          gv = load "script.groovy"
        }
      }
    }
    // Run tests on all branches
    stage("test") {
      steps {
        script {
          gv.testApp()

        }
      }

    }
    // Only build, deploy when in main branch
    stage("build") {
      when {
        expression {
          BRANCH_NAME == "main"
        }
      }
      steps {
        script {
          gv.build()

        }
      }
    }

    stage("build image") {
      when {
        expression {
          BRANCH_NAME == "main"
        }
      }
      steps {
        script {
          gv.buildImage()
        }
      }
    }

    stage("deploy") {
      when {
        expression {
          BRANCH_NAME == "main"
        }
      }
      steps {
        script {
          gv.deployApp()
        }
      }
    }
  }
}

```

## Jenkins Jobs Overview

- Previous modules looked at 3 types of Jenkins jobs
  - Freestyle: individual jobs executed stages
  - Pipeline: staged tasks
  - Multi-branch pipeline: pipelines can be run for each branch
- Jobs can be restarted, restarted from a stage, re-run with modified
  script
  - Jobs can be replayed from a later stage, skipping previous stages

## Credentials in Jenkins

- Previously, in Manage Jenkins \> Credentials, put in credentials for
  use in jobs
- Credentials plugin allows them to be managed centrally under
  Credentials \> System \> Global credentials
- Scopes:
  - System - only available on Jenkins server, not Jenkins job
  - Global - can be used everywhere
  - Credentials can also be created at job level using a folder plugin
    with scope just for the job, for example used just for a project
- Kind:
  - Username password, file, certificate, text, SSH user with private
    key
- ID: name will be used in jobs

## Jenkins Shared Library

- Starting-code:
  <https://gitlab.com/twn-devops-bootcamp/latest/08-jenkins/jenkins-shared-library/-/tree/starting-code>
- Final code:
  <https://gitlab.com/twn-devops-bootcamp/latest/08-jenkins/jenkins-shared-library>

### Use Cases

- Use case 1: an application has many micro services and each service is
  like an app and needs its own pipeline
  - Result will be many pipelines for different projects
  - Let's say services, some of Java Maven projects, many of these
    services could share the same logic
  - How to avoid duplication?
- Use case 2: organization has multiple projects and need pipelines with
  different technologies
  - Some logic of pipelines could be same like push to artifact
    repository or devops user messaging
  - Avoid duplicating common stages

### Benefits of Jenkins Shared Library

- Jenkins Shared Library
  - Extension to the pipeline
  - Has own repository
  - Written in Groovy
  - Each project can reference shared library function

Advantages:

- Code Reuse
- Maintainence
- Consistency and standards
- Faster pipeline creation
- Collaboration

### Create the Shared Library (SL)

Overview:

- Create a repository
- Write Groovy code
- Make library available globally or for project
- Use library in Jenkinsfile

Work:

- Create new project
- Files/folders:
  - vars/
    - Functions that we call from Jenkinsfile
    - Each function in its own groovy file
  - src/
    - Utilities, helper
  - resources/
    - Use external libraries
    - Non groovy files like json, SQL, shell scripts
- `#!/usr/bin/env groovy` will help editor know the file is a groovy
  script

vars/buildJar.groovy

``` groovy

#!/usr/bin/env groovy

def call() {
  echo 'building application'
  sh 'mvn package'
}

```

vars/buildImage.groovy

``` groovy

#!/usr/bin/env groovy

def call() {
      echo "building the docker image..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        sh 'docker build -t nanatwn/demo-app:jma-2.0 .'
        sh 'echo $PASS | docker login -u $USER --password-stdin'
        sh 'docker push nanatwn/demo-app:jma-2.0'
    }

```

- Push new git repository

### Make SL available

- Can make library globally available, like for use in an organization
  - Manage Jenkins \> System \> Global Pipeline Libaries
  - Add library
    - Default version: can be branch name like main, commit hash, tag
      name
      - Good practice is use a tag or version to keep library consistent
    - Set up git repository information

### Use the SL in Jenkinsfile

- Call the build and build image functions in the below Jenkinsfile

``` Jenkinsfile

#!/usr/bin/env groovy

// Import library
@Library('name-of-global-shared-library-in-jenkins')

// Groovy script variable definition
def gv

pipeline {
  agent any
    tools {
      maven 'Maven'
    }
  stages {
    stage("init") {
      steps {
        script {
          gv = load "script.groovy"
        }
      }
    }
    // Run tests on all branches
    stage("test") {
      steps {
        script {
          gv.testApp()

        }
      }

    }
    // Only build, deploy when in main branch
    stage("build") {
      when {
        expression {
          BRANCH_NAME == "main"
        }
      }
      steps {
        script {
          // Call SL function
          buildJar()
        }
      }
    }

    stage("build image") {
      steps {
        script {
          // Call SL function
          buildImage()
        }
      }
    }

    stage("deploy") {
      when {
        expression {
          BRANCH_NAME == "main"
        }
      }
      steps {
        script {
          gv.deployApp()
        }
      }
    }
  }
}

```

### Using Parameters in Shared Library (SL)

- For buildImage function, want to make the image and tag as paramaters
- \$variable must be in double quotes for groovy script

vars/buildImage.groovy

``` groovy

#!/usr/bin/env groovy

def call(String imageName) {
      echo "building the docker image..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        sh "docker build -t $imageName ."
        sh 'echo $PASS | docker login -u $USER --password-stdin'
        sh "docker push $imageName" 
    }

```

``` Jenkinsfile

#!/usr/bin/env groovy

// Code

    stage("build image") {
      steps {
        script {
          // Call SL function
          buildImage 'nanatwn/my-app:3.0'
        }
      }
    }

// Code
```

### Extract Logic into Groovy Classes

- Use case: want to put individual commands or logical tasks into
  separate Groovy classes that needs to reuse things like credentials

``` groovy

#!/usr/bin/env groovy

// src/com/example/Docker.groovy

package com.example

// Serializable allows saving of state
class Docker implements Serializable {

  def script 
    Docker(script) {
      this.script = script
    }

  def buildDockerImage(String imageName) {
    script.echo "building the docker image"
      script.withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        script.sh "docker build -t $imageName ."
          script.sh "echo '${script.PASS}' | docker login -u '${script.USER}' --password-stdin"
          script.sh "docker push $imageName" 
      }
  }

  // src/buildImage.groovy
  // Calls Docker class
  import com.example.Docker

    def call(String imageName){
      return new Docker(this),buildDockerImage(imageName)
    }

```

- src/ files can be used in groovy pipelines, but it is recommended to
  use the var/ function files

### Split Docker Build Image

- In Docker class, create functions for separate Docker steps
- These steps can be set in groovy script functions
- Functions are called from Jenkinsfile

``` groovy

#!/usr/bin/env groovy

// src/com/example/docker.groovy

package com.example

// serializable allows saving of state
class docker implements serializable {

  def script
    docker(script) {
      this.script = script
    }

  def builddockerimage(string imagename) {
    script.echo "building the docker image"
      script.sh "docker build -t $imagename ."
  }

  def dockerlogin() {
    script.echo "building the docker image"
      script.withcredentials([usernamepassword(credentialsid: 'docker-hub-repo', passwordvariable: 'pass', usernamevariable: 'user')]) {

      }

    def dockerpush(string imagename) {
      script.sh "docker push $imagename"

    }
  }

  // src/dockerlogin.groovy
  import com.example.docker

    def call(string imagename){
      return new docker(this).dockerlogin()
    }

  // src/dockerpush.groovy
  import com.example.docker

    def call(string imagename){
      return new docker(this).dockerpush(imagename)
    }

  // src/buildimage.groovy
  // calls docker class
  import com.example.docker

    def call(string imagename){
      return new Docker(this).buildDockerImage(imageName)
    }

  // Jenkinsfile

  // Code

  stage("build and push image") {
    steps {
      script {
        // Call SL functions
        buildImage 'nanatwn/my-app:3.0'
          dockerLogin
          buildPush 'nanatwn/my-app:3.0'

      }
    }
  }

  // Code

```

### Project Scoped Shared Library (SL)

- Use case: Only using a SL within a project
- SL is imported as a specific repository in Jenkinsfile

``` groovy

#!/usr/bin/env groovy

  // Project specific shared library
  // Set library name and repository location
  // Use credentials stored in Jenkins
  library identifier: "jenkins-shared-library-at-project-level@main", retriever: modernSCM(
  [$class: 'GitSCAMSource', 
  remote: 'https://gitlab.com/twn-devops-bootcamp/latest/08-jenkins/java-maven-app',
  credentialsId: 'gitlab-credentials'])

  // Jenkins setup and stages

```

## Webhooks - Trigger Pipeline Jobs automatically

- Previous work, Jenkins jobs were manually started
- Use case: Trigger jobs automatically when a certain change happens in
  git
  - Example: Need to have git provider, for example GitLab, GitHub,
    Bitbucket to notify Jenkins to start job
  - Manual deploys still available like deploy to production at specific
    time
  - Jobs can be scheduled, good for long running tests or work or
    managing Jenkins server load

### Configure automatic triggering of Jenkins Job for Pipeline Job

- Goal is when there are changes in git, a pipeline job automatically
  runs

- Need to configure Jenkins with GitLab plugin to add build triggers

- System \> Manage Jenkins \> Gitlab to configure

  - Set GitLab connection and URL
  - Authentication - API token with Personal Access Token from your
    account for Jenkins
    - API permissions needs "api" scope

- After GitLab connection is set, it will be available in pipelines and
  freestyle jobs

  - Under Build Trigger
    - Can set up webhook with Jenkins URL for GitLab to notify Jenkins
      of events like push events
  - In GitLab repo like java-maven-app \> Integrations \> Jenkins to
    configure trigger with Jenkins URL
    - Project name: same as pipeline name in Jenkins
    - User/password is for Jenkins
    - Test connection with test settings in GitLab

- After a push to the repository, Jenkins will automatically do a build

1.  Multi branch Pipeline and Triggers

    - The set up works for the pipeline, but the multi branch pipeline
      requires a different set up
    - In Jenkins, need to install Multibranch Scan Webhook trigger
      plugin
      - Select a multi branch pipeline \> Build Configurtion \> Scan
        Multibranch pipeline trigger
        - Can scan periodically or scan by webhook for pushes
        - Choose a token name, the token can be used to notify Jenkins
        - Note down the URL provided by the plugin information panel
          from the ? button
    - In GitLab repo \> Webhooks
      - Set URL with Jenkins URL with token from the multi branch
        pipeline
      - Set which events to trigger, for now select push events on all
        Branches
    - Now push events in repo in a branch will trigger build for that
      branch in Jenkins

## Versioning Applications - Dynamically Increment Application version in Jenkins Pipeline - Part 1

### Concepts of Versioning

- Application version will increase

- Version is maintained in package manager tool file, like:

  - grade: build.gradle
  - npm, yarn: package.json
  - maven: pom.xml

- Software version is decided your application team

- Application enhancements and fixes will result in new versions

- Four parts of version: 4.2.1 optional information

  - 4.x.x - Major - big changes, can be breaking, not backward
    compatible
  - x.2.x - Minor - New changes, fixes, features, though should be
    backward compatible
  - x.x.1 - Path - small change like bug fix, no API changes
  - x.x.x-suffix - More information like snapshot, release candidate,
    release. These given more information about version

- Application team can increment version like in pom.xml - good practice
  is do it automatically in build automation

- Build pipeline can manage versioning

- Build tools have commands to increment version

### Demo: Java Maven App versioning

Use mvn to manage version

- Parse the version of major, minor, and patch. parse-version will
  provide ability to increment different parts of the version
- Set the new version using a parameter -DnewVersion
- Increment a patch version
  - There are options to use parsedVersion.nextMajorVersion and
    parsedVersion.nextMinorVersion
- Commit changes to pom.xml

``` shell

# Patch increment
mvn build-helper:parse-version versions:set \
-DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.minorVersion}.\${parsedVersion.nextIncrementalVersion} version:commit

# Developer is merging a feature branch and wants to increment the minor version
mvn build-helper:parse-version versions:set \
-DnewVersion=\${parsedVersion.majorVersion}.\${parsedVersion.nextMinorVersion}.\${parsedVersion.incrementalVersion} version:commit

```

- See mvn does build and updates the pom.xml and indicates the new
  version in output

- See
  [https://www.mojohaus.org/build-helper-maven-plugin/parse-version-mojo.html](https://www.mojohaus.org/build-helper-maven-plugin/parse-version-mojo.html)
  for information on build-helper:parse-version

- Other package managements/tools follow a similar concept

### Integrating Versioning in Jenkinsfile

- Target is to increment version before mvn package, docker build and
  push, and other stages
- Build will update the app's and Dockerfile version
- Commit version changes to the git repo

``` Jenkinsfile

def gv

pipeline {
    agent any
    tools {
        maven 'Maven'
    }
    stages {
        stage('increment version') {
            steps {
                script {
                  // Note the escape of the $
                  // image tag will from come from app version
                  // version is matched from the pom.xml
                  // matcher will be an array of arrays
                  // matcher[0] is match and matcher[0][1] will be version number
                  // $BUILD_NUMBER is the Jenkins' build number
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
        // mvn package will use new version from above
        // mvn clean will remove old JAR files, target folder
        // and only latest version will remain
        stage('build app') {
            steps {
                script {
                    echo 'building the application...'
                    sh 'mvn clean package'
                }
            }
        }
        stage('build image') {
            steps {
                script {
                    echo "building the docker image..."
                    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                        sh "docker build -t nanatwn/demo-app:${IMAGE_NAME} ."
                        sh 'echo $PASS | docker login -u $USER --password-stdin'
                        sh "docker push nanatwn/demo-app:${IMAGE_NAME}"
                }
            }
        }
        stage('deploy') {
            steps {
                script {
                    echo 'deploying docker image...'
                }
            }
        }
        // Use GitLab credentials to use with git
        // Configure git as Jenkins otherwise git will have errors
        // which could also be set with the Jenkins server
        // Print out git information
        // Commit changes, must set HEAD of specific branch to push to origin
        // as Jenkins checks out a commit hash
        stage('commit version update'){
            steps {
                script {
                    withCredentials([usernamePassword(credentialsId: 'gitlab-credentials', passwordVariable: 'PASS', usernameVariable: 'USER')]){
                        sh 'git config --global user.email "jenkins@example.com"'
                        sh 'git config --global user.name "jenkins"'

                        sh 'git status'
                        sh 'git branch'
                        sh 'git config --list'

                        sh "git remote set-url origin https://${USER}:${PASS}@gitlab.com/twn-devops-bootcamp/latest/08-jenkins/java-maven-app.git"
                        sh 'git add .'
                        sh 'git commit -m "ci: version bump"'
                        sh 'git push origin HEAD:jenkins-jobs'
                    }
                }
            }
         }
        }
    }
}

```

- Update the Dockerfile to take any version of the app/JAR
- Adding the `*` will match any version of the jar

``` Dockerfile

FROM amazoncorretto:8-alpine3.17-jre

EXPOSE 8080

COPY ./target/java-maven-app-*.jar /usr/app/
WORKDIR /usr/app

# Entrypoint won't work with * and must use shell command, so use CMD
# ENTRYPOINT ["java", "-jar", "java-maven-app-*.jar"]
CMD java -jar java-maven-app-*.jar

```

## Versioning Applications - Dynamically Increment Application version in Jenkins Pipeline - Part 2

### Commit version bump from Jenkins

- Per Jenkinsfile above, the changes to the versions need to be
  committed back to the git repository

### Ignore Jenkins push for Build Triggers

- How to stop infinite loop of git commit and webhooks?
  - Need to detect when commit is from Jenkins and ignore it
  - Use plugin - Ignore Committer Strategy
    - Configure to ignore commits made by Jenkins in multi branch
      pipeline
    - Pipeline \> Configuration \> Branch Sources
      - Enter email of commit author(s): use email address of Jenkins
        from git config
