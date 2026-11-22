---
date: 2026-11-06
description: "Apache Maven: build and manage Java-based projects"
filetags: ":snippets:epubnote:maven:maven:mvn:apache:java:"
id: 093dc942-e5e0-4a00-a454-72691dcaddf5
title: Maven, mvn Snippets
---

``` shell

# Compile a project
mvn compile

# Compile and package the compiled code in its distributable format, such as a `jar`
mvn package

# Compile and package, skipping unit tests
mvn package --define skipTests

# Install the built package in local maven repository. (This will invoke the compile and package commands too)
mvn install

# Delete build artifacts from the target directory
mvn clean

# Do a clean and then invoke the package phase
mvn clean package

# Clean and then package the code with a given build profile
mvn clean --activate-profiles profile package

# Run a class with a main method
mvn exec:java --define exec.mainClass="com.example.Main" --define exec.args="argument1 argument2 ..."

```

## References

- [Running Apache Maven – Maven](https://maven.apache.org/run.html)
