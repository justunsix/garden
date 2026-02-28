---
date: 2025-11-21
filetags: ":ai:artificial-intelligence:copilot:github:microsoft:epubnote:"
id: 871c6593-9b29-489e-ab0d-3a999bc1531a
title: Microsoft GitHub Copilot
---

Source: My personal notes from Microsoft training sessions in 2025, 2026

## Why use GitHub Copilot?

Use case: Doing computer programming with an assistant.

Using AI to improve productivity with code summaries, analysis,
generation, and other methods.

## Example Use Cases

Create documentation: Write an architecture markdown file describing the
project and its code.

Improve code: Improve the user interface of the application to modernize
the interface.

Testing: Write a test case

Troubleshooting: Analyze this code and error for solution options.

Inquiry: Ask questions on code, documentation

## Features

- Selection of different models depending on purpose and trying
  different responses
- Code completion
- Chat - discussions with agent
  - Create code, make changes
  - Assess application, tests/looks at it, do code, test, and submit
    pull request for review
  - Ask to execute tasks, assign tasks to Copilot in GitHub and it can
    do pull requests:
  - Ask, edit, agent task execution, plan
- Provide system prompt in instructions for AI to always follow

### Technical Features

- Connect to [Model Context Protocol (MCP)
  server](https://docs.github.com/en/copilot/concepts/context/mcp) to
  use tasks
- Interaction methods: IDE integration, CLI, GitHub web
- [Index files for chat,
  context](https://docs.github.com/en/copilot/concepts/context/repository-indexing)
  for semantic search
- [Custom
  instructions](https://docs.github.com/en/copilot/how-tos/configure-custom-instructions/add-repository-instructions)
  for example using path specific instruction files

## Instructions for Using Microsoft GitHub Copilot

Source: [GitHub Copilot
documentation](https://docs.github.com/en/copilot), [What is GitHub
Copilot? - GitHub Enterprise Cloud
Docs](https://docs.github.com/en/enterprise-cloud@latest/copilot/about-github-copilot/what-is-github-copilot)

Github (Enterprise) Copilot user settings and other instructions:
[GitHub Copilot Settings](https://github.com/settings/copilot)

For GitHub Enterprise, when prompted to login, choose GitHub Enterprise
login.

- Try accessing it, for example inside Visual Studio / Visual Studio
  Code or tool of your choice.
- If using Visual Studio, it can look like a different account than the
  account used by Visual Studio.

For example, using VS Code, install VS Code and the GitHub Copilot
extension, then use sign into GitHub account.

## Model Context Protocol (MCP)

Can interact with external resources to do tasks for you and needs to be
secured [using
MCP](https://docs.github.com/en/copilot/concepts/context/mcp).

Examples: interact with JIRA tickets, work on Azure resources

## Models

Multiple models are available for Copilot users. Example: Gemini, OpenAI
models like GPT, Anthropic. Pricing can vary on better models and
request types.

To see models context size and capabilities, see [AI model comparison -
GitHub Copilot
Docs](https://docs.github.com/en/copilot/reference/ai-models/model-comparison)
or in VS Code "Manage Models" function with models.

## Demonstration of Use Case of Building an Application

Use principles from [AI Prompts](/garden/notes/006-3-tech-ai-prompts) - [AI
Prompts](id:0a00398f-f4d9-42ae-8830-c37fa9abdc8f) to give instructions
to Copilot.

### Examples on an existing repository with a Calculator

Create architecture documentation and diagrams in mermaid for this
repository.

The web app looks outdated. Modernize the app and make it stylish by
adding different themes. Add more functionality to the app like
scientific calculator functions.

Add a custom instructions file in repository to set up themes and
developer preferences and standards.

## Workspace Index

Main article: [GitHub Copilot Workspace Index and Retrieval Augmented
Generation
(RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag-github-copilot-workspace-index) -
[GitHub Copilot Workspace Index and Retrieval Augmented Generation
(RAG)](id:1ae880da-6df5-4bcb-9463-27955b9f1654)

GitHub Copilot can index files in a workspace for use with prompts,
search, and for use as context.

## See Also

### Resources

- [GitHub Advanced
  Security](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security)
- [Awesome Copilot /
  GitHub](https://github.com/github/awesome-copilot) -
  Community-contributed instructions, prompts, and configurations to
  help you make the most of GitHub Copilot
- [Spec Kit / GitHub](https://github.com/github/spec-kit) - Toolkit to
  help you get started with Spec-Driven Development
- [GitHub Videos with Demos](https://www.youtube.com/@GitHub)
- [Visual Studio GitHub Copilot Lab \| .NET
  Edition](https://dotnet-presentations.github.io/visual-studio-github-copilot-lab/)
- [GitHub Copilot - GitHub
  Changelog](https://github.blog/changelog/label/copilot/)
- [GitHub Copilot fundamentals - Understand the AI pair programmer -
  Training \| Microsoft
  Learn](https://learn.microsoft.com/en-us/training/paths/copilot/)
- [Making chat an expert in your workspace - VS Code
  Indexing](https://code.visualstudio.com/docs/copilot/reference/workspace-context)
- [Overview of GitHub Copilot Integration with MSSQL Extension for
  Visual Studio Code - SQL
  Server](https://learn.microsoft.com/en-us/sql/tools/visual-studio-code-extensions/github-copilot/overview?view=sql-server-ver17) -
  Chat with your Database
