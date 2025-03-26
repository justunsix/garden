---
description: Overview and comparison of tools with examples with Java
  with Maven and Gradle and JavaScript with node package manager (npm)
filetags: ":devops:nana:bootcamp:tools:epubnote:"
id: c866f823-9a4a-413e-a5fb-45da6edb4ba2
title: DevOps Bootcamp - Build Tools and Package Manager Tools
---

Source: My personal notes from DevOps course by TechWorld with Nana

## Introduction to Build Tools

- Use case:
  - An application after development needs to be deployed to where it
    will run
  - Package app into a single file, packaging will build the code
    (compile, compress)
  - Keep file to deploy later, like other environments, backup, and
    share with people = artifact repository, examples are Nexus, JFrog
    artifactory
- Artifact look different depending on programming language
  - Examples:
    - Java - Java Archive (JAR), Web Archive (WAR) including code,
      dependencies

## Install Build Tools

- Using to build Java app

  - Install Java SDK, Maven, Gradle

- Using JavaScript

  - Install node, npm

- Editor

  - Install IntelliJ IDE, set environment

- Installation will depend on OS

- Applications for examples

  - Java-app with maven:
    <https://gitlab.com/twn-devops-bootcamp/latest/04-build-tools/java-maven-app>
    - `mvn package`
  - Java-app with gradle:
    <https://gitlab.com/twn-devops-bootcamp/latest/04-build-tools/java-app>
    - `gradle build`
  - React-nodejs-app:
    <https://github.com/techworld-with-nana/react-nodejs-example>
    - `cd api; npm install; node server`

## Build Artifact

- Use a build tool specific to the programming language
  - Install dependencies
  - Compile, compress code

### About Tools

- Maven: uses XML
  - Use `mvn install` to build JAR file
  - See target folder
- Gradle: uses Groovy
  - Use `gradle build`
  - See build, build/libs folders for artifacts

## Build Tools for Development, Managing Dependencies

- Build tools are needed locally when developing an app to get
  dependencies
- Maven, Gradle have their dependencies file to manage them
  - Files:
    - Maven: `pom.xml`
    - Gradle: `build.gradle`
  - Both Maven and Gradle using the Maven repository
  - To add dependencies, search for the name/version you need and add to
    dependency file and use tool
  - The commands above will automatically get the dependencies
    - Dependencies stored in a local repository, like home folder

## Run the Application

- Use the artifact to run app
- Example:
  - Java: `java -jar <jar file location>`

## Build JavaScript (JS) Applications

- Artifact can be zip or tar file, but is just the code
- Dependency / package tools, not build tools:
  - npm
    - `npm install` to get dependencies
    - Can use npm start, stop, public, test for local use
    - `npm pack` to compress code to tar file
  - yarn
  - Uses npm repository for dependencies
    - Search for package in repository to add
- Both use `package.json` file to manage dependencies
- Not as structured and standardized compared to Java

### Running the app

- Copy zip/tar, package.json to server
- Install dependencies

1.  Frontend and backend

    - Can package front and back ends separately or combined package
      with common package.json
    - In example repo, my-app and api can be separated
    - Frontend/React Code needs to be transpiled to allow browsers to
      understand it and compress/minified to improve app loading
      - JS, CSS files
      - Done by build tools/bundlers (e.g. webpack with React, webpack
        can be specified as a dependency)
      - Example: `npm run build` can use webpack to do packaging:
        transpiled, minified code
    - Best practice to use same tools for front and back end, package
      into WAR file

## Common Concepts and Differences of Build Tools

- Concepts similar for other languages
  - Python: pip package manager
- Patterns in other tools:
  - Dependency file: packages, versions
  - Repository for dependencies
  - Command line tool
  - Package managers: e.g. gradle, maven, npm, yarn, pip

## Publish an Artifact

- Build tools can publish artifacts to a repository and server can
  retrieve it like with curl, wget
- Push artifacts, pull from server

## Build Tools and Docker

Docker gives these advantages:

- No need to build and move different artifact types like JAR, WAR, Zip.
  Instead, use docker images from the applications
- Just one repository type with Docker images - all items are in image -
  dependencies, code
- Docker image can be a universal artifact, just need docker on server,
  not other binaries
  - Still need to build the apps

Example Dockerfile that gets code, installs dependencies, and runs app
from:
<https://github.com/techworld-with-nana/react-nodejs-example/blob/master/Dockerfile>

``` Dockerfile

FROM node:10 AS ui-build
WORKDIR /usr/src/app
COPY my-app/ ./my-app/
RUN cd my-app && npm install && npm run build

FROM node:10 AS server-build
WORKDIR /root/
COPY --from=ui-build /usr/src/app/my-app/build ./my-app/build
COPY api/package*.json ./api/
RUN cd api && npm install
COPY api/server.js ./api/

EXPOSE 3080

CMD ["node", "./api/server.js"]

```

Example Dockerfile that reuses existing artifact and runs app from:
<https://gitlab.com/twn-devops-bootcamp/latest/04-build-tools/java-app/-/blob/master/Dockerfile?ref_type=heads>

``` Dockerfile

FROM amazoncorretto:17-alpine-jdk

EXPOSE 8080

COPY ./build/libs/java-app-1.0-SNAPSHOT.jar /usr/app
WORKDIR /usr/app

ENTRYPOINT ["java", "-jar", "java-app-1.0-SNAPSHOT.jar"]

```

## Build Tools for DevOps

DevOps responsibilities:

- Need to test locally by running the tools, verify
- Understand build docker image, push to repository, run on server
  - Configure build automation tool, CICD pipeline
  - Install dependencies, run tests, build/bundle app, push to repo, run
    - Example:
      - Run tests: npm/yarn test, gardle/mvn test
      - Build and package into Docker image: docker build
