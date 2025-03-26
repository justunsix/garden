---
description: About artifact repository managers and setup/work with
  Nexus and publish artifacts.
filetags: ":devops:nana:bootcamp:nexus:artifact-manager:epubnote:"
id: 52a2ac13-a45d-4b2f-a5da-f4b783f45261
title: DevOps Bootcamp - Artifact Repository Manager
---

Source: My personal notes from DevOps course by TechWorld with Nana

## Introduction to Artifact Repository Manager

- Artifacts are apps built into a single file
  - Different formats
  - Different languages have different formats, usually need different
    repositories for them
- Artifact repository stores these files

Use case: Need to store artifacts. Easier to manage in one place.

- Use an Artifact Repository Manager to:
  - Upload and store different build artifacts
  - Retrieve (download) artifacts
  - Central storage

### Examples

- Software for private, internal use: Nexus
  - Can host own repositories like internal Maven repository
  - Proxy public repositories to centralize all organization
    repositories
  - Nexus:
    - Open source, has commercial support
    - Supports most popular repository formats (apt, docker, maven, npm,
      helm, etc.)
- Public dependency repositories:
  - Maven central repository for Java/jar files
  - npm repository

### Features of a Repository Manager

- Integrate with LDAP, existing authentication
  - Support for system accounts
- API for tool integration, using with CICD like push/pull artifacts
- Backup and restore, storage integration
- Multi-format support - zip, tar, docker, etc.
- Metadata of artifacts
- Clean-up policies - automatically delete files on conditions
- Search - across projects, artifact repositories

## Install and Run Nexus on a Cloud Server

- Nexus will need a bigger size server like:
  - 2 to 4 CPU
  - 8 GB RAM
- Install:
  - Java JDK Version prerequisite
  - Nexus
  - See [Nexus provisioning
    script](https://gitlab.com/justunsix/devops-tests/-/blob/main/6-artifact-repository-manager/scripts/provisioner-nexus.sh)
- Open the port on the VM firewall

### About Nexus folders

- Nexus folder has program binaries, can be replaced in version upgrades
- sonatype-work folder has program configuration and repository data:
  - Configuration
  - Network Access info
  - Logs
  - Uploaded files, metadata
  - Useful for application backups

## Introduction to Nexus

See first page of Nexus web application / user interface:

- Logging in: use admin with admin password defined in a file in
  `/opt/sonatype-work/nexus3`
  - Change password
  - Agree to enable any functions when prompted
- Repository formats
- Settings:
  - Repositories
    - Types
    - Storage
    - Clean up policies
  - Security
  - Support

## Repository Types

- Multiple repository types supported, some public defaults are enabled
  (maven, nuget)
- Types:
  - Proxy
    - Linked to a remote repository, like public Maven repository
    - Remote artifacts will be stored in Nexus, internal users will use
      the Nexus copy
    - Can configure for other popular public repositories like for
      Docker, npm
    - Benefits:
      - Saves network as Nexus is like a cache
      - Central source of all dependencies, developers do not need to
        set separate repo locations
  - Group
    - Use case: multiple repositories are used in projects, group allows
      combine repositories into a single repository that an application
      can use so there is only one URL
  - Hosted
    - Internal organization artifacts, by tool type
    - Examples: maven releases, maven snapshots, nuget hosted
    - Supports versions
    - Can be 3rd party libraries that are not public, but are used by an
      organization internally

## Publish Artifact to Repository

- Goal: upload JAR file to existing hosted repository on Nexus
  - Use Maven/Gradle command to push to repository and configure tools
    to access Nexus

### Set up Nexus Local user

- Create users for tool / developer use
- Log into Nexus as admin. Go to Security \> Users \> Create new local
  user
  - Set to active
  - Give anonymous role
  - Security \> Role \> Create role
    - Add roles:
      - search for `view-maven`
        - Choose view \* role
      - Add the new role to the local user

### Configure Maven

- Make changes to `build.gradle` at
  <https://gitlab.com/twn-devops-bootcamp/latest/06-nexus/java-app/>,
  like:

``` ruby

apply plugin: 'maven-publish'

publishing {
    publications {
        maven(MavenPublication) {
            artifact("build/libs/my-app-$version"+".jar"){
                extension 'jar'
            }
        }
    }

    repositories {
        maven {
            name 'nexus'
            url "http://xx.xx.xx.xx:xxxx/repository/maven-snapshots/"
            allowInsecureProtocol = true
            credentials {
                username project.repoUser
                password project.repoPassword
            }
        }
    }

```

- Add user name and password to `gradle.properties`
- Update `settings.gradle` if needed with something like
  rootProject.name = 'my-app' which is used in naming the JAR file
- Build all

``` shell

# Have gradle refresh all changes and start build
gradle build
# note creation of build folder with JAR file
# Publish the JAR using the configuration above
gradle publish

```

For Maven

- Similarly, add plugin and update repository information using
  <https://gitlab.com/twn-devops-bootcamp/latest/06-nexus/java-maven-app>

- Update pom.xml:

``` xml

<!-- ... -->

<build>
        <plugins>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-deploy-plugin</artifactId>
                <version>3.1.1</version>
            </plugin>

            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-deploy-plugin</artifactId>
            </plugin>

<!-- ... -->


    <distributionManagement>
        <snapshotRepository>
            <id>nexus-snapshots</id>
            <url>https://8081-justunsix-devopstests-ag77k2xktxu.ws-us116.gitpod.io/repository/maven-snapshots/</url>
        </snapshotRepository>
    </distributionManagement>



```

- Update ~/.m2/settings.xml with repository credentials

``` xml

<settings>
  <servers>
    <server>
      <id>nexus-snapshots</id>
      <username>user1</username>
      <password>nexus</password>
    </server>
  </servers>
</settings>

```

- Build and publish the JAR

``` shell

mvn package
# target folder will be created with JAR
# publish to repo
mvn deploy

```

## Nexus REST application

- Can query repository:

  - Components
  - Versions
  - Repositories

- Information needed in pipelines

- Can access endpoints using curl, wget to do http request

  - Include Nexus user credentials

    ``` shell

    # Get List of repositories
    # given what user can see
    curl -u user:pwd -X GET 'http:1.1.1.1:8081/service/rest/v1/repositories'

    # Get components in repository
    ## Will display files in snapshots
    curl -u user:pwd -X GET 'http:1.1.1.1:8081/service/rest/v1/components?repository=maven-snapshots'

    # Get components for specific asset ID
    curl -u user:pwd -X GET 'http:1.1.1.1:8081/service/rest/v1/components?<asset ID>

    ```

  Applications of API:

  - Check repositories for a specific component/asset
  - Can use script to retrieve components and get which one to deploy,
    like latests

## Blob Storage

- See in Nexus UI under Repository \> Storage
- Nexus stores all uploaded files, binary files - can be local/cloud
  storage
  - Local: /opt/sonatype-work/nexus3/blob
- Can create new blob storage:
  - File: local, recommended, must be accessible by user account running
    nexus on system
  - AWS S3: recommended for AWS hosted Nexus
- Details: Storage state indicates running or issues, number of blobs,
  and usage
- Blob stores cannot be modifed after creation and cannot be deleted
  once in use by a repository

## Component vs Asset

- Components are like folders containing files
  - Defines what is being uploaded
  - Can be any type/format, like docker image, zip file, Java archive
  - Components have 1 or more assets
- Assets are files like deployment and build output files
  - Packages/files being uploaded
- Note Docker format gives assets IDs (Docker Layers)
  - Docker layers are assets
    - Like an operating system
  - 2 Docker images are 2 components but can share same assets

## Cleanup Policies and Scheduled Tasks

- UI: Repository \> Cleanup Policies
- Set up one for a format like maven2
  - Delete components by age, usage, type or asset name using regex (.\*
    matches all)
- Associate policy to a repository
  - Repository \> Repositories \> A repository settings
    - Choose a cleanup policy to attach
  - Clean up policy is only soft delete, components will remain on disk

### Scheduled Tasks

- When does policy run?
  - See System \> Tasks - shows schedule
- Task example: Admin - Compact blob store
  - Does physical deletion of soft deleted components from clean up task
  - Can schedule or manual execute
