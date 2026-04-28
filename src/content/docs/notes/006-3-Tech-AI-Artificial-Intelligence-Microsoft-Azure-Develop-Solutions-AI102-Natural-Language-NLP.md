---
filetags: ":artificial-intelligence:ai:microsoft:azure:ai102:epubnote:natural-language:nlp:"
id: 97e2a0ac-74dd-40b0-bc77-5237767a4b9b
title: Natural Language and Natural Language Processing (NLP) in Azure
  AI Solutions
---

Source: My personal notes from [Course AI-102T00-A: Develop AI solutions
in Azure - Microsoft
Learn](https://learn.microsoft.com/en-us/training/courses/ai-102t00)
with labs from [Exercises for Azure AI Language
Exercises](https://microsoftlearning.github.io/mslearn-ai-language/)

## Analyze Text and Natural Language Processing (NLP)

Use cases for NLP –\> service output in Azure

- Language detection: with documents, can determine language(s) in text
  –\> detected language(s), confidence scores, identifiers
- Key phrase extraction: keywords –\> key phrase array
- Sentiment analysis: determine positive, neutral, negative –\>
  sentiment breakdown by sentence, confidence scores
- Named entity recognition: find and identify specific things in text
  like locations, people, addresses, food, actions –\> entity category,
  location in text, confidence scores
  - In Azure, can include custom named entities like organization's
    terms
- Entity linking: understand a word (entity) in text and its meaning –\>
  link a keyword in text to its Wikipedia article
- Summarizing text, content: outline –\> Extractive summarization
  selects key sentences directly from the text. Abstractive
  summarization rewrites key ideas using new phrasing.
- Personal identifiable information (PII) detection: detect and/or
  remove sensitive information like name, phone number, credit card –\>
  label sensitive fields, redacted text array, type of PII, confidence
  scores

Customizable models are available for each specific case. Generally
Azure AI services give JSON responses.

### Azure Deployment and Use

Deployment options include AI Foundry, Azure AI Services or a Language
services resource.

Send data for NLP and get response from Azure AI services.

## Conversational Understanding And Question Answering

The goal is having conversations between people and machines with
machines completing an action. The application is getting user input,
determine the user's intent (semantic meaning), and do the appropriate
action like call an API or do a function.

For example, a hotel chat app to help guests with requests like room
service. The conversation would need to determine the guest, room
number, and food order information and put in the kitchen order.

Interpreting user input is called natural language understanding (NLU).

### Conversational Language Understanding (CLU) Applications

CLU enables building an NLU component in a conversational application.

The NLU model understands utterances from the NL input and maps them to
intents that assign semantic meaning. It can recognize entities like
quantities, date and time, email, identifiers

Examples:

- Utterance: what is the time in Toronto
- Intent: Get Time (function)
- Entities: Toronto (location)

### Customizations and Configurations

Specific intents, entities, synonyms can be used to train a model to
understand them with utterances. Labelled utterances are used for model
training and evaluation. Ensure data is balanced with different
utterances and intents and language used is varied.

The trained model can be published at an endpoint.

Conversational Language Understanding (CLU) supports two modes for
training models:

- Standard training uses fast machine learning algorithms to quickly
  train your models but has limitations (English only as of 2026-04-23)
- Advanced training uses the latest in machine learning technology to
  customize models with your data. This training level is expected to
  show better performance scores for your models and enables you to use
  the multilingual capabilities of CLU

### Question Answering (QA)

Question Answering is a knowledge base of question and answer pairs with
NLP. Content, like an FAQ, is indexed and service is published as a REST
endpoint. Common inputs are FAQ websites, documents, and information
brochures.

Custom Question Answering projects can use active learning where
alternate questions to relevant question answer pairs can be reviewed
and added or manually added. Synonyms can be defined so QA knows
multiple words have the same meaning.

Synonym example

``` json

{
    "synonyms": [
        {
            "alterations": [
                "reservation",
                "booking"
                ]
        }
    ]
}

```

### Question Answering (QA) vs Language Understanding

QA is focused on static answers from known content with slight
variations possible. For LLMs, it is similar to [Retrieval Augmented
Generation (RAG)](/garden/notes/006-3-tech-ai-retrieval-augmented-generation-rag) -
[Retrieval Augmented Generation
(RAG)](id:4a445fad-74c1-42c9-bba8-fe0c067b6d23)

NLU focuses on understanding intents and performing actions.

| Use | Question answering | Language understanding |
|----|----|----|
| Usage pattern | User submits a question, expecting an answer | User gives utterance, expecting an appropriate response or action |
| Query processing | Use NLP to match question to answer | Use NLP to interpret the utterance, match it to an intent, and identify entities |
| Response | Static Response to known question | Response indicates likely intent and referenced entities |
| Client logic | Client presents answer to the user | Client responsible for performing appropriate action from detected intent |

## Custom Text Classification

Example are recognizing specific entities, organization or industry
terms and custom locations.

Define entity labels and label documents. Custom named entities will be
used for train models.

Minor changes like new named entities could be made in production since
the solution architecture stays the same.

## Speech Recognition And Synthesis

Speech use cases include:

- Speech \<–\> Text
- Translation
- Speaker recognition - who is speaking
- Pronunciation assessment
- Intent recognition

Azure Services are available in UI, CLI, SDKs, and REST APIs. See [AI
Speech and in
Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-speech) -
[AI Speech and in Azure](id:25041740-3fbb-4df4-9637-a23ee364ac68) for
description of capabilities.

### Custom Speech Models

Upload speech data to train a custom model (base model + changes). Model
is tested, updated, and accept model gets an endpoint for use

Custom voice combined with speech and NLP services above is possible.

### Speech Synthesis Markup Language (SSML)

XML- based language with customization options:

- Speaking styles
- Pauses and silence
- Phonetic pronunciation
- Prosody (pitch, range, rate)
- Say-as (number, date, time, address)
- Insert recorded speech, background

Example SSML

``` xml

<speak version='1.0' xmlns='http://www.w3.org/2001/10/synthesis' xmlns:mstts='https://www.w3.org/2001/mstts' xml:lang='en-US'><voice name='en-US-Ava:DragonHDLatestNeural'>Hello, welcome to Azure AI Foundry!</voice></speak>

```

## Translation

Source: [Translate text and speech - Training \| Microsoft
Learn](https://learn.microsoft.com/en-ca/training/modules/translate-text-speech/)

Use cases:

- Detect language and do translation, which can be one language to many
  languages.
- Transliteration of a language character set to character set of the
  target language like Japanese characters to English phonetic words
- Translation can be text, speech, or between text to speech and speech
  to text in batch or multiple target languages

Can be applied to document translation, custom translation for a domain
or industry, and in single task or batch translation. Options includes
accurate grammar, profanity filter.

### Translate Text/Speech

Azure Translator in Foundry Tools provides an API for translating text
in supported languages:

- Translate or transliterate text using the default translation model or
  a large language model (LLM).
- Translate documents, synchronously or asynchronously, while
  maintaining document structure.
- Use custom translation models to translate domain-specific terms.

Inputs and outputs could be text and speech.

When using speech functions, configuration through
`SpeechTranslationConfig` object allows API connection and with other
objects, configuration of languages, audio streams, text, and synthesis.

## Audio in Solutions

Audio can be added to apps, like prompts can be given with audio and
text and responses given as audio. API calls will include audio media.

## Exercise: Analyze text

Create a language service to analyze hotel review data using the SDK for
processing to return sentiment, entity and phrase analysis, and entity
linking.

## Exercise: Develop a text analysis agent

Azure Language in Foundry Tools supports analysis of text, including
language detection, entity recognition, and PII redaction.

- Use the service directly in an application through its REST API with
  an SDKs.
- Use the service in Azure Language in Foundry Tools MCP server to
  integrate its capabilities into an AI agent. It uses an AI Foundry
  endpoint and key

## Exercise: Use speech-capable generative AI models

Use generative AI models to support two use cases:

- Speech synthesis (text-to-speech) - generating speech output.
- Speech recognition (speech-to-text) - transcribing speech input.

## Exercise: Create a question answering solution

Create a language service which used Azure AI Search. Configure the
knowledge base with additional questions and follow up answers. Connect
to the service and ask questions using the SDK.

## Exercise: Custom Text Classification

Create a language service for custom text analysis and storage account
for custom text documents. Label testing and training data and train a
new model. Using the SDK, submit new text documents for classification
and see categories and confidence scores.

## Exercise: Develop an audio-enabled chat app

Create a Azure AI Foundry model with `Phi-4-multimodal-instruct`. Use
Azure AI Foundry and the Azure AI Inference SDK to create a client
application uses a multimodal model to generate responses to audio. The
audio was sent to the model and it provided acknowledgement of the
requests.

## See Also

- [AI Speech and in
  Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-speech) -
  [AI Speech and in Azure](id:25041740-3fbb-4df4-9637-a23ee364ac68)
- [Natural Language Processing (NLP) Concepts and in
  Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-natural-language-processing-nlp) -
  [Natural Language Processing (NLP) Concepts and in
  Azure](id:b71bbd44-c8d5-4221-b9c9-ec80f39e4d38)
- [Develop AI solutions in Azure
  AI-102](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)
- [Text to Speech (TTS) and Speech to Text
  (STT)](/garden/notes/004-data-processing-tech-data-science-text-to-speech-tts-speech-to-text-stt) -
  [Text to Speech (TTS) and Speech to Text
  (STT)](id:f7d86fd7-47ba-49c0-bb56-b5e7e4ee3341)
