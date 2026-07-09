---
filetags: ":artificial-intelligence:ai:epubnote:agent:mcp:model-context-protocol:"
id: c17cdb1a-cd72-4016-91fe-3aa30fb2162c
title: Artificial Intelligence (AI) Agents and Model Context Protocol
  (MCP)
---

## About Model Context Protocol (MCP)

Main article: [Develop AI agents on
Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-agents) -
[Agents in Azure AI
Solutions](id:eae5da2e-f013-42af-8128-cc2ae5c28b0f) - see section of
description of MCP and MCP processes

## MCP and Agents

Source: [MCP vs. RAG: How AI Agents & LLMs Connect to Data - IBM -
YouTube](https://www.youtube.com/watch?v=X95MFcYH1_s) with Melissa
Hadley, [MCP vs API: Simplifying AI Agent Integration with External
Data - IBM - YouTube](https://www.youtube.com/watch?v=7j1t3UZA1TY) with
Martin Keen

MCP allows agents to **act** by accessing systems and data. Agent can:

- Discover available systems, data sources using MCP:
  - Tools
  - Application Programming Interface (API)
  - Resources
  - Prompt templates
- Understand user request, plan what tools to use
- Execute using tools from MCP server
- Integrate information and systems

## Differences in API and MCP and Strengths of Both

| Use Case  | MCP                    | API               |
|-----------|------------------------|-------------------|
| Purpose   | Built for AI           | General purpose   |
| Discovery | Dynamic on connection  | Fixed on releases |
| Interface | Same protocol, pattern | Unique            |

MCP works well with APIs underneath.

To use the strengths of both, have AI use MCPs to discover API usage and
other systems.

## Tools and Processes in Context Engineering

If an agent must follow a process, use a skills. The skill can define
using MCP for example to access and manage data.
