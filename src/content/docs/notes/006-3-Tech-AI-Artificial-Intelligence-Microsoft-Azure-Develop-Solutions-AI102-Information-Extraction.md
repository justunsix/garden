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

Azure AI Content Understanding can analyze multiple input mediums.

Recognition can be in images and video like graphs, charts, and other
structured data. For example, in a video, speakers, transcription, and
summary of activity will be detected.

Q: What are differences between document intelligence and other vision
services?

Document intelligence and content understanding uses an existing schema
like invoice to extract information.

### Azure AI Content Understanding

In an Azure AI Foundry project, define a Content Understanding schema
for information to be extracted using a content sample and analyzer
template. An analyzer is built on the schema and can be used to analyze
further documents.

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
accurate the model things the prediction is for each predicted label).

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
organizational search and supporting retrieval augemented generation
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

### Stored Extracted Information in a Knowledge Store

Store projections in storage:

- Objects: JSON documents
- Tables: Relational schema for extracted fields
- Files: Extracted images

Projections are separate from the index and could be used for additional
processing.

## Exercise: Extract information from multimodal content

Created AI Foundry hub to use Content Understanding. Custom tasks were
created for invoice field detection, slide analysis, audio analysis and
meeting recording analysis to extract information in each medium.

## Exercise: Analyze forms with prebuilt Azure AI Document Intelligence models

Set up an Azure AI Foundry project for document analysis. Use Azure AI
Foundry portal and the Python SDK to submit forms to AI resource for
analysis.

## Exercise: Create a knowledge mining solution

Use AI Search to index a set of documents maintained by Margie's Travel,
a fictional travel agency. The indexing process involves using AI skills
to extract key information to make them searchable, and generating a
knowledge store containing data assets for further analysis.

## See Also

- [Develop AI solutions in Azure
  AI-102](../006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)
