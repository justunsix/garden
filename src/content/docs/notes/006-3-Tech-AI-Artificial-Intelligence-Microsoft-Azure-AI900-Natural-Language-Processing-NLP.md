---
filetags: ":artificial-intelligence:nlp:natural-language-processing:ai:microsoft:azure:ai900:epubnote:"
id: b71bbd44-c8d5-4221-b9c9-ec80f39e4d38
title: Natural Language Processing (NLP) Concepts and in Azure
---

Source: My personal notes and comments from course series [Introduction
to AI in
Azure](https://learn.microsoft.com/en-us/training/paths/introduction-to-ai-on-azure/),
[Introduction to natural language processing concepts - Training \|
Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/introduction-language/)

## Introduction

Computers interpret the subject of text similar to humans using Natural
Language Processing (NLP) which is the understanding of written and
spoken language and responding.

Text analysis is NLP processes that extract information from
unstructured text.

Common NLP text analysis use cases are:

> - Speech-to-text and text-to-speech conversion. For example, generate
>   subtitles for videos.
> - Machine translation. For example, translate text from English to
>   Japanese.
> - Text classification. For example, label an email as spam or not
>   spam.
> - Entity extraction. For example, extract keywords or names from a
>   document.
> - Question answering. For example, provide answers to questions like
>   "What is the capital of France?"
> - Text summary. For example, generate a short one-paragraph summary
>   from a multi-page document.

### NLP Service Examples and Workflow

- Translation
- Sentiment analysis
- Keyword/phrase extraction
- Summarization
- Entity recognition (e.g., data to save)

It is not a Generative AI model.

Text -\> Tokenization → Model with Training → NLP Use Cases like
conversational AI which mimics conversation like a Q/A bot

Azure services: language, translate, speech, custom translation

## How language is processed

Earliest NLP techniques used statistical analysis of a body of text (a
corpus) to infer semantic meaning like finding the frequently used words
in text and it should give an idea of what the document is about.

### Tokenization

To analyze a corpus, it is broken down into tokens. The idea is tokens
can be tokens, while in reality, they will be partial words or
combination of words and punctuation.

For example, "we choose to go to the moon", the phrase is broken down
into the following tokens, with numeric identifiers:

1.  we
2.  choose
3.  to
4.  go
5.  the
6.  moon

The word "to" is token number 3. The phrase "we choose to go to the
moon" can be represented by the tokens {1,2,3,4,3,5,6}.

### Tokenization applied to specific problems

- Text normalization: Before generating tokens, text is normalized by
  removing punctuation and making all words lower case.
  - Good for analysis purely on word frequency with high performance.
  - Some semantic meaning may be lost like example, "Mr Banks has worked
    in many banks." where the sentence and punctuation has meaning for
    Mr. Banks and bank.
- Stop word removal: Stop words are words that should be excluded from
  the analysis. For example, "the", "a", or "it" make text easier for
  people to read but add little semantic meaning. Excluding these words,
  allows better identification of important words.
- n-grams: Multi-term phrases such as "I have" or "he walked". A single
  word phrase is a unigram, a two-word phrase is a bi-gram, a three-word
  phrase is a tri-gram, and so on. Considering words as groups allows a
  model to make better sense of the text.
- Stemming: algorithms are applied to consolidate words before counting
  them, so that words with the same root, like "power", "powered", and
  "powerful", are interpreted as the same token.

## Statistical techniques for NLP

Statistical techniques that form the foundation of natural language
processing (NLP).

### Naïve Bayes

First used for email filtering, it learned the difference between spam
and not spam by comparing two documents. It finds groups of words that
only occur in one type of document and not the other, often referred to
as bag-of-words features.

Example: the words miracle cure, lose weight fast, and anti-aging may
appear frequently in spam emails about false health products than
regular emails.

Naïve Bayes proved more effective than simple rule-based models for text
classification, but basic since only the presence (and not the position)
of a word or token was considered.

### Term Frequency - Inverse Document Frequency (TF-IDF)

TF-IDF uses a similar approach by comparing the frequency of a word in
one document with the frequency of the word in a corpus (large,
structured collection of text documents) of documents. Understanding
context of the word allows classification based on certain topics.
TF-IDF is often used for information retrieval.

Corpora (plural of corpus) are resources for training, testing, and
evaluation NLP models.

Example

> For example, after tokenizing the words in "we choose to go to the
> moon", you can perform some analysis to count the number of
> occurrences of each token. The most commonly used words (other than
> stop words such as "a", "the", and so on) can often provide a clue as
> to the main subject of a text corpus. For example, the most common
> words in the entire text of the "go to the moon" speech we considered
> previously include "new", "go", "space", and "moon". If we were to
> tokenize the text as bi-grams (word pairs), the most common bi-gram in
> the speech is "the moon". From this information, we can easily surmise
> that the text is primarily concerned with space travel and going to
> the moon.

TF-IDF calculates scores based on how often a word or term appears in
one documents compared to its frequency across the collection of
documents. The technique assumes a high relevance for words that appear
frequently in a documents but relatively infrequently in the other
documents.

## Semantic language models

NLP models can store the semantic relationship between tokens in deep
learning (neural networks) language models. In the models are encoding
of language tokens as vectors known as embeddings.

See Tokenization section of [Microsoft Azure AI Fundamentals, Generative
AI](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-generative-ai) -
[Microsoft Azure AI Fundamentals: Generative
AI](id:4e618b1d-6f89-4eb3-811b-be31133ea2f3)

### Machine learning for text classification

Text analysis can be done using a classification algorithm like logistic
regression to train a ML model to classify text in categories. An
application is classifying text as positive or negative to do sentiment
analysis.

Example:

``` example

- *The food and service were both great*: 1
- *A really terrible experience*: 0
- *Mmm! tasty food and a fun vibe*: 1
- *Slow service and substandard food*: 0

```

With enough data, a model can be trained with tokenized text as features
and the sentiment (0 or 1) as a label. The model will store the
relationship between tokens and sentiment. In the example:

> reviews with tokens for words like "great", "tasty", or "fun" are more
> likely to return a sentiment of 1 (positive), while reviews with words
> like "terrible", "slow", and "substandard" are more likely to return 0
> (negative).

## Summarization Techniques

These can be used when asking for a summary of a document

1.  Extractive: summary uses key sentences from text as they are
2.  Abstractive: use key sentences but adjust wording

## Natural Language Processing in Azure

Example use cases for NLP

> - Customer Feedback Analysis: Organizations need to analyze large
>   volumes of customer reviews, support tickets, or survey responses.
>   By applying sentiment analysis and key phrase extraction, businesses
>   can identify trends, detect dissatisfaction early, and improve
>   customer experiences.
>
> - Healthcare Text Analysis: In the healthcare sector, Azure's language
>   solutions are used to extract clinical information from unstructured
>   medical documents. Features like entity recognition and text
>   analytics for health help identify symptoms, medications, and
>   diagnoses, supporting faster and more accurate decision-making.
>
> - Conversational AI with Virtual Agents: Azure's language solutions
>   power virtual assistants that can interpret user intent, translate
>   conversations, extract relevant entities, and respond appropriately.

These Azure AI services support language detection, sentiment analysis,
named entity recognition, text classification, translation, and
summarization

Azure AI Language service: understanding and analyzing text like support
sentiment analysis, key phrase identification, text summarization, and
conversational language understanding.

Azure AI Translator service: uses Neural Machine Translation (NMT) for
translation, which analyzes the semantic context of the text and renders
a more accurate and complete translation as a result.

### Azure AI Language's text analysis capabilities

They are also available in the Azure Language Studio (no sign in needed)

- Named entity recognition: identifies people, places, events, other,
  and possible custom categories
- Entity linking: identifies known entities with a link to Wikipedia
- Personal identifying information (PII) detection: identifies
  personally sensitive information, including personal health
  information (PHI).
- Language detection identifies the language of the text and returns a
  language code such as "en" for English.
- Sentiment analysis and opinion mining: identifies if text is positive
  or negative.
- Summarization: summarizes text
- Key phrase extraction: lists main concepts from unstructured text.

1.  Entity recognition and linking

    Azure AI Language, when given unstructured text provides a list of
    entities in the text that is recognizes.

    Examples:

    | Type                  | SubType     | Example                         |
    |-----------------------|-------------|---------------------------------|
    | Person                |             | "John", Marcus Aurelius         |
    | Location              |             | "Paris", "New York"             |
    | Organization          |             | "Microsoft"                     |
    | Quantity              | Number      | "6" or "six"                    |
    | Quantity              | Percentage  | "25%" or "fifty percent"        |
    | Quantity              | Ordinal     | "1st" or "first"                |
    | Quantity              | Age         | "90 day old" or "30 years old"  |
    | Quantity              | Currency    | "10.99"                         |
    | Quantity              | Dimension   | "10 miles", "40 cm"             |
    | Quantity              | Temperature | "45 degrees"                    |
    | DateTime              |             | "6:30PM February 4, 2012"       |
    | DateTime              | Date        | "May 2nd, 2017" or "05/02/2017" |
    | DateTime              | Time        | "8am" or "8:00"                 |
    | DateTime              | DateRange   | "May 2nd to May 5th"            |
    | DateTime              | DateRange   | last week                       |
    | DateTime              | TimeRange   | "6pm to 7pm"                    |
    | DateTime              | Duration    | "1 minute and 45 seconds"       |
    | DateTime              | Set         | "every Tuesday"                 |
    | URL                   |             | "<https://www.bing.com>"        |
    | Email                 |             | "support@microsoft.com"         |
    | US-based Phone Number |             | "(312) 555-0176"                |
    | IP Address            |             | "10.0.1.125"                    |

2.  Language Detection

    Azure AI Language can detect language in which text is written. It
    will detect the predominant language in mixed language text.

    Example if given a document:

    - Language name (for example "English").
    - ISO 6391 language code (for example, "en").
    - Score indicating a level of confidence in the language detection.

3.  Sentiment analysis and opinion mining

    Evaluated text are given sentiment scores and labels for each
    sentence.

    > Azure AI Language uses a prebuilt machine learning classification
    > model to evaluate the text. The service returns sentiment scores
    > in three categories: positive, neutral, and negative. In each of
    > the categories, a score between 0 and 1 is provided.

4.  Key phrase extraction

    Get main points from a text.

    Example of a restaurant review:

    > You might receive a review such as:
    >
    > "We had dinner here for a birthday celebration and had a fantastic
    > experience. We were greeted by a friendly hostess and taken to our
    > table right away. The ambiance was relaxed, the food was amazing,
    > and service was terrific. If you like great food and attentive
    > service, you should try this place."
    >
    > Key phrase extraction can provide some context to this review by
    > extracting the following phrases:
    >
    > - birthday celebration
    > - fantastic experience
    > - friendly hostess
    > - great food
    > - attentive service
    > - dinner
    > - table
    > - ambiance
    > - place

### Azure and Conversational AI

1.  Question Answering formerly QnA Maker

    The service functions like Frequency Asked Questions (FAQ).

    Use case is a bot to respond to questions. Azure AI Language allows
    creating a knowledge base of question and answer pairs that can be
    queried using natural language input.

2.  Conversational language understanding (CLU) formerly Luis

    CLU builds language models that interpret meaning of phrases in a
    conversation.

    Language understanding: command, intent, entity

    Example: commands like "turn on lights"

    - Intent: Turn on
    - Entity: Lights
    - Entity recognition: action

3.  Differences from Generative AI

    > Multiple AI capabilities are often working together, evolving
    > from, or building off of one another. These conversational AI
    > capabilities may look similar to what generative AI capabilities
    > look like today. Generative AI uses NLP as a foundation but
    > extends beyond it by creating new content.

### Azure AI Translator capabilities

Early ML translation used literal translation for each word where the
word was translated to the word in the target language. Limits of this
method are:

- When there no equivalent word in the target language
- The literal translation changes the meaning or does not get the
  context correct

Ideal translation must understand semantic context and grammar, tone,
and common language.

Azure AI Translator supports text to text translation or many languages
and allows translating a source document into multiple languages. It has
capabilities for:

- Text translation - real time translation
- Document translation - translatation while preserving original
  document structure
- Custom translation - build customized neural machine translation (NMT)
  systems

Azure AI Translator is in Azure AI Foundry

### Get started in Azure AI Foundry

Azure AI Language and Translator can be used in solutions and created
in:

- Azure AI Foundry portal
- Software development kit (SDK) or REST API

These resources in an Azure subscription can be used:

- Language resource - choose if you only plan to use Azure AI Language
  services, or if you want to manage access and billing for the resource
  separately from other services.
- Translator resource - choose if you want to manage access and billing
  for each service individually
- Azure AI services resource - choose if you plan to use Azure AI
  Language in combination with other Azure AI services, and you want to
  manage access and billing for these services together.

Services can be tested in the playground.

Resources in Azure can be created with scripts or manually in the user
interface.

## See Also

- [Introduction to AI in Microsoft Azure
  AI-900](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900) -
  [Introduction to AI in Microsoft Azure
  AI-900](id:dd87d682-2c98-4272-acb2-eafa6ebabf78)
