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

## Models

Multiple models are available for Copilot users. Example: Gemini, OpenAI
models like GPT, Anthropic. Pricing and quotes will vary on better
models and request types.

To see models context size and capabilities, see [AI model comparison -
GitHub Copilot
Docs](https://docs.github.com/en/copilot/reference/ai-models/model-comparison)
or in VS Code "Manage Models" function with models.

Also see for other [AI Models](/garden/notes/006-3-tech-ai-models) - [AI
Models](id:65533479-7d6e-4726-92f8-fb66177a39c6) for possible use with
CLI.

## Demonstration of Use Case of Building an Application

Main article: [GitHub Copilot, Building a Full Stack
Application](/garden/notes/006-3-tech-ai-microsoft-github-copilot-building-a-full-stack-application) -
[GitHub Copilot, Building a Full Stack
Application](id:df455313-58fd-4658-ab23-76597a349174)

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

## Instructions, Skills, Agents, Model Context Protocol (MCP), CLI

Source: [GitHub - haslam93/FY26—Advanced-GitHub-Copilot-Workshop:
Advanced GitHub Copilot workshop covering Advanced Topics ·
GitHub](https://github.com/haslam93/FY26---Advanced-GitHub-Copilot-Workshop)

### Instructions

Provide instructions to copilot using `.github/copilot-instructions.md`
and `AGENTS.md`. In VS Code, can use provide instructions function.

Include:

- Language and runtime
- Naming conventions
- Architecture
- Requirements (Security, documentation standards)
- Restrictions of specific files like apply only to certain type of
  files (example \*.java files)

Copilot also respect Claude code files and configurations like
`.claude/rules`

#### Prompt files

Saved as `.github/*.prompt.md`

Instructions for specific things like code review, new developer review.
In VS Code GitHub Copilot chat, reference using `/prompt-file`

### Custom Agents

[Custom agents for
tasks](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
like documentation, research, DevOps and others can be created at
`.github/agents`. They are natural language instructions for tasks and
assigned tools and resources to access. Example custom agent files are
at [awesome-copilot/agents at main · github/awesome-copilot ·
GitHub](https://github.com/github/awesome-copilot/tree/main/agents) or
build your own.

### Skills

Provides Copilot with additional functionality like programming language
files like Python to do work for specific tasks. Example is creating
presentations in HTML and PowerPoint.

### Background Agents

Use case: for tasks that can be executed reliably by an agent and it has
clear steps and required input and output.

Example: Write an issue and draft pull request for git repository.

### Model Context Protocol (MCP)

Can interact with external resources to do tasks for you and needs to be
secured [using
MCP](https://docs.github.com/en/copilot/concepts/context/mcp).

In VS Code, need to install local MCP servers for use by the agent and
remote MCP servers can be used.

Examples: interact with JIRA tickets, work on Azure resources, use
websites (use playwright MCP server), test an application

### Copilot Command Line Interface (CLI)

Run with `copilot`, can be run interactively and as single command with
single task and output/results.

CLI can be configured. During use, can select model and configure it.

#### Features

- Autopilot: With a requirement, CLI does many tasks until it believes
  outcome is complete.
- `/fleet` can use multiple models depending on prompt
- Other local and open source models can be used with CLI

### Context Management

Keep instructions concise and include detailed instructions in prompt
files instead

## Application Development

Source: [GitHub - haslam93/FY26—Advanced-GitHub-Copilot-Workshop:
Advanced GitHub Copilot workshop covering Advanced Topics ·
GitHub](https://github.com/haslam93/FY26---Advanced-GitHub-Copilot-Workshop)

### Application Modernization

VS Code has extensions for .NET and Java Upgrade Assistance with
Copilot. More powerful than individual prompts since it plans changes.

### Quality Assurance, Testing

Analyze code and determine possible test cases and code coverage. For
specified pages and components, write integration/unit tests and ensure
accessibility requirements.

Example: Playwright user interface testing using MCP.

### Database

In VS Code, can use database extensions like SQL Server (mssql). It has
tools like analyzing a database and running queries. Copilot can access
these tools; however, be careful due to modification and good practice
is use AI assistance on database only in a non-production environment.

### Coding use cases

- Reviewing changes, pull requests
- Optimize code or make suggestions
- GitHub.com agents can help with code review, tests, fixes, branches
  and commits

## See Also

- [GitHub Copilot, Building a Full Stack
  Application](/garden/notes/006-3-tech-ai-microsoft-github-copilot-building-a-full-stack-application) -
  [GitHub Copilot, Building a Full Stack
  Application](id:df455313-58fd-4658-ab23-76597a349174)

### Resources

- [GitHub Advanced
  Security](https://docs.github.com/en/get-started/learning-about-github/about-github-advanced-security)
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

#### Prompts, Configurations, Agents

- [Awesome Copilot /
  GitHub](https://github.com/github/awesome-copilot) -
  Community-contributed instructions, prompts, agent information, and
  configurations to help you make the most of GitHub Copilot
- [GitHub - githubabcs-devops/gh-advsec-devsecops: Agentic AI for
  DevSecOps: Transforming Security with GitHub Advanced Security and
  GitHub Copilot. GitHub Advanced Security - DevSecOps Guidelines -
  Unified visibility into DevOps security posture. DevSecOps E2E Demos.
  · GitHub](https://github.com/githubabcs-devops/gh-advsec-devsecops)
- [GitHub - microsoft/hve-core: A refined collection of Hypervelocity
  Engineering components (instructions, prompts, agents) to start your
  project off right, or upgrade your existing projects to get the most
  out of all Copilots · GitHub](https://github.com/microsoft/hve-core)
