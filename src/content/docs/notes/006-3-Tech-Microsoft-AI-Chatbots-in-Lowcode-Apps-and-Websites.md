---
date: 2024-02-25
description: Conversational AI in LowCode apps and websites - Taking UX
  to the next level with AI
filetags: ":ai:artificial-intelligence:epubnote:"
id: 8d906108-2a1c-4768-9696-2f48560c3711
title: Microsoft AI Chatbots in Lowcode Apps and Websites
---

Source: My personal notes from Chatbots with Power Platform apps and
websites presented by Sravani Seethi, Microsoft Cloud Solution Architect

## Conversational AI

- Business use case: UFO Sighting App - Power Platform solution
  - Users can see existing UFO sightings and submit new ones
  - Uses Dataverse, AI Builder with model driven app, canvas app, and
    Power Pages. Chatboxx from copilot and copilot studio.

### Why Low Code and AI?

- Users expect conversational experiences
- Low code allows more users to build modern apps with conversational
  end user experiences with generative AI

## Demo

Show conversational AI inside canvas and model driven apps

- Power Platform (PP) Solution
  - Overview: Allow Dataverse index
  - 1 Dataverse table with UFO sightings (public data)
    - Views –\> Added view columns for index
      - May take couple hours for indexing
  - Model driven app
    - See table data
    - Out of the box chat user interface
    - Chatting with data: Ask copilot in app, like "what is the latest
      sighting?", "top 5 longest sightings"
  - Canvas app
    - Added out of box copilot, pointed to UFO sightings table
      - Similar to model driven app
    - Table view of data
    - Add new sighting page
      - **Copilot studio** (formerly called Power Platform Virtual
        Agents) built chatbot
        - Generative AI Bot was given a couple websites like about UFOs
          for context
          - Allows prompts like "What is an UFO?"
          - Link to resources are provided in responses
          - Input could be things like websites, SharePoint sites
    - Button can link to chatbot responses and display response
      - **AI Builder** - prompts with dynamic input like a city name
        from canvas app fields
- PP Editing
  - Insert:
    - Copilot: In canvas app, insert copilot, select table and relevant
      view, and add chatbot
    - Chatbot: Select which copilot studio design bot to use
    - AI built in prompt: `<field name>.Predict(Data.Value).Text` , when
      clicked, text response is set in another text field
- Power Pages
  - Created the site using Copilot for Power Pages
  - Copilot can help rewrite text on pages
  - Active chatbot in Power Pages "Set Up"
    - It automatically understands the whole site
    - Build copilot chatbot in Copilot studio
      - Set up to use sites, Data sources
  - Gets data from Dataverse - Dataverse can be a copy from other
    connections like SQL database, Azure SQL
