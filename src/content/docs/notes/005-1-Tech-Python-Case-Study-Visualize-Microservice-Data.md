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

Visualizing user datto help users or troubleshoot issues with the data.

Create a solution from an idea at work, document it, develop it, and
present and improve with others

Why use Python? ease of use and other engineers are likely to be
familiar with it; it is good for automation

## Using Microservices

Use case for microservices: Apps than are complex and need to scale,
large applications with many functions. It can be hard to understand the
data and their relationships. A visualization in a diagram can help.

### Microservices vs Monolithic applications

Advantages of microservices:

Major functions separated to manage complexity, easier to scale and
provide availability for different components

Disadvantages of microservices:

- Increased network communication between services and security -
  performance overhead
- Due to distributed nature of microservice, requires management like
  through people management, automation, monitoring, and service
  integration
  - Data is distributed
  - Multiple platforms might be used
- Can be more difficult to understand product and its flows

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
Client -> Server: another request data
Server -> Client: another response with data

@enduml

```

See more and a web based editor at [PlantUML](https://www.plantuml.com/)

### Visualizing Profile and User management Microservices

Services to help users manage and review their information:

- Profile Information
- Post Management
- Post Moderation

User's name is blondiebytes and their profile information. Below UML
will render a node about the user, 3 reports on their user activity, and
reporter information.

``` plantuml
@startuml

object blondiebytes
blondiebytes : name = john
blondiebytes : bio = software developer
blondiebytes : link_in_bio = "linktr.ee/blondiebytes"
blondiebytes : is_reported = true

object blondiebytes_report_one
blondiebytes_report_one : is_manual = false
blondiebytes_report_one : reason = Post used a bad word
blondiebytes_report_one : post_text = You can use ASCII in spring boot

object blondiebytes_report_two
blondiebytes_report_two : is_manual = true
blondiebytes_report_two : reason = spam post
blondiebytes_report_two : reported_by = browniebits
blondiebytes_report_two : post_text = Never use C in the spring

object blondiebytes_report_three
blondiebytes_report_three : is_manual = false
blondiebytes_report_three : reason = represented duplicate content from another account
blondiebytes_report_three : post_text = Learn python first
@enduml

object browniebits
blondiebytes : name = Kate
blondiebytes : bio = software developer
blondiebytes : link_in_bio = "linktr.ee/brownibts"
blondiebytes : is_reported = false
blondiebytes : is_followed_by_blondiebytes = false
blondiebytes : is_following_blondiebytes = true

object browniebits_recent_posts
browniebits_recent_posts : post1 = Spring boot sucks
browniebits_recent_posts : post2 = Never use spring boot

blondiebytes -down-> blondiebytes_report_one
blondiebytes -down-> blondiebytes_report_two
blondiebytes -down-> blondiebytes_report_three

browniebits -down-> browniebits_recent_posts

```

### Using Python with PlantUML

Python can be used to generate PlantUML diagrams, see [plantuml on
pypi](https://pypi.org/project/plantuml/).

Python can create the PlantUML code and its diagrams allowing Python
developers to use PlantUML more easier. For example, Python can create
output PlantUML code as a text file from an input file which can be
`json`.

## Doing the Visualization

Using `json` input data about the user profiles, reports, posts, and
their relationships, write a Python script to read the input data and
generate a PlantUML node diagram with their relationships. Running the
script will read the input data and show the users, their posts, and
reports on the user.
