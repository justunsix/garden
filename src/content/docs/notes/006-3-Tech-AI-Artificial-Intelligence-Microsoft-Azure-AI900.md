---
filetags: ":artificial-intelligence:ai:microsoft:azure:ai900:epubnote:"
id: dd87d682-2c98-4272-acb2-eafa6ebabf78
title: Introduction to AI in Microsoft Azure AI-900
---

Source: My personal notes and comments from course series [Introduction
to AI in
Azure](https://learn.microsoft.com/en-us/training/paths/introduction-to-ai-on-azure/),
[Introduction to AI concepts - Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/modules/get-started-ai-fundamentals/),
and training session led by Kristin Deokiesingh

Learning goals of the course are: (1) Understand use cases of artificial
intelligence (AI), its concepts, technology implementation and how to
use it responsibly. (2) Apply use cases with services in Microsoft
Azure.

## AI Concepts

In general, AI mimics human activity. For example, human thinking,
sight, prediction, pattern recognition, hearing, and information
extraction. AI is approximating what the brain is doing using
computation.

Use cases for AI support these types of activities according to which
human capability to mimic:

Machine Learning - like human learning

- In comparison to programming a computer to do human functions
  precisely, the idea in machine learning is a computer can be
  trained/learn using an algorithm to predict the correct human
  capability given labeled input data.
- This learning can be applied to any task as long as there is data of
  the feature like what an orange looks like (features) and whether it
  is an orange or type of oranges (label).

Generative AI - like human creativity and pattern matching

- Assist human users like in chat
- Creating new content like documents that can be improved through
  iteration by a human or with the AI
- Creating natural language content, images, code
- Translation between languages
- Summarizing or analyzing content like documents, media

Computer Vision - like human sight

- Captioning, tagging photos
- Visual search
- Monitoring inventory and identifying items in retail
- Monitoring like security videos
- Facial recognition
- Robotics and self driving vehicles

Speech - like human voice and hearing

- Personal assistants with voice interaction
- Transcription of calls/meetings and language translation
- Audio description of content

Natural Language Processing (NLP) - like human content analysis

- Analyzing content to determine key subjects, mentions or things
- Evaluate sentiment and opinion on content like communications, social
  media
- Chatbots that answer common questions and manage predictable
  conversations

Extract data and insights - like human ability to follow a process and
analysis

- Processing of forms in a business process like an expense claim
- Make paper forms digital, for example scanning and archiving records
- Indexing documents for search and insights
- Find key points and actions in a meeting transcript or recording

Responsible AI - like human ability for audit, monitoring, checking, and
inclusion

- College admissions system the evaluate admissions fairly and according
  to criteria and must avoid discrimination
- Checking objects that for a criteria by determining the probability in
  the object identification and interacting with the object if it is
  confident
- Facial identification system and privacy to ensure facial images are
  only used for security purposes
- Chatbot that allows speech interaction and also creates captions for
  accessibility
- Loan approval application and lets users know it is an AI and explains
  data used for training and how its outputs are made

### Generative AI (Gen AI)

Gen AI is creating content like text, image, media. Content is based on
a language model which is trained on data like public information

Generative AI models has semantic relationships between language
elements like how words related to each other. The relationships allow
them to create meaningful sequence of text.

Large language models (LLM) and small language models (SLM) differ in
the amount of data and variables in the model. LLMs are more powerful
and good for general work, but are costly to train and use. SLMs are
better for focused work in a topic and usually cost less.

### Computer Vision

Computer vision is done by training a model with many images and helps
with identifying information in the image.

Image classification is when the model is trained with images that are
labelled with subject(s) in the image to allow it to analyze unlabeled
images and predict appropriate labels.

Object detection is when a model is trainer to identify the location of
specific objects in an image. Semantic segmentation is advanced object
detection where in addition to drawing a box around the object's
location, it can identify pixels that belong to the object.

Computer vision and language models can be combined to create a
multi-modal model the fit use cases of creating content and image
analysis.

### Speech

Speech recognition is when the AI can hear and understand speech,
usually through speech to text (STT) where audio is transcribed to text.

Speech synthesis is where AI can speak words, usually through text to
speech (TTS) where text is converted to audio. The technology includes
handing background noise, interruptions, and creating more expressive
and human voice.

### Natural Language Processing (NLP)

NLP uses models that are trained for text analysis. NLP may also be
referred to as natural language understanding (NLU).

While generative AI models can handle most NLP use cases, text analysis
tasks like these can be more cost effective using NLP:

- Entity extraction - finding mentions of people, things, places
- Text classification - assign content to a category
- Sentiment analysis - determine if text is positive, negative or
  neutral and check opinions
- Language detection - determin the language of the text

### Extract data and insights

Optical character recognition (OCR) and computer vision allow documents
to be read and analyzed. The OCR model can identify the location of text
in an image and advanced models can interpret values in the document and
get specific fields.

Data extraction models can range from getting fields from text forms to
models that extract information from other media like audio and video.

### Responsible AI

There are risks in using technology:

| Risk                           | Mitigation           |
|--------------------------------|----------------------|
| Bias                           | Fairness             |
| Error                          | Reliability & Safety |
| Data exposure                  | Privacy & Security   |
| Not for everyone               | Inclusion            |
| Distrust of results            | Transparency         |
| Who is responsible, governance | Accountability       |

AI must be created with these principles to address the risks:

- Fairness: includes inclusive data, attention of unconscious bias, and
  testing for fairness
- Reliability and safety: probability and when AI is incorrect and lower
  those risks
- Privacy and security: training data is protected, sensitive data is
  not disclosed and is secured
- Inclusiveness: services should be open to everyone and AI solutions
  must not exclude some users
- Transparency: users are aware of how system works and its limits
- Accountability: people and organizations giving AI solutions are
  accountable for AI actions and must have a governance framework with
  responsible AI.

Related concepts in [Ethics in the Age of Generative
AI](../006-3-tech-ai-artificial-intelligence-ethics-in-age-of-generative-ai) -
[Ethics in the Age of Generative AI - Generative AI and Ethics - the
Urgency of Now](id:5d269fc6-f581-421a-b2c9-bd4a90ad2ca1)

## AI services in Azure

- Machine Learning
- Language
- Models
- Content
- Search
- Face
- Translate
- Document Intelligence
- Content Understanding
- Speech
- Vision Understanding

Each service has endpoints & keys which allows specific service cost
management. There are multi-service accounts allowing access to several
services.

Both are consumption based and require selection of an Azure resource
group and data centre location like Canada Central.

## Course Modules

- [Machine Learning (ML) Concepts and in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-machine-learning) -
  [Machine Learning (ML) Concepts and in
  Azure](id:c04c162a-85c7-4295-b9b9-5bbb71270b1b)
- [Microsoft Azure AI Fundamentals, Generative
  AI](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-generative-ai) -
  [Microsoft Azure AI Fundamentals: Generative
  AI](id:4e618b1d-6f89-4eb3-811b-be31133ea2f3)
- [Natural Language Processing (NLP) Concepts and in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-natural-language-processing-nlp) -
  [Natural Language Processing (NLP) Concepts and in
  Azure](id:b71bbd44-c8d5-4221-b9c9-ec80f39e4d38)
- [AI Speech and in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-speech) -
  [AI Speech and in Azure](id:25041740-3fbb-4df4-9637-a23ee364ac68)
- [Computer Vision (CV) Concepts and in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-computer-vision) -
  [Computer Vision (CV) Concepts and in
  Azure](id:87af447e-094c-4839-a517-88cfd185b8e6)
- [AI Information Extraction Concepts and in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-information-extraction) -
  [AI Information Extraction Concepts and in
  Azure](id:927486ba-eab2-4f89-8813-ef846200341d)

### Exercises and Labs

- [Introduction to AI in Microsoft Azure AI-900
  Labs](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-introduction-labs) -
  [Introduction to AI in Microsoft Azure AI-900
  Labs](id:dea94cad-796a-4c53-bf8a-99d0a9e88934) - Exercises from
  Microsoft Learn course modules

## Mind Map of AI Use cases with Azure AI Services

Note for individual Azure AI Services, there is usually a free pricing
tier of the resource.

``` plantuml
@startmindmap

+ Azure AI Use Cases
++ Machine Learning
+++ Data preparation, loading, analytics
++++ Azure Databricks
++++ Microsoft Fabric and Power BI reports
++++ Azure AI Services
+++ Model training, data preparation, pipelines
++++ Azure Machine Learning
++++ Azure Machine Learning Studio
+++++[#lightgreen] Example: Setting up a a model for a specific task
+++ Model training, compute allocation and iterative tasks
++++ Automated ML
-- Generative AI
--- Chat
---- Copilot Chat
--- Model catalog and deployment
---- Azure AI Foundry
---- Azure AI Foundry Portal
-----[#lightgreen] Example: Write email for communication
---- Azure AI Foundry Model catalog
--- Conversational AI
---- Copilot Studio
--- Integration with Speech, Language, Vision
---- Azure AI Foundry hubs
-- Speech
--- Translation, recognition and synthesis
---- Azure AI Translator
--- Speech to text (STT)
---- Azure AI Speech
-----[#lightgreen] Example: Transcribing meeting audio
--- Text to Speech (TTS)
---- Azure AI Speech
-----[#lightgreen] Example: Reading aloud a document
++ Natural Language Processing
+++ Entity recognition, entity links, personal info identification, language detection, summarization, key phrase extraction, sentiment
++++ Azure AI Language
++++ Azure Language Studio, try free
+++ Conversational, FAQ
++++ Question Answering
+++++[#lightgreen] Example: Chatbot to answer common user questions
+++ Conversational, understanding commands, intent and entities
++++ Conversational language understanding (CLU)
+++++[#lightgreen] Example: Execute voice commands given to a system
+++ Text, document, custom translation
++++ Azure AI Translator
+++++[#lightgreen] Example: Translate document to another language to increase accessibility
+++ Translation and Language Integration
++++ Azure AI Foundry
+++++ Language resource
+++++ Translator resource
+++++ Azure AI Services resources
++ Computer Vision
+++ Experiments
++++ Vision Studio, try free
+++ Object detection, tagging, captions, OCR
++++ Azure AI Vision Image Analysis
+++++[#lightgreen] Example: Assess medical images for disease conditions
+++ Face detection, feature detection
++++ Azure AI Face service, Azure AI Foundry
+++++ Detecting smiles for taking a photograph
+++ Multiple media with face, translation, image and speech
++++ Azure AI Video Indexer
-- Information Extraction
--- Analyze images
---- Azure AI Vision Image Analysis
--- Extract insights from content
---- Azure AI Content Understanding
-----[#lightgreen] Example: Process and store data from submitted forms
--- Extract fields and data from structured content, custom models
---- Azure AI Document Intelligence
--- Assisted search and indexing of content
---- Azure AI Search
-----[#lightgreen] Example: Search for mentions of a service in a business case

@endmindmap
```

## See Also

- [Vector Database](../006-3-tech-ai-vector-database) - [Vector
  Database](id:67032821-f795-4059-bc63-ae4adada458a)
- [Ethics in the Age of Generative
  AI](../006-3-tech-ai-artificial-intelligence-ethics-in-age-of-generative-ai) -
  [Ethics in the Age of Generative AI - Generative AI and Ethics - the
  Urgency of Now](id:5d269fc6-f581-421a-b2c9-bd4a90ad2ca1)
- [Text to Speech (TTS) and Speech to Text
  (STT)](../004-data-processing-tech-data-science-text-to-speech-tts-speech-to-text-stt) -
  [Text to Speech (TTS) and Speech to Text
  (STT)](id:f7d86fd7-47ba-49c0-bb56-b5e7e4ee3341)
- [Applying Artificial Intelligence to
  Learning](../006-3-tech-ai-artificial-intelligence-microsoft-azure-applied-to-learning) -
  [Applying Artificial Intelligence to
  Learning](id:483fb086-6a97-47ac-a086-066fd91fd4e9)

### Resources

- [Introduction to AI in Azure - Training \| Microsoft
  Learn](https://learn.microsoft.com/en-us/training/paths/introduction-to-ai-on-azure/) -
  Course material
- [Microsoft Learn - Introduction to AI in Azure exercises \|
  mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/) -
  Labs and Exercise from Microsoft Learn course
- [AI-900 Study Collections and Resources \| Microsoft
  Learn](https://learn.microsoft.com/en-us/collections/ng06cjtrzn7rx7) -
  includes tokenizer, more training, AI and Azure, trial sites
- [AI shared responsibility model - Microsoft Azure \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/security/fundamentals/shared-responsibility-ai)
- [AI strategy - Cloud Adoption Framework \| Microsoft
  Learn](https://learn.microsoft.com/en-us/azure/cloud-adoption-framework/scenarios/ai/strategy?ns-enrollment-type=Collection&ns-enrollment-id=p64xbztoj1kkk5#define-an-ai-technology-strategy)
- [Tokenizer - OpenAI Platform](https://platform.openai.com/tokenizer)

1.  Azure AI Free / Trial Services

    - [Azure AI Foundry](https://ai.azure.com/explore/aiservices) (demos
      and resources)
    - [Azure AI Foundry Language](https://ai.azure.com/explore/language)
    - [Azure AI Foundry Vision and
      Document](https://ai.azure.com/explore/aiservices/vision)
    - [Azure AI Fountry
      Speech](https://ai.azure.com/explore/models/aiservices/Azure-AI-Speech/version/1/registry/azureml-cogsvc/tryout)
    - [Azure Language Studio](https://language.cognitive.azure.com/)
    - [Azure Vision
      Studio](https://portal.vision.cognitive.azure.com/gallery/featured)
    - [Azure Speech Studio](https://speech.microsoft.com/portal)

2.  Study and Certification Exam

    - [Study guide for Exam AI-900: Microsoft Azure AI Fundamentals \|
      Microsoft
      Learn](https://learn.microsoft.com/en-us/credentials/certifications/resources/study-guides/ai-900)
    - [Microsoft Certified: Azure AI Fundamentals - Certifications \|
      Microsoft
      Learn](https://learn.microsoft.com/en-us/credentials/certifications/azure-ai-fundamentals/?practice-assessment-type=certification#two-ways-to-prepare)
    - [AI-900 Certification Program - Instructions to
      Certify](https://learn.microsoft.com/en-us/collections/ng06cjtrzn7rx7)

3.  Recorded Learning

    - [AI-900: Microsoft Azure AI Fundamentals -
      YouTube](https://www.youtube.com/playlist?list=PLahhVEj9XNTfFP-841X_gdJ0nmjfjfCQN)
    - [AI-900 On Demand Instructor-led Training Series \| Microsoft
      Learn](https://learn.microsoft.com/en-gb/shows/on-demand-instructor-led-training-series/?terms=AI-900)

4.  YouTube series with John Savill

    - [AI-900 - Learning About Generative
      AI](https://www.youtube.com/watch?v=Ch6KE7KxHGM&t=23s) -
      transformers, encoding, attention, prompts, Azure services,
      responsible AI
    - [AI-900 Study Cram v2 (the non-Generative AI
      bits)](https://www.youtube.com/watch?v=bTkUTkXrqOQ&t=1s) - ML,
      training, Azure services and usage, computer vision, natural
      language, speech, information extraction
