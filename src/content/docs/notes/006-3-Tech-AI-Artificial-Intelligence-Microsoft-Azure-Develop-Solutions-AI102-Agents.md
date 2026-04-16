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

Goal - instructions on the agent's purpose and how they help users

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

Main article: [Microsoft M365
Copilot](/garden/notes/006-3-tech-ai-microsoft-m365-copilot) - [Microsoft M365
Copilot](id:68647160-81d6-4a03-a1c0-cd91cc529eed)

Example of an agent is Microsoft Copilot that has access to Microsoft
365 data, models, and other services.

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

#### Knowledge Tools

- Bing Search
- File search
- Azure AI Search
- Microsoft Fabric - data stores
- Other, OpenAPI Spec action tool

#### Action Tools / Custom Tools or Skills

Use cases: automate repetitive tasks, provide more accurate responses,
specific needs and improvements

The agent knows about an API for the custom tool and works with the LLM
to determine use

- Code interpreter - like Python code
- Function - custom developed code, like serverless functions
- APIs - like OpenAPI Spec

See the [Semantic Kernel
SDK](https://learn.microsoft.com/en-us/semantic-kernel/overview/)

Example: A music player agent

- function A - List music
- function B - Add song
- function C - List artists

Agent tells LLM it has access to these functions and a user prompt. LLM
responds with what to do. In other words, functions just do the tasks
and logic during thread is done by the LLM. A thread could be add a song
and list the music.

For an exercise/lab using a custom function, see [Use a custom function
in an AI
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

Azure AI Foundry Agent service has Connected agents to help break up
large work into smaller tasks. For example, an "Ask HR" service that
coordinates between specialized HR agents coordination.

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

The Microsoft Agent Framework platform for generative AI development
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

## Q: What are examples of agents in use?

Look at existing applications that have agent functionality. For
example, Microsoft Teams has apps that can be AI agents like [Set up
Facilitator in Microsoft Teams - Microsoft Teams \| Microsoft
Learn](https://learn.microsoft.com/en-us/microsoftteams/facilitator-teams).

## Exercise: Build AI agents with portal and VS Code

Builds a complete AI agent solution using both the Microsoft Foundry
portal and the AI Toolkit VS Code extension.

- Agent is created with system instructions and tools:
  - File search with an indexed policy text file
  - Code interpretation
- Test prompts are run to verify tool use in the portal and VS Code
- Use the SDK with a function and interact with the agent

## Exercise: Use a custom function in an AI agent

Create an agent that can use custom functions as a tool to complete
tasks.

- Agent will act as an astronomy assistant that can provide information
  about astronomical events and calculate the cost of telescope rentals
  based on user inputs
- Define the function tools and implement the logic to process function
  calls made by the agent:
  - Uses MCP server tools
  - Access external data

## Exercise: Develop a multi-agent solution with Azure AI Foundry

Create an agent and use the `gpt-4o` model, they using SDK, create
several agents to prioritize, assign, and assess effort on tickets in a
sequential order.

## Exercise: Develop an AI agent with Model Context Protocol (MCP) tools

- Create an agent that can use Model Context Protocol (MCP) server tools
  to access external data sources and APIs
- Use agent to retrieve up-to-date information and interact with custom
  services through MCP tools
- Create an MCP server with custom tools

## See Also

- [Mycroft Artificial Intelligence (AI)](/garden/notes/006-3-tech-ai-mycroft) -
  [Mycroft Artificial Intelligence
  (AI)](id:f8db3814-1116-4010-9e4a-ba5828dc4c34)
- [Develop AI solutions in Azure
  AI-102](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)
- [Artificial Intelligence (AI) Agents](/garden/notes/006-3-tech-ai-agents) -
  [Artificial Intelligence (AI)
  Agents](id:a33f8c71-f312-43a0-8e1b-1023e2fd020c)

### Resources

- [Azure AI Foundry
  SDK](https://learn.microsoft.com/azure/ai-foundry/how-to/develop/sdk-overview)
