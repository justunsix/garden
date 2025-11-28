---
date: 2025-04-02
filetags: ":ai:artificial-intelligence:rag:epubnote:"
id: 137fc4d7-be88-4f53-b66c-b9b1f1106a01
title: Local AI with Retrieval Augmented Generation (RAG) using Open
  WebUI and Ollama System and Setup
---

Note is about using Local artificial intelligence (AI) with Retrieval
Augmented Generation (RAG) and Existing Documents

Source: [Open WebUI tutorial — Supercharge Your Local AI with RAG and
Custom Knowledge Bases \| by Peter Alexandru Hautelman \| Mar, 2025 \|
Medium](https://medium.com/@hautel.alex2000/open-webui-tutorial-supercharging-your-local-ai-with-rag-and-custom-knowledge-bases-334d272c8c40)

Artificial Intelligence (AI) can be used to read, understand and build
answers using existing documents and content. It gives benefits of using
up to date (local) data privately. The data sources can be customized to
your work, for example using an existing knowledge base like books and
sets of documents.

The method uses [Retrieval Augmented Generation
(RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag) - [Retrieval
Augmented Generation (RAG)](id:4a445fad-74c1-42c9-bba8-fe0c067b6d23)
using a local environment setup in [Local AI with Retrieval Augmented
Generation (RAG) using Open WebUI and
Ollama](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag-local-open-webui-ollama) -
[Local AI with Retrieval Augmented Generation (RAG) using Open WebUI and
Ollama](id:19319abe-7f4f-4eb7-a953-5f3fc197cf34). The system is used
for:

1.  Store data in way that can be easier to search through for relevant
    information in your questions. The database type for RAG is a
    [Vector Database](/garden/notes/006-3-tech-ai-vector-database) - [Vector
    Database](id:67032821-f795-4059-bc63-ae4adada458a)
2.  The relevant data is given to an AI to read through and then provide
    a response.

## Using RAG with Open WebUI

Different options are available.

### Single Document Upload (Simple, Fast)

- Create a chat
- Use the upload button to select a document
- Ask questions about the document

### Web Information

- In chat, type `#` followed by a web URL. Open WebUI will get the web
  content
- Ask questions about the content

### Knowledge Collections (Configured existing data)

This options is for use with existing data sources like multiple
documents.

- Go to the "Knowledge" tab in the workspace

- Create a new collection like "My Documents"

- Upload documents to the collection

- In a chat, reference the collection using `#`

- Using existing storage like cloud sources helps with working with
  others and is part of the RAG settings

### Dedicated Knowledge Enabled Model (Configured existing data and model settings)

This option combines models settings and knowledge collections to adjust
a model that works bests with the data sources.

- Create a new model
- Relate relevant knowledge collections
- Add a custom system prompt and change model parameters
- Use this new model for questions related to the knowledge collections
  you selected

When changing model parameters, keep in mind model limits and Ollama
settings like token context length.

By default, Ollama uses a context window size of 2048 tokens. For RAG
use, it is better to use high context lengths, for example if using
phi4-mini model with token context length of 128K select in the [article
explaining ollama and open-webui
setup](https://medium.com/@hautel.alex2000/build-your-local-ai-from-zero-to-a-custom-chatgpt-interface-with-ollama-open-webui-6bee2c5abba3),
start ollama with [overridden `OLLAMA_CONTEXT_LENGTH` environment
variable](https://github.com/ollama/ollama/blob/main/docs/faq.md). The
example below uses the maximum for the phi4-mini model, but the length
may need to be decreased depending on hardware limitations like RAM
memory.

``` shell

OLLAMA_CONTEXT_LENGTH=1131072 ollama serve

# or 8K option for for most hardware
OLLAMA_CONTEXT_LENGTH=8192 ollama serve

# Check settings
ollama show

```

## Retrieval Augmented Generation (RAG) Optimization

The RAG system has settings to improve speed and accuracy depending on
content and building the data used in search.

### Text Splitter (RAG Setting)

Setting on methods to split (chunk) the files using:

- Character Chunking: Splits text based on character count.
- Token Chunking: Splits text based on token count.

Token chunking is recommended since large language models (LLM) process
tokens rather than characters. Token chunking also makes it easier to
manage context windows usage.

1.  Choosing Chunk Size

    Default chunk size is 500 tokens (about 375 words or two paragraphs
    depending on content) which is good for most usage. When you may
    want to change it:

    - Smaller chunks (300 tokens or less) - Good for queries needing
      high accuracy like legal or technical documents
    - Large chunks (800 - 1000 tokens) - Good for structured data like
      research paper where a full paragraph or section gives a better
      context

2.  Chunk Overlap

    Sets when consecutive chunks can overlap some content to prevent
    loss of meaning during text splits. 10-20% is a starting point.

### Embedding Models (RAG Setting)

The embedding models in as explained in [Vector
Database](/garden/notes/006-3-tech-ai-vector-database) - [Vector
Database](id:67032821-f795-4059-bc63-ae4adada458a) note take the data /
content you provide as input and converts text into numbers. The numbers
will be compared to find similar content.

Using small and fast models are recommended as they will process all the
input data.

Examples of different models and selecting them:

- See [HuggingFace MTEB
  leaderboard](https://huggingface.co/spaces/mteb/leaderboard)
  (Multilingual Text Embedding Benchmark) for performance of models
  - [Snowflake/snowflake-arctic-embed-l-v2.0](https://huggingface.co/Snowflake/snowflake-arctic-embed-l-v2.0) -
    gives good performance at 500 million (M) parameters (structures
    that helps the model understand and process text)
- Chunk size and model limits: Check the embedding model token capacity
  (example 512, 1024, 8192 tokens). The chunk size set in the system
  must not be greater than the embedding model's maximum token limit

### Hybrid Search and Re-ranking (RAG Setting)

During search RAG can use a two stage approach called re-ranking to find
most relevant chunks to be sent to the LLM to generate an answer.

It can be enabled using hybrid search with CrossEncoder re-ranking to
improve relevance of information.

The flow is:

- First search finds potential relevant chunks using vector similarity
- Re-ranking checks the chunks more
- After re-ranking, the chunks determined to be most relevant are sent
  to the LLM

### Top K: Number of Retrieved Documents (RAG Setting)

The "Top K" setting controls the number of document chunks retrieved for
each query and is related to how much context is given to the model.
Greater values help with complex user questions on multiple concepts.

LLMs have context windows (maximum amount of text the model can process
when creating responses) and the
`chunk token size x number of retrieved documents` should be less than
or equal to the LLM model context to leave context room for conversation
like the user's question.

Changing the "Top K" can depend on:

- LLM context window
- Complexity of expected user questions and input data

### Relevance Threshold (RAG Setting)

Lower thresholds mean potentially less relevant content may be
retrieved, while high values are more selective and potentially more
accurate. The threshold is a balance of retrieval and accuracy.

0.1 and 0.2 works well for most use cases.

## Data Optimization for Knowledge Collections

Before uploading data for use in a RAG system, consider improving and
cleaning the data first. Below are strategies for preparing data and
documents.

### Data Cleaning and Preparation

- Remove unnecessary elements (example in web scraped content):
  - Menus, navigation, headers, footers
  - Duplicate content
  - Inconsistent formatting
- Content normalization
  - Replace images with text describing the image
  - Standardize text formats like headings, paragraphs
- Document granularity: break down large documents for focused units
  - Ideally, each document answers a specific question
  - Smaller concise documents that are easier to retrieve
- Improving content
  - Summarize complex sections for accessibility
  - Rewrite content to be clear and concise
  - Add metadata to each document like sources, time stamps, tags,
    author
- Content curation: can be done with AI models
  - Review and improve document collections
  - Verify data
  - Find and remove duplicate or low quality content
  - Suggest metadata

### Storage Formats

Consider existing knowledge management systems like
[Obsidian](https://obsidian.org/) that implement these strategies for
users to follow:

- Mind map note organization
- Single topic documents
- Metadata and tags
- Look up of related concepts

Example: [GitHub - pahautelman/Obsidian-Text-Transformer-LocalAI:
Transform your .txt and .md notes into visually appealing and
well-structured Markdown for Obsidian, powered by local LLMs using
Ollama.](https://github.com/pahautelman/Obsidian-Text-Transformer-LocalAI)

## Model Setup for RAG

### Choosing Models for RAG

Look for these features in models:

- Context Window: large is better for retrieved text and conversation
- Model size: small can work well since the retrieval system is giving
  the model the most relevant content

1.  Recommendations

    - RAG models with 7B (billion) to 14B parameters are sufficient
      - Complex reasoning will need larger models like 30B+, but is
        limited by performance and hardware
    - Prefer models with large context windows, again since the
      retrieved content will be relevant

### System Prompt

The system prompt tells the AI how to use the retrieved information. The
[sample from the source article by Peter Alexandru
Hautelman](https://medium.com/@hautel.alex2000/open-webui-tutorial-supercharging-your-local-ai-with-rag-and-custom-knowledge-bases-334d272c8c40)
is

> You are a specialized assistant with deep knowledge of Open WebUI, an
> extensible, feature-rich, and user-friendly self-hosted AI platform
> designed to operate entirely offline.
>
> \## Response Guidelines:
>
> 1.  Answer questions EXCLUSIVELY using the Open WebUI knowledge base
>     provided to you
> 2.  Always cite your sources with BOTH the article title and reference
>     URL
> 3.  When information is not found in the provided documents, clearly
>     state this limitation
> 4.  DO NOT rely on general knowledge about AI platforms or related
>     topics when documentation is unavailable
> 5.  Format all citations at the end of your response as:
>     \<\<Information retrieved from sources: \[Article Title\](URL),
>     \[Article Title\](URL)\>\>
>
> \## Interaction Approach:
>
> - Seek clarification when user intent is ambiguous rather than making
>   assumptions
> - Ask targeted follow-up questions to understand user needs and goals
>   better
> - Maintain a helpful, knowledgeable tone focused on practical
>   solutions
> - When appropriate, suggest related features or documentation that
>   might benefit the user
>
> Remember that your answers should prioritize accuracy over
> completeness—it's better to acknowledge limitations than provide
> potentially incorrect information that is not supported by
> documentation.

Change a prompt to fit your needs and give guidance on:

- Instructions on using the information
- Citing sources
- Handling when no relevant information is found
- Tone and conversation style
- If the model uses RAG as a tool-calling function, instruct it to get
  clarifications with unclear queries before executing RAG. Getting
  clarification helps retrieve accurate content.

## RAG Examples

2 examples on doing RAG with real data.

### Wikipedia Knowledge Base

Ask questions about Wikipedia article with a RAG system with:

- Download the [WikiText-2
  dataset](https://github.com/pahautelman/wikitext2-raw)
- Upload the data to Open WebUI as a knowledge collection (may take 15+
  minutes)
- Make queries on a specific paragraph in the data set with and without
  RAG to see with RAG, you should get relevant content and a citation

### Open WebUI Documentation Assistant

Create an assistant to get relevant information on using Open WebUI.
This use case can be applied to private documentation, manuals, and
support knowledge bases.

- Scrape the [documentation site](https://docs.openwebui.com/) (for
  example in a [scraper
  pipeline](https://github.com/pahautelman/Open-WebUI-documentation-scraper))
  or use a subset of the [open-webui/docs
  repository](https://github.com/open-webui/docs) source code
- Upload the data as a knowledge collection
- Create a custom model with access to the collection
  - Temperature: lower to 0.1 for more factual responses
  - Context window: the 2048 default may not hold all retrieved
    information, try a greater value depending on the model's context
    limit and hardware
  - Create a system prompt like the one above
- Ask about the documentation or applying the document like creating
  code

## Summary of Benefits of using Local AI with RAG

- Privacy: data and chat stays local
- Customization: AI, model, input data, and the RAG system is customized
  to suit the data and your environment's limits
- Accuracy: relevant and up to date data is used

Suggestions on extending this system:

- Integrate with programs like Python functions
- Connect with external services / APIs
- Use multiple agent systems to combine different models for tasks
