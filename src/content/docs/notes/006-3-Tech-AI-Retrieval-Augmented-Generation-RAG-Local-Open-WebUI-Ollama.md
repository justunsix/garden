---
date: 2025-03-28
filetags: ":ai:artificial-intelligence:rag:epubnote:"
id: 19319abe-7f4f-4eb7-a953-5f3fc197cf34
title: Local AI with Retrieval Augmented Generation (RAG) using Open
  WebUI and Ollama
---

Sources:

- [Build Your Local AI: From Zero to a Custom ChatGPT Interface with
  Ollama & Open WebUI \| by Peter Alexandru Hautelman \| Mar, 2025 \|
  Medium](https://medium.com/@hautel.alex2000/build-your-local-ai-from-zero-to-a-custom-chatgpt-interface-with-ollama-open-webui-6bee2c5abba3)
- [Open WebUI tutorial — Supercharge Your Local AI with RAG and Custom
  Knowledge Bases \| by Peter Alexandru Hautelman \| Mar, 2025 \|
  Medium](https://medium.com/@hautel.alex2000/open-webui-tutorial-supercharging-your-local-ai-with-rag-and-custom-knowledge-bases-334d272c8c40)
- [Open WebUI Documentation](https://docs.openwebui.com/)

## Running artificial intelligence locally on your computer

Run a local a large language model (LLM) on your local computer to have
benefits of save costs, privacy, and get more features and
customization. Disadvantages is needing a computer that can run the
models, technical knowledge, and time.

## Tools being used

- [Ollama](https://github.com/ollama/ollama) - framework to run LLMs
  locally
- [OpenWebUI](https://github.com/open-webui/open-webui) - user interface
  to interact with Ollama, it also support talking to other interfaces
  - Has things like chat, model configuration, retrieval augmental
    generation (RAG), and other features
- [Python](https://www.python.md/) - programming language

### Hardware Requirements

A computer with at least a graphics processing unit (GPU) with minimum
4GB GPU memory, 8GB+ recommended, 20 GB free disk space, and a browser

## Setting up AI Locally with ollama, open-webui and Python

For detailed steps, see the source articles. High level steps are:

- Install the tools
- Set up a Python virtual environment
- Use Ollama's online list of models to select an appropriate model.
  Here are examples: [AI Models](../006-3-tech-ai-models) - [AI
  Models](id:65533479-7d6e-4726-92f8-fb66177a39c6)
  - Can start with a smaller model of 7B parameters or less
  - Run ollama models using [ollama
    Snippets](../005-computer-snippets-ollama) - [Snippets
    ollama](id:43ecce4a-30f7-4d84-a7fb-7b12e7bc46d0)
- Install open-webui in the Python virtual environment and start it,
  then access the web application user interface in your browser

Assuming Python, Ollama, and Python Environment and package tools like
pip are installed:

``` shell

# Create and activate a Python virtual environment, assume use python 3.11 or higher
python -m virtualenv ./venv
source ./venv/bin/activate

# Run a small model and exit out of the chat interface with Ctrl + D
ollama run phi4-mini

# Install and run open-webui
pip install open-webui
open-webui serve

```

Go to the localhost site for Open WebUI to see interface for chat,
models, chat controls, and settings.

### Configuring open-webui setup for search, code use, and models

- Web search: allows using web search results
  - Settings \> Admin \> Web Search, choose and set up API
- Code Interpreter: allows writing and execution of Python code in chat,
  changes from chat to AI being able to do work with a programming
  language
  - Settings \> Admin \> Code Execution, toggle switch
  - Advantages: Instead of just text chat, AI can run programs to help
    solve problems
- Custom model: customize how an AI model behaves
  - Workspace \> Models \> Create New
  - Set things like system prompt

## Using Local artificial intelligence (AI) with Retrieval Augmented Generation (RAG) and Existing Documents

See [Local AI with Retrieval Augmented Generation (RAG) using Open WebUI
and Ollama System and
Setup](../006-3-tech-ai-retrieval-augmented-generation-rag-local-open-webui-ollama-system) -
:roam:
