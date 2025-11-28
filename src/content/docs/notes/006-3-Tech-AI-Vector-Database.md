---
filetags: ":ai:artificial-intelligence:vector:database:epubnote:"
id: 67032821-f795-4059-bc63-ae4adada458a
title: Vector Database
---

## Vector Database

Source: [What is a Vector Database? Powering Semantic Search & AI
Applications - IBM Technology on YouTube](https://youtu.be/gl1r1XV0SLw),
[What is a Vector
database](https://www.ibm.com/think/topics/vector-database)

Use case: We want to store content like image into a database. Example:
store a sunset in hills.

Options are below

### Use a relational database

- Store text, binary data into a database
- Store metadata of content into database
  - Tags: sunset, hills

There is a challenges with relating unstructured data with structured
data

### Use a vector database

Vector embeddings are an array of numbers. In the database, similar
items are stored close together, semantically similar content is stored
close together.

Can store unstructured data (examples: image, test, audio). Data is
transformed into vector embeddings which are stored in database.

- The sunset and hills images is stored as \[0.91, 0.15, 0.83\] where
  dimensions could be:
  - \[Elevation changes, buildings, colour temperature\]
  - Another example of beach: \[0.17, 0.08, 0.95\] which is similar to
    the sunset image in colour temperature and lack of buildings but
    does not have elevation changes.

Actual vectors could have 100s to 1000s dimensions

### How are vector embeddings created?

Using models that were trained on datasets. There are different
embedding models trained for certain content, for example models for
images, for text, and for audio.

Data is passed through multiple layers and each layer extracts features
(example for images, a layer extracts shapes, another extracts words,
another extracts meaning). Actual models could have 1000s of layers.

### Efficient queries

The vector database makes it easier to find vectors with similar
dimensions, but comparing all vectors requires a better method as it
will be slow.

Vector indexing helps with queries to find approxiate close matches,
example algorithms:

- Hierarchical navigable small world (HNSW) - multi-layered graphes
- Inverted file index (IVF) - divides vectors into clusters and compares
  with clusters

Indexes may be less accurate, but are more efficient for searches.

### Answering a user's questions with RAG and Vector Database

Vector databases are applied with [Retrieval Augmented Generation
(RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag) - [Retrieval
Augmented Generation (RAG)](id:4a445fad-74c1-42c9-bba8-fe0c067b6d23) to
store and get data to answer user questions using existing data that has
been processed into a vector database.

When a user asks a question, vectors can be compared for similarity and
given to a LLM for processing to give answers

## See Also

- [Retrieval Augmented Generation
  (RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag) -
  [Retrieval Augmented Generation
  (RAG)](id:4a445fad-74c1-42c9-bba8-fe0c067b6d23)
