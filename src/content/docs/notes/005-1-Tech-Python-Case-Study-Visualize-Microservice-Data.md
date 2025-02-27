---
filetags: ":python:tech:microservice:visualization:plantuml:epubnote:"
id: dca34cac-cbe6-4e98-839a-baa2aee3089c
title: "Case Study: Visualize Complex Microservice Data Using Python"
---

Source: My personal notes from [Case Study: Visualize Complex
Microservice Data Using Python Online Class \| LinkedIn Learning,
formerly
Lynda.com](https://www.linkedin.com/learning/case-study-visualize-complex-microservice-data-using-python/)

## Use Case

- Create a solution from an idea at work, document it, develop it, and
  present and improve with others
- Why use Python? ease of use and other engineers are likely to be
  familiar with it; it is good for automation

## Using Microservices

- Use case for microservices: Apps than are complex and need to scale,
  large applications with many functions

- Microservices vs Monolithic applications

  - Advantages of microservices: major functions separated to manage
    complexity, easier to scale and provide availability for different
    components
  - Disadvantages of microservices
    - Increased network communication between services and security -
      performance overhead
    - Due to distributed nature of microservice, requires management
      like through people management, automation, monitoring, and
      service integration
      - Data is distributed
      - Multiple platforms might be used
    - Can be more difficult to understand product and its lifecycles

## Use case: How to Visualize Distributed Data?

Use case: Banned user from a social media platform with 250,000
followers wants to view their activity and manually review their
activity. The ban can be done from various places like reports,
algorithm detection, or user actions.

Solution: Build a diagnostic tool to visualize data from across
different platforms. Needs to be:

- Maintainable: consider language, libraries, can be used in 1+ years
  - Consider existing team's skills

## Using PlantUML

- PlantUML is an open source tool to help create different types of
  diagrams like sequence, class, components and others
- Sequence diagram: show interactions in different services

``` plantuml

@startuml

Client -> Server: request data
Server -> Client: response with data

@enduml

```

See more and a web based editor at [PlantUML](https://www.plantuml.com/)
