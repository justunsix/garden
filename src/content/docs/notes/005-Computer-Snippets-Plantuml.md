---
filetags: ":plantuml:snippets:epubnote:"
id: c0360cd8-8ed4-45a4-9c5f-df8edc034cb5
STARTUP: inlineimages
title: PlantUML Snippets
---

Source: [PlantUML Command Line](https://plantuml.com/command-line),
[PlantUML Hitch Hikers
Guide](https://crashedmind.github.io/PlantUMLHitchhikersGuide),
<https://plantuml.com/>, [PlantUML Code Blocks in
Babel](https:/.mdmode.md/.md.md-contrib/babel/languages/ob-doc-plantuml.html)

``` shell

# Generate diagrams in PNG format for each file
java -jar plantuml.jar file1 file2 file3

# If plantuml CLI is installed, can substitute java -jar plantuml.jar with plantuml
plantuml -tpng mydiagram.puml
# Required on Windows
plantuml -tpng path/to/mydiagram.puml

# Help
plantuml -h

# Open GUI to select directory
plantuml -gui

# Render diagram in default format PNG
plantuml diagram1.puml

# Rend diagrams in directory
plantuml path/to/diagrams

# Generate an ASCII Art file using Unicode characters
plantuml -ttxt mydiagram.puml

# Display all standard libraries available
java -jar plantuml.jar -stdlib

```

## PlantUML Syntax

For available sprites (icons, boxes), see
[plantuml-stdlib](https://github.com/plantuml/plantuml-stdlib) and
<https://plantuml.com/stdlib> for example cloud icons, K8s, security
icons.

For C4 examples, see [Using PlantUML Stdlib C4 Lightweight Software
Architecture Description Method - Hitchhiker's Guide to
PlantUML](https://crashedmind.github.io/PlantUMLHitchhikersGuide/C4/C4Stdlib.html)
and multiple concept, logical diagrams at [C4 model for visualising
software
architecture](/garden/notes/004-computer-tech-architecture-c4-model-for-software) -
[C4 model for visualising software
architecture](id:ac2b410e-5d70-4216-88b4-51b9dc492ad6)

``` plantuml
@startuml

!define osaPuml https://raw.githubusercontent.com/Crashedmind/PlantUML-opensecurityarchitecture2-icons/master
!include osaPuml/Common.puml
!include osaPuml/User/all.puml
!include osaPuml/Hardware/all.puml
!include osaPuml/Misc/all.puml
!include osaPuml/Server/all.puml
!include osaPuml/Site/all.puml

'. List available sprites and their name for use in PlantUML in current library
listsprites
'. will list osa sprites in this file

'. comments
'. Mary is a Developer in the Product team. She has a Windows 10 PC and an Android phone.
'. Bob is a Manager in the Accounts team. He has Mac and an iPhone.
'. Diagram uses OpenSecurityArchitecture PlantUML library

Title Network diagram

' Users
together {
osa_user_green_developer(Mary, "Mary", "Product team", "Developer")
osa_user_green_operations(Ivan, "Ivan", "IT Team", "Server Admin")
osa_user_green_business_manager(Bob, "Bob", "Accounts team", "Manager")
note left : Look at Bob
}
' Devices
together {
osa_desktop(pc, "192.168.1.10", "Windows 10", "PC")
osa_laptop(mac, "192.168.1.12", "Mac", "Mac")
osa_iPhone(iphone, "Dynamic IP", "iPhone 11", "Phone")
osa_iPhone(android, "Dynamic IP", "Android 10", "Phone")
osa_server(server, "192.168.1.100", "Ubuntu Server 20.04 LTS", "Server")
}


' Network

osa_device_wireless_router(wifiAP, "192.168.1.1", "Network")
osa_hub(hub, "Office hub", "Hub")
osa_firewall(firewall, "51.37.24.103", "Network")
osa_cloud(cloud, "Internet", "Network")


Mary --> pc: source code
Mary --> android: social media

Bob --> mac: financial info
Bob --> iphone: phone calls

'. Connection with comment
Ivan --> server: configuration

iphone --> wifiAP
android --> wifiAP
wifiAP --> hub

server --> hub
mac --> hub
pc --> hub


hub --> firewall

firewall --> cloud


legend
1. my legend text
2. second legend text
endlegend

'. Complex legend
legend
    |= Color |= Type |= Description |
    | <size:11><back:#Red>Mary           </back></size>|    <color:Red><$osa_user_green_developer*.4></color> | Mary details... This is a stdlib sprite |
    | <size:11><back:#DarkGreen>Ivan           </back></size>|    <color:DarkGreen><$osa_user_green_operations*.4></color> | Ivan details... |
    | <size:11><back:#Orange>Bob           </back></size>|    <color:Orange><$osa_user_green_business_manager*.4></color> | Bob details... |
    | <size:11><back:#Purple>Box           </back></size>|    <color:Purple><&box></color> | A Box. This is an openiconic sprite |
endlegend

footer %filename() rendered with PlantUML version %version()\nExample from The Hitchhiker’s Guide to PlantUML
@enduml

```

### Nested Items

``` plantuml
@startuml

rectangle "Dev/Test Subscription" as devsub {

    card "Virtual Machine 1" as vm1 {
        component app [
                Application
        ]
    }
    card "AI Foundry" as aifoundry1 {
        card "Hub" as hub1 {
          card "AI Project" as aiproject1 {
             component endpoint1 [
                                Endpoint for Deployed model
             ]
          }
        }
    }

}

@enduml
```

### Entity Diagram Relationships

``` text

Type               Symbol
-----------------------------
Zero or One         |o--
Exactly One         ||--
Zero or Many        }o--
One or Many         }|--

```

## Emacs org-mode Snippets for plantuml-mode

Output to media directory and output source block in exports and
activate inlineimages in org-mode and output image file

``` plantuml

  <hit C-c ' here to open a plantuml-mode buffer and C-' to return to this org document>

Alice -> Bob: test

```

Output to temporary file

ASCII text output

``` plantuml
Bob -> Alice : Hello World!
```
