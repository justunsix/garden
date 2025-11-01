---
author: Justin Tung
filetags: ":architecture:tech:model:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: ac2b410e-5d70-4216-88b4-51b9dc492ad6
title: C4 model for visualising software architecture
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

# See Also

## Resources

- [The C4 model for visualising software
  architecture](https://c4model.com/)

# Introduction

From: [Visualising software architecture with the C4 model - Simon
Brown, Agile on the Beach 2019 -
YouTube](https://www.youtube.com/watch?v=x2-rSnhpw0g) and [The C4 Model
for Software
Architecture](https://www.infoq.com/articles/C4-architecture-model/)

## Why Use Modelling Language

### Unified Modelling Language (UML)

- Many people have excuses not to use UML:
  - "Just use a whiteboard" does not produce a consistent set of
    diagrams.
  - Different audiences - different diagrams and stories
- Compare to building industry - physical plans

### Approach

- When drawing software architecture, think like a software developer
  - Need to reflect reality
- UML provides a standard - common set of abstractions - a strength,
  like a map has common abstractions like trains, roads, signs

1.  Hierarchy

    - A software system is made up of one or more containers
      - Containers are made of components
        - Components are made of code

### C4 Model

- C4 = Context, Containers, Components, Code
- 4 levels
  - Context + Containers - Overview
  - Components - Details
  - Code (e.g. classes) - Details on Demand

Analogy: Diagrams are maps

- Different diagrams tell different stories to different audiences

- Model of the static structure (C4) is base for other views like:

  - Business process and workflow
  - Deployment
  - Infrastructure
  - Data
  - Runtime and behaviour

## Example: Banking System

## Level 1 System Context diagram

- System - what we are working on
- People who use it
  - Role, users, personas
- Stuff around it

``` plantuml
@startuml

!theme plain

title System context for Internet Banking System

actor "Banking Customer" as customer
rectangle "Internet Banking System" as ibankingsys
database "Mainframe Banking System" as mainframebsys
rectangle "Email System" as emailsys

customer --> ibankingsys : view info
emailsys --> customer : sends email to
ibankingsys --> emailsys : send email using
ibankingsys --> mainframebsys : gets account information

@enduml
```

### Level 2 Container Diagram

"Zoom into the context like a map to see more details"

- Include everything in previous diagram, expand details of "Internet
  Banking System"
- Most each container is separately deployed item and each line is a
  inter-item network flow

``` plantuml
@startuml
!theme vibrant
title Container diagram for Internet Banking System

actor "Banking Customer [Person]" as customer
rectangle "Internet Banking System" as ibankingsys {
    card webapp [
        Web Application
        Container Java Spring MVC
    ]
    card spaapp [
        Single-Page Application
        JS Angular
    ]
    card mobileapp [
        Mobile App
        Xamarin
    ]
    card apiapp [
        Java Spring MVC
        JSON/HTTPS API
    ]
    database ibsdb [
        Database
        Relational Database Schema
    ]
}

database "Mainframe Banking System [Software System]" as mainframebsys
rectangle "Email System [Software System]" as emailsys

customer -[dashed]-> webapp : visits website
customer -[dashed]-> spaapp : views account, balances, makes payments using
customer -[dashed]-> mobileapp : views account, balances, makes payments using
spaapp -[dashed]-> apiapp : makes API calls [JSON/HTTPS]
mobileapp -[dashed]-> apiapp : makes API calls to [JSON/HTTPS]
apiapp -[dashed]-> emailsys : sends email using [SMTP]
apiapp -[dashed]-> mainframebsys : makes API calls to [XML/HTTPS]
apiapp -[dashed]-> ibsdb : reads from and writes to [JDBC]

@enduml
```

### Level 3 Component Diagram

- Zoom into a container to see components for API application
- Components should reflect code structure like
  - Language modules
  - Packages
  - Namespaces
  - Libraries

``` plantuml
@startuml
!theme mars
title Component diagram for Internet Banking System - API Application

rectangle "Email System [Software System]" as emailsys {

    card spaapp [
        Single-Page Application
        JS Angular
    ]
    card mobileapp [
        Mobile App
        Xamarin
    ]
    card "API Application" as apiapp {
        component apictl [
        Sign In Controller
        [Component Spring MVC Rest Controller]
        ]
        component apisecurity [
        Security component
        [Component: Spring Bean]
        ]
        component acctctl [
        Account Summary Controller
        [Component: Spring MVC Rest Controller]
        ]
        component mfbsf [
        Mainframe Banking System Facade
        [Component: Spring Bean]
        ]
        component resetctl [
        Password Reset Controller
        [Component: Spring MVC Rest Controller]
        ]
        component emailcp [
        Email Component
        [Component: Spring Bean]
        ]
    }
    database ibsdb [
        Database
        Relational Database Schema
    ]

    database "Mainframe Banking System [Software System]" as mainframebsys

}

spaapp -[dashed]-> apictl : makes API calls to [JSON/HTTPS]
mobileapp -[dashed]-> apictl : makes API calls to [JSON/HTTPS]
apictl -[dashed]-> apisecurity : uses
apisecurity -[dashed]-> ibsdb : reads from and writes to [JDBC]
spaapp -[dashed]->  acctctl : makes API calls to [JSON/HTTPS]
acctctl -[dashed]-> mfbsf : uses
mfbsf -[dashed]-> mainframebsys : uses [XML/HTTPS]
resetctl -[dashed]-> emailcp : uses
resetctl -[dashed]-> apisecurity : uses
emailcp -[dashed]-> emailsys : sends email using [SMTP]

@enduml
```

### Level 4 Code Diagram

- Manually doing level 4 diagrams is not recommended due to complexity,
  changes
- Automate them from code
- Example is a class diagram

## Notation and Tips

- Put titles, include diagram type, numbered diagram if order is
  important
- Layout
- Visual consistency: consistent with notation and element positions
  across diagrams
  - E.g. actors always in similar location
- Acronyms: appropriate for audience
- Elements
  - Boxes - element name, type, technology, description/responsibilities
    - Do colouring, styles later
    - Types: Person, Software System, Container + tech, Component + tech
    - Short description
      - Why do descriptions? To help people understand what the element
        is and what it does
  - Lines
    - Give structure
    - Recommend one direction lines only showing most important
      dependencies or data flow with annotations on purpose of line and
      direction
      - Back and forth flows are good if flow is significant such as
        technology difference or data is of interest
    - Which way to point arrows?
      - Up to you, must match annotations
        - E.g. uses, send data to, calls API to use
    - Instead of explicit connections, could use implicit connections -
      tell the significant story
      - E.g. \[via Kafka topic X\] instead of showing item to Kafka
        topic and then next item
- Use legends
  - Explain shapes, colours, styles
  - Legend could be elements and lines as single objects and labeled
- Use shape, icon, and colour should complement a diagram but not have
  meaning itself. If shape and colours are taken away and the diagram
  must still make sense
  - Shape, colour, styles, icons will improve communication of diagram
  - Can place icons in boxes, but leave boxes and element descriptions
    intact

``` plantuml
@startuml

title Good Element Examples

card auser [
Anonymous User
[Person]

Anybody on web.
]

card techtribes [

techtribes.je
[Software System]

Website for tech community to keep up to date
with local tech news and events in Toronto

]

card webapp [
Web Applications
[Container: Java + Spring MVC]

Allows users to view peoplem tribes,
content, events, from the local
tech and digital sector
]

card twconn [
Twitter Connector
[Component: Spring Bean + Twitter4j]

Connects to Twitter to get tweets
using REST and APIs
]

auser -[Dashed]-> techtribes : uses

webapp --> twconn : Makes API calls using (do not use double arrows if not needed)

techtribes -d-> [microservice A container] : Manage users
[microservice A container] -d-> [microservice B container] : Requests list of customers from [JSON/HTTPS] - use double arrows if makes sense
[microservice B container] -u-> [microservice A container] : Returns list of customers as [Kafka topic]

legend right
Legend
Comments: Sample legend item
endlegend

@enduml
```

## Assessing Diagram Usefulness

- Software architecture diagrams must be able to stand alone without
  explanation
- Story should complement diagram, rather than explain it
- Notation Checklist: <https://c4model.com/review/>
- Abstractions first, notations second - ensure team understands
  language

## Tooling

Recommendations:

1.  PlantUML with C4 domain language
2.  Structurizr
3.  Do not use Visio
