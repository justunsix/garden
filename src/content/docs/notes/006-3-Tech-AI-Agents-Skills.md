---
filetags: ":artificial-intelligence:ai:epubnote:agent:skills:"
id: d7640e01-a590-4892-87a2-704715f4bb8e
title: Artificial Intelligence (AI) Agents Skills
---

## About AI Agent Skills

Source: [What AI Agent Skills Are and How They Work - IBM -
YouTube](https://www.youtube.com/watch?v=Lg-meK5IU8Q) with Martin Keen

Use case: AI agents are good at getting information, but weak at
procedural knowledge like creating a financial report using 30 steps or
how to ride a motorcycle in Rome Italy safely. Skills address this
weakness by giving the agent the process to follow.

Skills answer what to do, the order to do them, and judgment. They teach
an agent how to do a job (a repeatable task).

### Creating a Skill

Creating a skill is creating a `SKILL.md` markdown file with name,
description describing when the skill applies.

``` markdown

---
name: pdf-builder
description: Use when the user asks to extract a PDF
---

# PDF Builder

Instructions to agent, for example read content, run command to build PDF

```

Optional skill folders:

- `/scripts/`
  - Programming language files agent can run like Python, bash, Java
- `/references/`
  - Documentation
- `/assets/`
  - Data files
  - Templates

### Loading Skills using Progressive Disclosure

Agent is given name and description of skills it has access to. Like an
index of skills. This approach reduces context needed (reduce token
use).

If agent finds a description that is useful, it will load the
`skill.md`. Optional folders are only loaded when a task is required.

### Knowledge: MCP, RAG, Fine tuning, and Skills

- Model Context Protocol (MCP) - gives tool access
- Retrieval Augmented Generation (RAG) - facts, knowledge
- Fine tuning - adjusts model weights
- Skills - procedural knowledge, when to use other knowledge

### Skills.md format

Open standard published at [Agent Skills Overview - Agent
Skills](https://agentskills.io/home)

``` text

my-skill/
├── SKILL.md          # Required: metadata + instructions
├── scripts/          # Optional: executable code
├── references/       # Optional: documentation
├── assets/           # Optional: templates, resources
└── ...               # Any additional files or directories

```

### Memory

Semantic memory –\> RAG

Episodic memory –\> Conversation logs, interaction history

Procedural memory –\> Skill files

### Trust and Skills

Skills can have access to scripts that run on the user's machine,
environment variables, and secrets. Review skills before using them.

## See Also

- [Develop AI agents on
  Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-agents)
