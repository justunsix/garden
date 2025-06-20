---
date: 2024-02-25
filetags: ":ai:artificial-intelligence:power-platform:epubnote:"
id: 09ea5ea0-19da-40ca-bb27-f78ed8938e2f
title: Create Power Platform solutions with AI and Copilot
---

Source: [Create Power Platform solutions with AI and Copilot - Training
\| Microsoft
Learn](https://learn.microsoft.com/en-us/training/paths/copilot-solutions/?source=learn&ns-enrollment-type=Collection&ns-enrollment-id=86grf01rx4p4r4)
and my personal notes from work session Getting Started with Copilot
Studio in 2024

## Getting Started with Copilot Studio 2024-02-09

Presented by Sravani Seethi, Microsoft Cloud Solution Architect

Use case: quickly create custom chatbots to help users

Functionality:

- Conversational AI
- Monitoring
  - Telemetry
  - User analytics, satisfaction
- Publish copilot to different SaaS
  - Like Teams
- Chat on knowledge from files, websites, shares
- Create specific topic
  - Predefined responses
  - Custom responses
- Actions and Plugins - use Power Platform, OpenAI connectors to call
  backend and APIs
  - Help users change data, query data
    - Can use Power Automate flow to change data for user

### Demo and Review of Copilot Studio Interface

- Access Copilot Studio from Power Platform - Chatbots

- Go to <https://web.powerva.microsoft.com/>

- Copilots

  - Plugins
  - Prompts
    - Reusable across Power Platform
    - Give GPT model the context of the conversation and input to give a
      relevant response
      - For example: I am a nurse at a hospital and need concise
        instruction on how to use a \<medical device\>. Do not add
        additional text.
  - Models

- Create new copilot, feedback it website

  - Topics - there are built in ones, system defined like escalate to
    human

- Create a new topic, can use copilot to create topic

  - Topic can use inputs, AI will understand variations of the inputs

- Test copilot

- Topic actions:

  - Send messages
  - Ask questions
  - Ask an adaptive card (HTML output)
  - Conditions
  - Variables
  - Manage topic like start new or end
  - Call an action like Power Automate flow
  - Other advanced features like generative answers, custom events,
    connector actions
    - Custom search - like search a website, create generative answers
    - See also prompts to reuse:
      <https://github.com/pnp/powerplatform-prompts/tree/main>

- Entities: outlines ways an user can respond in chat like different
  date formats and statements

- Analytics

- Publish

  - Different channels: Teams, Power Platform, Slack, Website

- Extend:

  - Plugin

- Settings

  - Add other websites, documents to feed
  - Content moderation
  - Generative AI
    - Can use public websites and internal SharePoint sites
  - Customer Engagement - like live agent integration
  - Security - sharing, authenticate user
    - No authentication allow all web channels publishing
  - Skill - for example Azure bot framework
  - Language - like English, French

Where is data stored?

- Azure OpenAI does not use your data to train the model and data lives
  in your tenant
