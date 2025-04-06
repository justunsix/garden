---
filetags: ":ai:artificial-intelligence:local-ai:epubnote:"
id: 6974a978-1e00-41ac-9a25-83b728abf9d2
title: Build a Local Artificial Intelligence System
---

## DIY AI Infrastructure: Build Your Own Privacy-Preserving AI at Home

Source: [DIY AI Infrastructure: Build Your Own Privacy-Preserving AI at
Home - IBM Technology on
YouTube](https://www.youtube.com/watch?v=BvCOZrqGyNU)

## Run AI Models Locally with Ollama

Source:

- [Run AI Models Locally with Ollama: Fast & Simple Deployment - IBM
  Technology on YouTube](https://www.youtube.com/watch?v=uxE8FFiu_UQ)
- [GitHub -
  rh-rad-ai-roadshow/parasol-insurance](https://github.com/rh-rad-ai-roadshow/parasol-insurance?utm_medium=OSocial&utm_source=Youtube&utm_content=WAIWW&utm_id=YT-Applied-AI-Ollama-&-Local-Data)
  with code explained in video

Run a large language model (LLM) on your local machine to save time by
using your own machine (no need to create accounts or infrastructure)
and keep your data private.

Steps:

- Install `ollama` and choose a model to run like examples from [AI
  Models](../006-3-tech-ai-models) - [AI
  Models](id:65533479-7d6e-4726-92f8-fb66177a39c6) which can be ollama
  models and models from Hugging Face
- Download the model, use a quantized model, meaning a compressed model
  for use on limited hardware
- Start an inference server to chat with the model
- Use llama C plus plus to run the model
- During a chat, there will be a post request to the local API to get
  the response

``` shell

# Model features: multilingual, RAG, enterprise use case
ollama run granite3.1-dense

# Chat or /bye to quit

```

## Using ollama with an application

Technologies:

- LangChain for Java, standard API to make calls to the model
  - Use LangChain dependency and point to local API endpoint
- Quarkus (Kubernetes optimized) to run the application

## See Also

- [ollama Snippets](../005-computer-snippets-ollama) - [Snippets
  ollama](id:43ecce4a-30f7-4d84-a7fb-7b12e7bc46d0)
- [AI Models](../006-3-tech-ai-models) - [AI
  Models](id:65533479-7d6e-4726-92f8-fb66177a39c6)
- [Local AI with Retrieval Augmented Generation (RAG) using Open WebUI
  and
  Ollama](../006-3-tech-ai-retrieval-augmented-generation-rag-local-open-webui-ollama) -
  [Local AI with Retrieval Augmented Generation (RAG) using Open WebUI
  and Ollama](id:19319abe-7f4f-4eb7-a953-5f3fc197cf34)
