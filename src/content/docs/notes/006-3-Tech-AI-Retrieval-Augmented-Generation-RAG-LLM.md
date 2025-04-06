---
filetags: ":ai:artificial-intelligence:epubnote:"
id: 86f6f51e-26ce-4b1f-bd3f-5451b5ae56a6
title: AI Retrieval Augmented-Generation RAG and Large Language Model
  LLM
---

## Building a RAG Application

Source: [Build RAG Application Using a LLM Running on Local Computer
with Ollama and
Langchain](https://medium.com/rahasak/build-rag-application-using-a-llm-running-on-local-computer-with-ollama-and-langchain-e6513853fda0),
Privacy-preserving LLM without GPU with repo:
<https://gitlab.com/rahasak-labs/ollama>

Summary: Build a RAG application using Ollama

- About Ollama
  - Lightweight framework for local deployment of LLM on PCs
  - Uses OpenAI compatible API
  - Provides models for immediate use
- RAG application
  - Uses a custom dataset, in this example scraped from an online
    website
  - Documentation is processed (scraped), split, and stored in Chrome
    vector database
  - Users can interact with documentation via the API
- Large Language Model (LLM)
  - For LLM will use Llama2 quantized for good performance on common
    consumer hardware such as CPUs
  - The integration of the RAG application and LLM facilitated through
    Langchain.

### Process of Chatbot

- Document loading / Scrape data
  - Langchain provides [different document
    loaders](https://python.langchain.com/docs/integrations/document_loaders).
    A loader allows web URLs.
- Split documents
  - Need to divide text into smaller segments with Langchain text
    splitter
- Create Vector Embedding
  - Convert text into vector embedding to storing and retrieving data is
    more efficient
  - Using machine learning models to convert text into vectors
- Store Vector embedding
  - Embeddings are stored in a Chroma vector database
  - Vector databases handle semantic search better than other database
    types
- User can ask a question
  - System provides an API to submit questions
  - `user_id` is provided to identify user sessions
- Create Vector Embedding of question
  - Question is converted into a vector embedding
  - Allows semantic search of documents related to the question in
    vector database
- Semantic Search of Vector database
  - Identify content relevant to question, find information contextly
    similar to question
  - Give search results for LLM called context
- Generate Prompt
  - Generate custom prompt with user's question and semantic search
    result (context)
  - Allows model to understand context and create relevant output or
    conversation
- Post Prompt to LLM
  - Give prompt to LLM through Langchain libraries for Ollama
- LLM to generate response
- Save Query and Response in Database Chat History
  - Save conversation in a database
  - In this example, use MongoDB
- Send Answer to User
  - Sent using API

## Repository and Code Walkthrough

### Chatbox configuration in config.py

- Index, database, HTTP API, database environment and account

### HTTP API in api.py

- Implements API HTTP endpoint `api/question` which accepts JSON object
  with question and user<sub>ud</sub>

### Model

- Scrapes data and creates vector store
- Index informatiom
- Use of Ollama API for LLM interaction and chat function

## Run Application

``` shell
# Create Python virtual environment and install dependencies in =requirements.txt=
python -m venv .venv
source .venv/bin/activate
pip install -r requirements.txt

# Run LLM
ollama run llama2
# Exit ollama console

# Check LLM
curl http://localhost:11434/api/generate -d '{
  "model": "llama2",
  "prompt": "what is docker?",
  "stream": true
}'

# set env variabl INIT_INDEX which determines weather needs to create the index
export INIT_INDEX=true

# run aplication
python api.py

# post question
curl -i -XPOST "http://localhost:7654/api/question" \
--header "Content-Type: application/json" \
--data '
{
  "question": "what is open5gs",
  "user_id": "kakka"
}
'
# post next question
curl -i -XPOST "http://localhost:7654/api/question" \
--header "Content-Type: application/json" \
--data '
{
  "question": "what is EPC",
  "user_id": "kakka"
}
'

# ConversationalRetrievalChain generate following prompt with question, semantic seach result and send to llm
# > Entering new LLMChain chain...
# Prompt after formatting:
# Use the following pieces of context to answer the question at the end. If you don't know the answer, just say that you don't know, don't try to make up an answer.

# Open5GS     Sukchan Lee  acetcom@gmail.com        GitHub  open5gs      Open5GS is a C-language implementation of 5G Core and EPC, i.e. the core network of NR/LTE network (Release-17)

# Open5GS     Sukchan Lee  acetcom@gmail.com        GitHub  open5gs      Open5GS is a C-language implementation of 5G Core and EPC, i.e. the core network of NR/LTE network (Release-17)

# Question: what is EPC
# Helpful Answer:

# > Finished chain.
# 2024-03-16 20:56:24,053 - INFO - got response from llm - EPC stands for "Evolved Packet Core." It is a component of the 5G network that provides the core networking functions for the NR/LTE network.

# # response
# {
#   "answer": "EPC stands for \"Evolved Packet Core.\" It is a component of the 5G network that provides the core networking functions for the NR/LTE network."
# }

```
