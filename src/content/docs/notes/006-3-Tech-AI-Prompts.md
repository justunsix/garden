---
filetags: ":ai:artificial-intelligence:prompts:epubnote:"
id: 0a00398f-f4d9-42ae-8830-c37fa9abdc8f
title: AI Prompts
---

## Writing Prompts

See "Improve Prompt Results" section of [Microsoft Azure AI
Fundamentals, Generative
AI](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-generative-ai) -
[Microsoft Azure AI Fundamentals: Generative
AI](id:4e618b1d-6f89-4eb3-811b-be31133ea2f3) from [Improve prompt
results - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/fundamentals-generative-ai/6-writing-prompts)

Good prompts provide the AI with:

1.  Goal (what you want), see tasks below
2.  Context (people involved, why you need something), see job types
    below
3.  Information sources to use (attachments, documents, links, meetings)
4.  Expectation on what you want (tone, type of output, format, response
    length and details like sources, examples of results you want like
    few shot method)
5.  Iterate on the previous prompt

Other tips:

- Use positive instructions, tell model what to do instead of what not
  to do
- Be specific and detailed and avoid "what does this do" where "this" is
  unclear or prompts with a large scope of possible results
- Use terms likely to appear in the context or expected results

## Example Task Template

### In Markdown

``` md

## TASK: <Short Action Summary>

**ID:** task-2026-04-14-001
**Status:** Queued
**AI Role:** Analyst
**AI Model:** auto (automatically select best model)
**Output Type:** Written Analysis

---

### 1. Goal
Clearly state what you want accomplished.
- Desired outcome
- Definition of complete

---

### 2. Context
- History
- Audience / people involved
- Constraints (time, politics, sensitivities, costs)

---

### 3. Information Sources
- **Attachments:**
  - doc1.pdf
  - requirements.md
  - python_code.py

- **Links:**
  - [1]

- **Meetings / Notes:**
  - [2]

---

### 4. Expectations
- **Tone:**
- **Output format:**
- **Length:**
- **Structure:**

```

### In Emacs Org Mode - \<Short Action Summary\>

``` org

,:PROPERTIES:
,:ID: task-2026-04-14-001
,:STATUS: draft
,:AI_ROLE: analyst
,:AI_MODEL: gpt-4.1
,:OUTPUT_TYPE: written_analysis
,:END:

**** 1. Goal
Clearly state what you want accomplished.
- Desired outcome
- Definition of task complete

**** 2. Context
- History
- Audience / people involved
- Constraints (time, politics, sensitivities, costs)

**** 3. Information Sources
- Attachments: doc1.pdf, requirements.md, python_code.py
- Links:
  - [1]
- Meetings / Notes:
  - [2]

**** 4. Expectations
- Tone:
- Output format:
- Length:
- Structure:
```

### Example - Create Cloud Architecture Decision Summary

#### 1. Goal

Produce a concise architecture decision summary suitable for senior
leadership.

Success = clear recommendation with pros and cons.

#### 2. Context

- Audience: Director level
- Decision impacts current fiscal budget
- Prior discussion was fragmented

#### 3. Information Sources

- Architecture options doc (arch-options-v3.pdf)
- Cost estimates spreadsheet
- Meeting notes from 2026-04-14

#### 4. Expectations

- Tone: Neutral, professional
- Format: 1 page memo
- Structure:
  - Background
  - Options
  - Recommendation
- Length: ~400 words
- Examples: AWS decision memos

## Tasks and Jobs for Prompts

Example Tasks and Job Types for Prompts from [Microsoft Copilot Prompts
Gallery](https://copilot.cloud.microsoft/en-GB/prompts) with tips,
examples with my additions

### Tasks

- Catch up
- Create
- Ask
- Understand
- Learn
- Schedule
- Edit
- Prepare
- Analyse
- Code
- Find
- Design
- Execute
- Ideate

### Job Types

#### Department

- Accessibility
- Frontline Management
- Executive
- Human Resources
- Marketing
- Sales
- Communications
- Marketing
- Operations
- Finance
- Project Management
- Information Technology
- Customer Service
- Legal

#### Industry

- Manufacturing
- Retail
- Sustainability
- Financial Services
- Energy
- Consumer Goods
- Mobility
- Nonprofit
- Government
- Healthcare
- Media and Entertainment
- Education - Student / Faculty

### Agentic Prompts

Write a file like in markdown with:

- Problem / Goal
- Explain agent's role
- Tasks to follow
- Response expectations
- Example results and/or resources for agent to refer to

## See Also

- [AI Prompt Examples by
  Topic](/garden/notes/006-3-tech-ai-prompts-examples-by-topic) - [AI Prompt
  Examples by Topic](id:cefc972f-c8e0-41d1-a420-271b8a1e911a)

### Resources

- [Learn about Copilot
  Prompts](https://support.microsoft.com/en-gb/topic/learn-about-copilot-prompts-f6c3b467-f07c-4db1-ae54-ffac96184dd5)
- [50 Awesome ChatGPT
  Prompts](https://www.reddit.com/r/ArtificialInteligence/comments/17k8rsn/50_awesome_chatgpt_prompts/)
  from Reddit
