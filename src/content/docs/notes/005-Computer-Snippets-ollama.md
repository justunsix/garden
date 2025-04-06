---
filetags: ":ai:artificial-intelligence:ollama:llm:epubnote:"
id: 43ecce4a-30f7-4d84-a7fb-7b12e7bc46d0
title: ollama Snippets
---

``` shell

# Install Ollama like using curl or package manager

# Run and chat with Llama 3.2 model
## Exit using C-d or /bye
ollama run llama3.2

# List Ollama models
ollama list

# List loaded models
ollama ps

# Stop running model
ollama stop llama3.2

# Will run mistral instruction or install if not present
ollama run mistral:instruct '<instruction>'

# Run model from Hugging Face
ollama run hf.co/{username}/{repository}:{quantization}

# Pull model, e.g mistral
## See library of models https://ollama.com/library
ollama pull mistral

# Remove model
ollama rm mistral

# Run without desktop app
ollama serve

# Check settings
ollama show

# Set context window
OLLAMA_CONTEXT_LENGTH=8192 ollama serve
# By default, Ollama uses a context window size of 2048 tokens.
# This can be overridden with the OLLAMA_CONTEXT_LENGTH environment variable
# Example above sets the default context window to 8K

# Set up a Modelfile for model pre-prompting
ollama pull llama3.2
vim Modelfile
## Paste parameters, for example respond like you are ...

```
