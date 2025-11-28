---
description: How to use Deepseek R1 and AI open source tools locally
filetags: ":artificial-intelligence:ai:models:epubnote:"
id: 4ca0b4b4-ef4e-4eeb-b4a6-7537215aca53
title: Deepseek R1 Locally, Open-Source Ai Tools, ollama, automation,
  RAG
---

Source: [Deepseek R1 Locally \| Top 5 Free Open-Source Ai Tools \|
Ollama \| Automation \| RAG -
YouTube](https://www.youtube.com/watch?v=hjg9kJs8al8) by Hasan-Py

## Topics

- How to use Deepseek R1 locally
- Using Ollama to run models locally
- How to use AI open source tools for automation and retrieval augmented
  generation (RAG)
  - RAG: System takes your data and stores it, during prompts, will use
    the data store with LLM to provide answers

## Overview of Tools

- Use local computer tools: terminal / command line interface, ollama,
  large language models (LLM) wrapper

## ollama

- ollama to access and run large language models (LLM) like Llama,
  Deepseek, Mistral
  - [Install ollama](https://ollama.com/)
  - [Find models you can download with
    ollama](https://ollama.com/library)
    - Select an appropriate model, like 1.5b (billion) which is smallest
      model depending on power of your computer
      - Smaller models like 1.5b, 7b ok for CPU only use
    - Example: `ollama run deepseek-coder:1.3b`

## Large Language Models (LLM) Wrapper

Use an LLM wrapper to call model, like a web page

- [Page-Assist](https://github.com/n4ze3m/page-assist): Browser
  extensions using existing ollama running models

- [open-webui](https://github.com/open-webui/open-webui) - full featured
  web application wrapper

  - Install NodeJS, Python, git, then open-webui
  - Run application

### Common features of wrappers

- Select model
- Has voice read out loud, copy, regenerate, OCR, speech to text (record
  voice)
- Model settings
- Retrieval augmented generation (RAG)
- User settings
- Other data, export chats

### Automation

- [browser-use](https://github.com/browser-use/browser-use)
  - Prompt based browser automation
  - Setup similar to open-webui
  - Open web application for settings, model settings, can use ollama
    and select local model
  - Run agent with prompt
- [n8n](https://github.com/n8n-io/n8n) - workflow automation tool
  - Integrations with many services (examples: Google, database) and AI
  - Web application
  - Low code step based process automation through a diagram
    - Example:
      - Add trigger like manual trigger
      - Manual chat input
      - Basic LLM Chain
        - Add model and choose Ollama Model, can change models, options
        - Add 1st prompt
        - Optional: add further LLM chain of commands
    - Example 2:
      - AI Agent
        - Model
        - Memory
        - Tool to use
          - Like a service and API access
  - Immediately test flows
  - Support automation with code as well

### Code Tools

- [Roo-Code](https://github.com/RooVetGit/Roo-Code ) - VS Code extension
  - Select ollama and model like deepseek-coder

## See Also

- [Snippets ollama](/garden/notes/005-computer-snippets-ollama) - [Snippets
  ollama](id:43ecce4a-30f7-4d84-a7fb-7b12e7bc46d0)

### Resources

- Page-Assist Chrome Extension - <https://github.com/n4ze3m/page-assist>
  (any model with any params)
- Open Web-UI LLM Wrapper - <https://github.com/open-webui/open-webui>
  (any model with any params)
- Browser use – <https://github.com/browser-use/browser-use> (deepseek
  r1:14b or more params)
- Roo-Code (VS Code Extension) – <https://github.com/RooVetGit/Roo-Code>
  (deepseek coder)
- n8n – <https://github.com/n8n-io/n8n> (any model with any params)
- A simple RAG app: <https://github.com/hasan-py/chat-with-pdf-RAG>
  (deepseek r1:8b), by author of source video
- Ai assistant Chrome extension:
  <https://github.com/hasan-py/Ai-Assistant-Chrome-Extension> (GPT,
  Gemini, Grok Api, Ollama added recently)
