---
filetags: ":ai:artificial-intelligence:epubnote:"
id: 4a445fad-74c1-42c9-bba8-fe0c067b6d23
title: Retrieval Augmented Generation (RAG)
---

## What is Retrieval-Augmented Generation (RAG)

Source: [What is Retrieval-Augmented Generation (RAG)? -
YouTube](https://www.youtube.com/watch?v=T-D1OfcDW1M&t=27s) by Marina
Danilevsky at IBM

### Generation Example

- Asking which planet in the solar system has the most moons?

- Large Language Model (LLM) Challenges

  - No source of information - just trained information
  - Out of date - there are more moons discovered over time

- LLM could confidently give a wrong answer like planet Jupiter when it
  could be Saturn as moons are discovered

  - It needs to have authoritative sources like Nasa and up to date
    data.

### Retrieval-Augmented

- LLM gets relevant data from updated data set and gives response with
  evidence of the response
  - It can say I don't know when the data is not available
- Needs work on 2 parts:
  - Retrieval Augmented - better retrievers to find most relevant data
    to user prompts
  - Generation - structuring responses and best responses

## RAG Explained

Soure: [RAG Explained](https://www.youtube.com/watch?v=qppV3n3YlF8) -
YouTube by Luv Aggarwal and Shawn Brennan at IBM

- Use case: Journalist is researching a topic using library, need to
  check relevant books. They ask librarian (expert on finding
  information) for books on certain topics so journalist (expert on
  content) can assess. Users trust the data in books.
  - RAG similarities:
    - User/machine (journalist) has questions
    - Prompt uses LLM
    - Get multiple sources of data, put data in vector database (math
      representation of structured and unstructured data).
    - LLM uses vector database to provide answers
- Risk mitigation of bias, hallucinations:
  - Verify input data quality is clean, governed
  - Choose appropriate LLM

## See Also

- [AI Retrieval Augmented-Generation RAG and Large Language Model
  LLM](../006-3-tech-ai-retrieval-augmented-generation-rag-llm) - [AI
  Retrieval Augmented-Generation RAG and Large Language Model
  LLM](id:86f6f51e-26ce-4b1f-bd3f-5451b5ae56a6)
- [Local AI with Retrieval Augmented Generation (RAG) using Open WebUI
  and
  Ollama](../006-3-tech-ai-retrieval-augmented-generation-rag-local-open-webui-ollama) -
  [Local AI with Retrieval Augmented Generation (RAG) using Open WebUI
  and Ollama](id:19319abe-7f4f-4eb7-a953-5f3fc197cf34)
- [Vector Database](../006-3-tech-ai-vector-database) - [Vector
  Database](id:67032821-f795-4059-bc63-ae4adada458a)
