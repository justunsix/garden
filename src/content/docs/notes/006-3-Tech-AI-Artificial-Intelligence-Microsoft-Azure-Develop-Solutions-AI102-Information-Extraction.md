---
filetags: ":artificial-intelligence:ai:microsoft:azure:ai102:epubnote:information:extraction:"
id: ea3c4dff-d8c8-4fb6-ad75-82274983fc33
title: Information Extraction in Azure AI Solutions
---

Source: My personal notes from [Course AI-102T00-A: Develop AI solutions
in Azure - Microsoft
Learn](https://learn.microsoft.com/en-us/training/courses/ai-102t00)
with labs from [Exercises for Develop AI-powered information extraction
solutions in
Azure](https://microsoftlearning.github.io/mslearn-ai-information-extraction/)

## Multimodal Analysis, Document Intelligence

Use case: extract data and store structured data from documents with
text, images, audio, videos.

Common use is recognizing data in forms for processing and getting
information out of documents. Models can trained for different forms to
recognize content in them and find fields in the media like names,
identifiers, and addresses.

- Azure AI Content Understanding can analyze multiple input mediums
- Recognition can be in images and video like graphs, charts, and other
  structured data. For example, in a video, speakers, transcription, and
  summary of activity will be detected.

Q: What are differences between document intelligence and other vision
services?

Document intelligence and content understanding uses an existing schema
like an invoice to extract information.

### Azure AI Content Understanding

In an Azure AI Foundry project, define a Content Understanding schema
for information to be extracted using a content sample and analyzer
template. An analyzer is built on the schema and can be used to analyze
further documents of similar type.

## Using AI Content Understanding in a Solution

An application can call the REST API to:

- Submit analyzer schema definition (API HTTP PUT)
- Check operations of schema processing (API HTTP GET)
- Send content for analysis (API HTTP POST)
- Check status of operation and retrieve results (API HTTP GET)

## Custom Models

### Custom Classification

Apply a label to a whole document, sorting documents into types. For
training, requires examples of documents for each label.

### Custom Extraction

Apply label to specific text and extract custom labels from documents

Training methods:

1.  Custom template (custom form) - structure of forms, templates, other
    structured documents; short training time with schema, requires
    labelling fields
2.  Custom neural (custom document): structured and unstructured
    documents; longer training time

After training, custom model in response gives accuracy score (how
accurate the model thinks the prediction is for each predicted label).

### Deployment and Use

Models do require re-training across environments like development and
production separated environments. Alternatively, a custom model can be
built in production, though need to balance risk of making changes.
Major changes to the model can be built separately in a different model
in production. When the new model is ready, the new model ID is given
for applications to upgrade.

During SDK calls, call the model using the model ID and get results.

## Document Intelligence

Use case: analyze and extract information from documents.

Pre-built models are available like for receipt, invoice, business
cards, and other common documents.

## Knowledge mining

Use case: find information and search for relevant information in
knowledge bases like web, document, and other data. Implementations are
organizational search and supporting retrieval augmented generation
(RAG).

Concept: *Indexer* gets data from data sources. *Document cracking*
retrieves the text content and attributes. An *enrichment pipeline*
builds JSON representations of each indexed document. Fields for each
document might be file name, date, size). Result is an *index* of the
indexed documents. The idea is similar to indexes in books with keywords
and page numbers.

Azure AI Search with vector databases and also regular databases with
vectors can be used for search. It indexes documents and data, use AI to
enrich index data and store insights in a knowledge store for analysis
and integration.

Examples of Enrichment Pipeline features:

- Language detection
- Key phrase detection
- Translation
- Get text from images
- Image description
- PII identification
- Captions, tags
- Custom skills: other logic

### Search an Index

Each index field can be configured as:

- key: Fields that define a unique key for index records
- searchable: Fields that can be queried using full-text
- filterable: Fields that can be included in filter expressions to
  return only documents that match specified constraints
- sortable: Fields that can be used to order the results
- facetable: Fields that can be used to determine values for facets
  (user interface elements used to filter the results based on a list of
  known field values)
- retrievable: Fields that can be included in search results

Q: How can indexing and information sensitivity be handled, for example
classified documents and permissions?

The classification like sensitivity of the document can be metadata in
the document. Things like permissions and sensitivity can be included in
index so when search is done, the search can determine if a user has
access to a result.

### Stored Extracted Information in a Knowledge Store for Search and Processing

| Projection storage | Input type                             |
|--------------------|----------------------------------------|
| Objects            | JSON documents                         |
| Tables             | Relational schema for extracted fields |
| Files              | Extracted images                       |

Projections are separate from the index and could be used for additional
processing.

## Exercise: Extract information from multimodal content

- Create Foundry to use Content Understanding AI service (Content
  Understanding - Layout)
- "AI Services" in the foundry do not required deployment of models
- Do custom tasks invoice field detection, slide analysis, audio
  analysis and meeting recording analysis to extract information in each
  medium
  - Each task with test detection with uploaded files and set up an
    analyzer with a schema of fields to be extracted

## Exercise: Analyze forms with prebuilt Azure AI Document Intelligence models

Set up an Azure AI Foundry project for document analysis. Use Azure AI
Foundry portal and the Python SDK to submit forms to AI resource for
analysis.

## Exercise: Develop a Content Understanding client application

Use the Azure Content Understanding (ACU) Python SDK to create an
analyzer that extracts information from business cards.

Create a client application that sets up the analyzer to extract contact
details from scanned business cards. Cards are submitted and `JSON`
results are returned.

``` json

{
    "analyzerId": "businesscardanalyzer",
    "apiVersion": "2025-11-01",
    "createdAt": "2026-04-17T19:50:57Z",
    "stringEncoding": "codePoint",
    "warnings": [],
    "contents": ["details of the business card scans"],
}

```

## Exercise: Extract data with Azure Document Intelligence

The Azure AI service, Azure Document Intelligence, can do automated data
processing to extract text, key/value pairs, and tables from form
documents using optical character recognition (OCR).

It uses pre-built models for recognizing invoices, receipts, business
cards, and other common document types. The service also can train
custom models to extract specific data fields from forms.

Use both prebuilt and custom Document Intelligence models to extract
information from documents.

## Exercise: Create a knowledge mining solution

Use AI Search to index a set of documents maintained by Margie's Travel,
a fictional travel agency. The indexing process involves using AI skills
to extract key information to make them searchable, and generating a
knowledge store containing data assets for further analysis.

- Upload documents for indexing and AI enrichment to a Azure storage
  account container with PDFs of travel information

- Connect the Azure AI Search to the document container and configure
  Retrievable, Filterable, Sortable, and Facetable for indexed fields

- Search through documents using index created by Azure AI Search

- Create an app that can query and retrieval specific fields from
  searched documents

- Search manually in the Azure portal AI Search like the `json` below:

``` json

{
  "search": "*",
  "count": true,
  "select": "title,locations",
  "queryType": "semantic",
  "semanticConfiguration": "margies-index-semantic-configuration",
  "captions": "extractive",
  "answers": "extractive|count-3",
  "queryLanguage": "en-us",
  "queryRewrites": "generative"
}

```

### Example search and response from index using Azure AI Search explorer

Search

``` json

{
    "search": "New York",
    "count": true,
    "select": "title,keyPhrases",
    "filter": "metadata_storage_size lt 380000"
}

```

Results

``` json
{
  "@odata.context": "https://aisearch2325425.search.windows.net/indexes('margies-index')/$metadata#docs(*)",
  "@odata.count": 1,
  "value": [
    {
      "@search.score": 6.8039145,
      "title": "Margies Travel Company Info.pdf",
      "keyPhrases": [
        "world-leading travel agency",
        "best travel experts",
        "international reach",
        "Currency Exchange",
        "Las Vegas",
        "New York",
        "San Francisco",
        "leadership team",
        "Marjorie Long",
        "Logan Reid",
        "Emma Luffman",
        "Deepak Nadar",
        "Strategic Director",
        "Margie",
        "local",
        "expertise",
        "Flights",
        "Accommodation",
        "Transfers",
        "Visas",
        "Excursions",
        "trips",
        "Dubai",
        "London",
        "CEO",
        "CFO",
        "website"
      ]
    }
  ]
}

```

## Exercise: Build an automated RAG ingestion pipeline with Content Understanding

Retrieval-augmented generation (RAG) is a method that enhances Large
Language Models (LLMs) by integrating data from external knowledge
sources. In production scenarios, new documents arrive continuously and
must be extracted, embedded, and indexed so they are available for
search in near real-time.

- Create an analyzer for the travel PDF documents
- Build an automated RAG ingestion pipeline that uses Azure Content
  Understanding to extract content from multimodal documents and embeds
  the content using Azure OpenAI, and indexes it in Azure AI Search
  - It extracts content with Content Understanding, generating vector
    embeddings with Azure OpenAI, and indexing into Azure AI Search. It
    also tracks which files have been processed so it can detect new or
    updated documents on subsequent runs
- The pipeline tracks which files have already been processed and can
  run in watch mode to automatically detect and ingest new documents as
  they arrive
- Creating a conversational agent that answers questions grounded in the
  indexed data

Pipeline Details from `ingest-pipeline.py`:

- Tracks processed files using a manifest
  (processed<sub>files</sub>.json) that records the SHA-256 hash of each
  file. On each run, the pipeline compares the current hash of every
  file in the data/ folder against the manifest, so only new or modified
  files are processed.
- Ensures the search index exists by calling ensure<sub>index</sub>(),
  which creates or updates the Azure AI Search index with the required
  schema (text fields, a vector field, and HNSW vector search
  configuration).
- Extracts content from each new file by submitting it to the Content
  Understanding analyzer via begin<sub>analyzebinary</sub>, which
  returns markdown content and extracted fields (summary, key topics).
- Chunks the content by splitting at paragraph boundaries with a
  2000-character limit, keeping each chunk self-contained.
- Generates embeddings for each chunk using the Azure OpenAI embedding
  model, producing a 3072-dimension vector for semantic search.
- Indexes the chunks into Azure AI Search using deterministic document
  IDs (based on the file name and chunk index), so re-ingesting an
  updated file replaces its old chunks.
- Supports a –watch flag for continuous monitoring and a –reset flag to
  reprocess all files.

RAG client details from `rag-agent.py`:

- Creates an Azure AI Search client to retrieve documents.
- Creates an Azure OpenAI chat client.
- Implements a retrieval function that performs hybrid search (combining
  keyword and vector search) to find the most relevant content chunks.
- Constructs a prompt that includes the retrieved context and the user’s
  question.
- Sends the prompt to the chat model for answer generation.
- Runs a conversational loop so you can ask multiple questions.

## See Also

- [Develop AI solutions in Azure
  AI-102](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)
