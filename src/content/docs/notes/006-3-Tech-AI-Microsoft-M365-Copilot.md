---
date: 2026-03-24
filetags: ":artificial-intelligence:ai:microsoft:azure:epubnote:agent:m365-copilot:"
id: 68647160-81d6-4a03-a1c0-cd91cc529eed
title: Microsoft M365 Copilot
---

Microsoft M365 Copilot uses generative AI described in [Develop
generative AI apps in
Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-generative) -
[Generative AI in Azure AI
Solutions](id:d5571956-346d-433d-8500-0b58a819fffb).

Functions include:

- Accessing your data for context and prompt
- Agents
- History of previous conversations
- Customization using instructions

## Architecture

``` text

                     +-------------------------------+
User --> Copilot --> |   Large Language Model (LLM)  |
           |         +-------------------------------+
           |              modified prompts
           |
           |--> Microsoft Graph for messages, context, files
           |        |
           |        |--> Dataverse, Power Platform services
           |        |--> Indexed vector databases related to LLM model version chosen
           |        |--> Email, Messaging, Cloud files, Collaboration websites
           |
           |--> Plugins, Bing search
           |<-- Organization controls, constraints

```

See [Microsoft Copilot
Architecture](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-architecture)
and for Microsoft Graph functions see [Graph Explorer for example
functionality](https://developer.microsoft.com/en-us/graph/graph-explorer)

## Cognitive Services

Q: Related to agents, cognitive services: Saw M365 Copilot can do NLP,
vision, and information extraction, for example, OCR of written notes
and heading and list recognition. As an agent, does Copilot call the
formerly named cognitive services behind the scenes for users and
process results? What model is Copilot using? Was thinking in the
context of agent design, it will be helpful to use the services like
tools specific to language, vision, documents tasks. For example, at
work there is a sequential process with OCR of forms and field
extraction using text parsing currently.

Copilot is like a complex agent and has access to many tools. As of
2025, Copilot uses OpenAI models hosted in Azure. Priorities in choosing
the model is safety (low vulnerability to jail breaking) and accuracy.
