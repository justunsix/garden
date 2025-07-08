---
date: 2016-09-12
filetags: ":artificial-intelligence:ai:tech:cognitive:ibm:epubnote:"
id: 2be7387d-6da4-44bb-a55c-8331376b9e6f
title: Cognitive Computing
---

Source: My personal notes from a work Cognitive Computing Course from
2016, hence older terminology, services mentioned

- Not an emerging technology. It is being used now – example Hilton
  hotel has a cognitive concierge
- Self learning software

## Introduction from IBM

IBM Watson – quick learning, expansive. Cognitive computing era 2011-\>

### IBM History with Cognitive Computing

- IBM grand challenges: Chess Deep Blue 1997, Human language – Watson
  2011 ○ Human + computers working together always beat a human or a
  computer in chess. ○ Human language is complex, not a computable
  problem.
- Play Jeopardy 2009 ○ Answer in 3 seconds ○ Process natural language of
  questions ○ Compare against former winners

## What is cognitive computing? Principles

1.  Able to learn
2.  Value is expertise (like human)
3.  Evolve over time
4.  Use natural human expression

## Hard and Easy to Compute

Computers find these things easy: ○ Math ○ Structured queries (database,
search, keyword)

- Hard to process: natural language is implicit, contextual, ambiguous,
  and often imprecise
- Splits a natural language into keywords and process their meaning: “in
  May 1898 Portugal celebrated the 400th anniversary of this explorer's
  arrival in India à celebrated, May 1898, Portugal, explorer, arrival
  in India

## Learning

- Text \> Syntactic frames (subject, verb, object) \> semantic frames
  (meaningful sentences)
- Massive parallel probabilistic evidence based architecture
  - Process natural language
  - Assemble evidence from knowledge base
  - Rate probability of answer
  - Parallel processing – unstructured information Services
- Watson is on Bluemix and can be used for applications
- It has APIs
- Watson is available through Bluemix.
  - Threat risk and privacy assessments are required for organizations
    using of Watson for sensitive data
- IBM's recommendation on starting to use the service is to "start
  small"
- What do I need to use Watson?
  - Skills: application development experience, knowledge of a
    programming language, ability to use REST APIs
  - Process: Have an idea for business application of cognitive
    computing \> start with something simple, storyboard it \> do user
    testing \> scale the application § Plan \> Do \> Check \> Act

## Use Cases

1.  Explore - data
2.  Engage - communications, Q&A, a fixed domain
3.  Discovery - wide domain, research and intelligence
4.  Decision - knowledge + process — medical use cases
5.  Policy

Case dimensions affect classification - size, scope, users, time,
connections

Ingest information — to —\> Watson –\> provides consultation

**Imagine** You have a room full of assistants that read and remember
everything and you can consult them. They provide you relevant pieces of
information to your query, useful decision making information, options,
or other lines of inquiry.

- Implied decision triggers form connections
- Next generation work:
  - Extract semantic info from pictures
  - Streaming data (e.g. internet of things IOT)
  - Predictive analytics

## Information Discovery

Decision making/Expert Q&A

- Question
- Check keywords
- Find and present evidence

versus

Search engine

- Question
- Possible answers, can use popularity or attributes
- Calculate confidence
- Deliver results

## Building a Watson System

- Plan - Selecting and ingestion of documents to build knowledge.
  Selected is key otherwise garbage in, garbage out.
- Do - Domain training for application
- Check - User pilot, testing
- Act - staged deployment, go to production.

Example: US Government national security intelligence system

Ingestion of documents

- Watson avoids cognitive bias unless the data ingested is inherently
  biased.
- Bias could related to the data volume and quality

## Evolution of Watson in Analysis and Decision Support

- Multiple language process. Don't use straight translation
- Text, video, image, audio ingestion
- Decision points:
  - Data instances
  - Reports, queries, data aggregates
  - Predictive models (option 1, 2, 3…)
  - Confidence rating
  - Continuous feedback

## Demonstration: Policy application

Interface for:

- Questions
- Menu
- Listing of popular questions
- User \> Java app \> DB — Open data sets
- Uses natural language processing (NLP) to display results
- Results have 3 user interactions:
  - Helpful
  - Not helpful
  - I still need help
- Opportunity for administration app to manage data sets (e.g. expiry,
  meta, classifiers)
- App is trained with classifiers (like keyword filters and categories).
  For policy it could be *poverty reduction*, ministry names)

Demonstration: Node Red

- Visual internet programming for IOT Bluemix has a texting service,
  Informix, etc.
