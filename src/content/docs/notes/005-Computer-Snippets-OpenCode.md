---
filetags: ":snippets:opencode:artificial-intelligence:ai:assitant:epubnote:"
id: b4a90465-b044-47c1-8c6c-a93124d9dfbe
title: OpenCode Snippets
---

Source: [OpenCode Documentation](https://opencode.ai/docs)

Terminal User Interface (TUI) Commands

``` shell

# Connect to a provider, for example Amazon Bedrock, Anthropic, Azure, GitHub Copilot, OpenAI, Ollama and others
/connect

# Select user interface theme
/theme

# Select models
/model

# Initialize OpenCode for project after cd into project directory, create AGENTS.md
/init

# Undo changes
/undo

# Redo changes
/redo

# View sessions
/sessions

# Start sub agent
@code-reviewer
@security-engineer

# Manage skills
/skills

# Use skill called skill-name
/skill-name
/find-skills

# Quit, Exit
/exit
/q

# Reference file with @
How is authentication handled in @packages/functions/src/api/index.ts

# Include file and line numbers in prompt context
Review @README.md#5-10

```

## Command Line Interface (CLI)

``` shell

# Open opencode with directory as context
opencode

# Help
opencode -h

# Create a new agent with guide, prompt injections
opencode agent create

# Manage sessions
opencode session
# Manage sessions, List them
opencode session list

```

## OpenCode Configuration

### Microsoft Documentation MCP Server

Source: Configuration originally from [MCP Servers - microsoft/skils -
GitHub](https://github.com/microsoft/skills?tab=readme-ov-file#mcp-servers)

``` json

{
  "$schema": "https://opencode.ai/config.json",
  "mcp": {
    "microsoft-docs": {
      "type": "remote",
      "url": "https://learn.microsoft.com/api/mcp"
    }
  }
}

```
