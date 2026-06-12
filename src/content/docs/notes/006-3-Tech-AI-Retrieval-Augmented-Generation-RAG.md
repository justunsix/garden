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

Asking which planet in the solar system has the most moons?

Large Language Model (LLM) Challenges

- No source of information - just trained information
- Out of date - there are more moons discovered over time

LLM could confidently give a wrong answer like planet Jupiter when it
could be Saturn as moons are discovered. It needs to have authoritative
sources like NASA and up to date data.

### Retrieval-Augmented

LLM gets relevant data from updated data set and gives response with
evidence of the response. RAG improves a model's performance with
updated and domain specific information to give accurate and relevant
answers.

It can say I don't know when the data is not available or use the data
for grounding like document files.

Needs work on 2 parts:

- Retrieval Augmented - better retrievers to find most relevant data to
  user prompts
- Generation - structuring responses and best responses

## Search Strategies

See different search approaches with RAG in article [GitHub Copilot
Workspace Index and Retrieval Augmented Generation
(RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag-github-copilot-workspace-index) -
[GitHub Copilot Workspace Index and Retrieval Augmented Generation
(RAG)](id:1ae880da-6df5-4bcb-9463-27955b9f1654).

## RAG Explained

Source: [RAG Explained](https://www.youtube.com/watch?v=qppV3n3YlF8) -
YouTube by Luv Aggarwal and Shawn Brennan at IBM

Use case: Journalist is researching a topic using library, need to check
relevant books. They ask librarian (expert on finding information) for
books on certain topics so journalist (expert on content) can assess.
Users trust the data in books.

RAG similarities:

- User/machine (journalist) has questions
- Prompt uses LLM
- Get multiple sources of data, put data in vector database (math
  representation of structured and unstructured data).
- LLM uses vector database to provide answers

Risk mitigation of bias, hallucinations involve (1) Verify input data
quality is clean, governed and (2) choose appropriate LLM

## Agentic RAG

Source: [RAG's Evolution: From Simple Retrieval to Agentic AI - IBM -
YouTube](https://youtu.be/JB2P5Gk23VI), [How RAG, GraphRAG, and Context
Engineering Improve AI Performance - IBM -
YouTube](https://youtu.be/pN-LfxNFiTc)

Search approaches:

1.  Keywords - relies on users asking with the right keywords
2.  Semantic search - words and their relationships, intent is
    understood

Hybrid search: Keywords search (precision) and semantic vector search
(recall) complement each other to get relevant results.

- Precision measures how many predicted positives are true positives
- Recall measures how many actual positives were correctly predicted

1.  Retrieval augmented generation (RAG)
    - Enhanced RAG
      - Pipelines added re-rankers to re-order results to be more
        relevant
      - User queries re-worded to improve recall
      - Hybrid retrieval - uses keyword and semantic search
    - Agentic RAG uses LLMs, memory, planning, critics, retrievers.
      Agent can decide:
      - Is retrieval needed?
      - What question to ask
      - Where to search
      - What retrievers to use
      - Compare sources
      - Validate data
      - Refine queries
      - Use data sources
      - Use APIs
      - Multi-modal data

Agentic system applies reasoning on a query and finds answers.

1.  Context Engineering to address weakness in **context** to better use
    model reasoning

- Connected Access - access to federated data (API, data, documents)
- Knowledge Layer - organization's knowledge
- Precision Retrieval - only access relevant documents with filters like
  intent, role, time, policy
  - RAG
  - Agentic RAG
  - Graph RAG - check relationships of entities and information related
    to entities
  - Context compression - maximize relevant data (summarize, prioritize)
    and reduce noise
- Governance - access permissions at runtime

## See Also

- [AI Retrieval Augmented-Generation RAG and Large Language Model
  LLM](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag-llm)
- [GitHub Copilot Workspace Index and Retrieval Augmented Generation
  (RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag-github-copilot-workspace-index)
- [Local AI with Retrieval Augmented Generation (RAG) using Open WebUI
  and
  Ollama](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag-local-open-webui-ollama)
- [Skills to Build AI Agents](/garden/notes/006-3-tech-ai-agents-career-skills)
- [Vector Database](/garden/notes/006-3-tech-ai-vector-database)
