---
date: 2024-02-25
id: 5f3fb72d-cc33-4c99-b553-5962dc6909e7
title: Microsoft Azure OpenAI
---

Source: [Azure OpenAI
Service](https://azure.microsoft.com/en-us/products/cognitive-services/openai-service),
[OpenAI in Azure](https://www.youtube.com/watch?v=3t3qZu1Dy1k)

## Services

- GPT 3.5 - natural language
- Codex - code, development
- DALL-E 2 = text to image

### Flow

- OpenAI studio \> test \> bring into code \> call REST API
- Detects and mitigates against malicious use
- Protected by responsible AI and security access

1.  Model Interactions

    - "Zero shot": Text input given to AI for output. AI Model only uses
      inputs
    - "Few shot": Text input with examples and AI, train on the fly, and
      AI output
      - Provide a bit of guidance to model
      - Seed information/words

### Examples of Usage

- Copilot in Power Platform
- Microsoft Designer
  - Generate image from natural language to place into designs
- Minecraft
  - Codex to translate natural langauge commands into Minecraft commands
    to create objects
    - Built using "few shot" learning, by providing correct commands
      with natural language input
- Azure Cognitve search \> search to retrieve relevant documents \>
  documents parsed by GPT 3 \> output sent to user of relevant results

## Using Azure OpenAI Studio

- Use Azure OpenAI service, apply for access

### Using the Playground

- Use AI for creative output like asking for branding ideas
  - Seed words
  - Provide prompt for what AI should do
  - Provide examples of what you want, like text example output you
    expect, adjust things like conciseness and format of answer for AI
    to learn using "few shot"
- Test prompts and results for accuracy
- Fine tune and custom models:
  - Choose base model with additional base data
