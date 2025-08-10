---
filetags: ":plantuml:snippets:epubnote:"
id: c0360cd8-8ed4-45a4-9c5f-df8edc034cb5
title: PlantUML Snippets
---

Source: [PlantUML Command Line](https://plantuml.com/command-line)

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

```
