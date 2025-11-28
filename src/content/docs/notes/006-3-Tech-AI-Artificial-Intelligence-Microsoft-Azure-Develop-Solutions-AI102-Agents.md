---
filetags: ":artificial-intelligence:ai:microsoft:azure:ai102:epubnote:agent:"
id: eae5da2e-f013-42af-8128-cc2ae5c28b0f
title: Agents in Azure AI Solutions
---

Source: My personal notes from [Course AI-102T00-A: Develop AI solutions
in Azure - Microsoft
Learn](https://learn.microsoft.com/en-us/training/courses/ai-102t00)
with labs from [Exercises for Develop AI Agents in
Azure](https://microsoftlearning.github.io/mslearn-ai-agents/)

## What are AI Agents?

Example: Travel agents who find flights, transportation and manage
logistics. They interpret your needs and finds the appropriate
destinations and activities.

Agents are like expert interpreters - smart software services that
combine: generative AI, contextual knowledge, and automation tools.

Agents build on the static nature of LLMs with dynamic information and
tools.

### Parts of an Agent

Model - generative AI language model, deployed from Azure AI model
catalog. Chat sessions with an agent is called a thread.

Tools

- Knowledge tools like search information, Bing, data stores
- Action tools: automate tasks, APIs, creating and running code

### Example: Travel agent

1.  User asks the agent a question about travel ideas
2.  Agent accepts the question as a prompt
3.  The agent uses knowledge of travel destinations, activities, places
    to stay to ground the prompt
4.  The agent uses a language model to interpret the prompt and generate
    a response
    - Agent can modify the prompt appropriate for the context
5.  Based on the response, the agent can use its available tools to
    submit travel reservations, book trips
    - When an agent can do something, these automation tasks are
      sometimes called skills

### Example: Sport management agent for baseball

1.  Collect data about players, opposing teams, game information. Idea
    is statistical analysis can help with team performance
2.  Provide data to agent and access to task that make coaching
    recommendations
3.  Ask the agent to analyze data to make coaching recommendations such
    as line up, real time changes to player roster based on game results
4.  Agent can submit roster change proposals and coaching tips
5.  Multiple agents can be set up for specialized coaching like batting
    order, pitcher selection, fielding tactics

### Microsoft Copilot

Another example of an agent is Microsoft Copilot

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
           |
           |--> Plugins, Bing search
           |<-- Organization controls, constraints

```

See [Microsoft Copilot
Architecture](https://learn.microsoft.com/en-us/copilot/microsoft-365/microsoft-365-copilot-architecture)
and for Microsoft Graph functions see [Graph Explorer for example
functionality](https://developer.microsoft.com/en-us/graph/graph-explorer)

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
2025-10, Copilot uses OpenAI models hosted in Azure. Priorities in
choosing the model is safety (low vulnerability to jail breaking) and
accuracy.

## Options for Agent Development

Microsoft has a variety of services for building different types of
agents:

- Azure AI Foundry Agent Service - managed service for creating,
  managing, using agents. Similar to OpenAI Assistants API with more
  functionality
- OpenAI Assistance API - standard API for OpenAI agent development
- Microsoft Agent Framework - development kit, framework for developing
  agents and orchestration of multiple agents
- AutoGen - open source framework for agent development. Good for
  research, ideation, and experiments.
- Microsoft 365 Agents SDK - for self hosted agents, for Microsoft 365
  and other channels like Slack
- Copilot Studio - low-code development for building and deploying
  agents, integrates with Microsoft and other services
- Agent Builder - custom agent development

Focus of course will be Azure AI Foundry Agent Service

## Tools Integration for Agents

Determine the use case for your agent, what should it be able to do?

Example: agents that can handle human resources functions, like
supporting new employees (on boarding), managing policies, and dealing
with issues. Example is an agent can be created for on boarding
employees.

Regular use cases:

- Automation
- Decision Making
- Information processing
- Communication

### Examples of Tools

1.  Knowledge Tools

    - Bing Search
    - File search
    - Azure AI Search
    - Microsoft Fabric - data stores
    - Other, OpenAPI Spec action tool

2.  Action Tools / Custom Tools or Skills

    Use cases: automate repetitive tasks, provide more accurate
    responses, specific needs and improvements

    The agent knows about an API for the custom tool and works with the
    LLM to determine use

    - Code interpreter - like Python code
    - Function - custom developed code, like serverless functions
    - APIs - like OpenAPI Spec

    See the [Semantic Kernel
    SDK](https://learn.microsoft.com/en-us/semantic-kernel/overview/)

    Example: A music player agent

    - function A - List music
    - function B - Add song
    - function C - List artists

    Agent tells LLM it has access to these functions and a user prompt.
    LLM responds with what to do. In other words, functions just do the
    tasks and logic during thread is done by the LLM. A thread could be
    add a song and list the music.

    For an exercise/lab using a custom function, see [Use a custom
    function in an AI
    agent](https://microsoftlearning.github.io/mslearn-ai-agents/Instructions/03-agent-custom-functions.html).

## Agent Resource Setup in Azure

Use bicep templates or create resources for basic setup in Azure AI
Foundry

Use an existing agent or create one with model, instructions, and tools
and resources it can use. Create a thread in chat session and add
information to the thread.

## Exercise: Explore AI Agent development

Set up an agent to help employees with expense claims.

Create an agent and use the `gpt-4o` model and setup with expense
grounding information and a Code interpreter action. In a threat, ask
about the expense policy and submit a new claim and download the
generated claim file.

For collaboration with others on AI and code, see [Copilot and
Notebooks](https://techcommunity.microsoft.com/blog/microsoft_365blog/introducing-copilot-notebooks-a-whole-new-way-to-work-with-ai-in-onenote/4428626)

## Exercise: Develop an AI Agent

Create an agent using the Foundry Agent SDK, go into a chat session
(thread).

Create an agent and use the `gpt-4o` model.

## Connected Agents

Connected agents are a feature in Azure AI Foundry Agent service to help
break up large work into smaller tasks. For example, an "Ask HR" service
that coordinates between specialized HR agents coordination.

### Considerations

How should agents be organized? how many are required and managed in an
organization?

Agents can use different models

### Multi-agent Workflows

Have a main agent that orchestrates:

- User input
- Select connected agent to do work
- Forward context, instructions
- Manage results to users

Connected agents:

- Single domain of responsibility
- Complete actions with prompts
- Uses tools, return results

Workflow might be combination of these multi-agent (multi-agentic)
flows:

``` text

Fanned out parallel tasks from main to multiple connected agents, for example collect opinions

    o
    |____
   /|\   \
  o o o   o

Sequential actions of main agent waiting sequential for processing by connected agents

o
|\
1 \__
  2 /\
    3 4
      |
      5

Selected action where main agent will select appropriate agent(s) for work

    o
    | (selected)
  o o o

```

## Model Context Protocol (MCP)

MCP is about tools and like a tool library. AI agents can dynamically
discover tools without prior knowledge of specific tools.

An MCP server hosts a set of functions that are exposed using the
`@mcp.tool` decorator. Agents will go to the MCP server to find tools.
For example, Azure AI agent uses available tools to respond to requests.

MCP is a protocol, a way of communicating tools, so the "MCP server" can
be anything that uses the protocol. The MCP server can be server, a
service, or other like an agent that communicates with MCP. MCP client
bridges from the MCP server and agent, like Azure AI Agent Service and
does:

- Discover tools with list tools call
- How tools can be used, security, API information
- Set up stubs that agent can use tools

Documentation: [What is the Model Context Protocol (MCP)? - Model
Context
Protocol](https://modelcontextprotocol.io/docs/getting-started/intro) -
"MCP (Model Context Protocol) is an open-source standard for connecting
AI applications to external systems." The AI industry used it as a
standard.

For Azure specific documentation, see [Azure MCP Server documentation -
Azure MCP Server \| Microsoft
Learn](https://learn.microsoft.com/en-us/azure/developer/azure-mcp-server/)

### MCP and Agent Flow

``` text

Agent --> MCP Server : Agent gets list of tools

MCP Server --> Agent : Tool information is given to agent for use, like Function A database access, B ticket, and C that sends email

Agent --> Function A : Agent can use tool from Function A

```

### Other Approaches

Agents can also use other published agents instead of connecting
directly to tools.

## Develop AI Agents with Microsoft Agent Framework

Microsoft Agent Framework is a platform for generative AI development
with service connectors, memory (data) connectors, prompt templates,
functions, and filters like pre and post actions.

See the [Semantic
Kernel](https://learn.microsoft.com/en-us/semantic-kernel/overview/) for
how the framework is implemented underneath.

Its benefit is an integrated platform to reuse Semantic Kernel
development and existing code.

The framework supports multi-agent solutions. Multi-agent orchestration
patterns in Microsoft Agent Framework:

- Concurrent - Broadcast to agents, use case: parallel analysis,
  decision making
- Sequential - step by step work
- Handoff - pass control based on context and rules, use case:
  escalation, dynamic work
- Group chat - brainstorming, collaborative problem solving
- Magentic - generalist multi-agent collaboration

See [Semantic Kernel Agent Orchestration \| Microsoft Learn An overview
on orchestrating agents in Semantic
Kernel](https://learn.microsoft.com/semantic-kernel/frameworks/agent/agent-orchestration)

## Exercise: Develop a multi-agent solution with Azure AI Foundry

Create an agent and use the `gpt-4o` model, they using SDK, create
several agents to prioritize, assign, and assess effort on tickets in a
sequential order.

## Exercise: Connect AI Agents to a remote MCP server

## Agents in Production

Q: What are examples of agents in use?

Look at existing applications that have agent functionality. For
example, Microsoft Teams has apps that can be AI agents like [Set up
Facilitator in Microsoft Teams - Microsoft Teams \| Microsoft
Learn](https://learn.microsoft.com/en-us/microsoftteams/facilitator-teams).

## See Also

- [Mycroft Artificial Intelligence (AI)](/garden/notes/006-3-tech-ai-mycroft) -
  [Mycroft Artificial Intelligence
  (AI)](id:f8db3814-1116-4010-9e4a-ba5828dc4c34)
- [Develop AI solutions in Azure
  AI-102](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)

### Resources

- [Azure AI Foundry
  SDK](https://learn.microsoft.com/azure/ai-foundry/how-to/develop/sdk-overview)
