---
date: "2022-09-15 12:30"
description: "Microsoft Azure Virtual Training Day: AI Fundamentals"
filetags: ":artificial-intelligence:ai:microsoft:epubnote:"
id: 9db12dce-1cba-49a1-820b-bc0ba62c24da
title: Microsoft Artificial Intelligence (AI) Fundamentals
---

Source: My personal notes from course taught by [Tycho
Juta](https://nl.linkedin.com/in/tychojuta)

## Agenda

- Introduction to AI
  - What is AI, examples of AI, responsible AI.
- Machine Learning
  - Different algorithms
- Computer Vision
- Natural Language Processing
- Conversational AI
  - Bots

## Introduction to AI

### What is Artificial Intelligence?

- "Science and engineering of computers to perform tasks that imitates
  human intelligence"
- Examples: Self driving cars

Software that imitates human capabilities:

- Making decisions based on data and past experience
- Recognizing abnormal events
- Interpreting visual input
- Understanding written and spoken language
- Engaging in dialogs and conversations

It can do these things with limitations

### Common Artificial Intelligence Workloads

- Machine Learning: Predictive models based on data and statistics — the
  foundation for Al
  - Example: You notice as a bike rental business, you rent more bikes
    in warm weather. AI can confirm it.
- Anomaly Detection: Systems that detect unusual patterns or events,
  enabling pre-emptive action
  - Example: credit card fraud - like multiple location purchases
    - Mistakes can be made
- Computer Vision: Applications that interpret visual input from
  cameras, images, or videos
  - Example: facial recognition, distance measurement, detecting an
    activity like a violent interaction
- Natural Language Processing (NLP): Applications that can interpret
  written or spoken language
  - Example: spell check, spam filter
- Conversational AI: AI agents, (or bots), that can engage in dialogs
  with human users
  - Example: voice assistants

Combined example:

- Bot can use NLP to understand your request and make an insurance
  claim. It processes an impact you send such as car accident and
  detects claims for anomalies. It can create statistics of claims.

### Artificial Intelligence in Microsoft Azure

Why cloud/Azure? gives a scalable, reliable platform and allows large
data storage, compute, services

Services:

- Azure Machine Learning - A platform for training, deploying, and
  learning machine learning models
- Cognitive Services - A suite of services developers can use to build
  AI
- Azure Bot Service - A cloud-based platform for developing bot service

## Responsible AI

### Challenges and Risks of AI

When developing any AI, look at challenges and risks:

Item and Example

- Bias can affect results - A loan-approval model discriminates by
  gender due to bias in the data with which it was trained. Wrong
  relationships could come up due to data is not distributed.
- Errors can cause harm - An autonomous vehicle experiences a system
  failure and causes a collision. An medical algorithm fails to predict
  a disease.
- Data is exposed - A medical diagnostic bot is trained using sensitive
  patient data, which is stored insecurely
- Solution does not work for everyone - Predictive app has no audio
  output for visually impaired users
- Users must trust a complex system - An Al-based financial tool makes
  investment recommendations - what are they based on?
- Who's liable for AI driven decisions? - An innocent person is
  convicted of a crime based on evidence from facial recognition — who's
  responsible?

### Principles of Responsible AI

- Fairness
  - Example: bank loan approval model
- Reliability and Safety
  - Example: autonomous vehicle - needs extensive testing
- Privacy and Security
  - Example: training model/new training data needs to be kept secure
- Inclusiveness
  - Example: accessibility
- Transparency
  - Example: users understand how the system works and its limitations,
    explain why system did what it did, allow system feedback
- Accountability
  - Example: people must be accountable for its actions, governance
    framework

Demo:

- [Flip cards](https://aka.ms/hci-demo) on AI in practice and examples
  of responsible AI

## Machine Learning

### What is machine learning?

Creating predictive models by finding relationships in data

Example: you are a botanist and collect flowers and name them. Let
machine process it and figure out new flowers you pick.

### Regression Algorithm

Predict based on trends

Example: You notice as a bike rental business, you rent more bikes in
warm weather. Have AI learn training set (30-40% of data) and validation
set (60-70% of data). Use AI to process trend and check differences with
validation set. There will be some error between prediction and
validation set.

Trend in this case is slope of line / function

<figure>
<img
src="../media/Tech-Microsoft-AI-Fundamentals-2022-09-15-13-39-33.png" />
<figcaption>Regression function for bike rentals</figcaption>
</figure>

### Classification Algorithm

Example: check if a person has diabetes and you have other health
metrics on the person. Determine with other health metrics if a person
has diabetes.

- Divide data like above with 40% of dat as training and 60% as
  validation
- Predictions can have a certainty level
- When predictions are high certainty and positive and it matches
  validation set - true positive
- When predictions are high certainty and negative and it matches
  validation set - true negative
- False negative, False positive is similar when model does not predict
  the correct validation set

<figure>
<img
src="../media/Tech-Microsoft-AI-Fundamentals-2022-09-15-13-46-15.png" />
<figcaption>diabetes predication model</figcaption>
</figure>

<figure>
<img
src="../media/Tech-Microsoft-AI-Fundamentals-2022-09-15-13-47-09.png" />
<figcaption>accuracy of results with numbers for true positives and
negatives</figcaption>
</figure>

- This model shows a 90% accuracy. Accuracy may not always be useful for
  there are many true positives/negatives

### Clustering Algorithm

Example: Flower checking with flower length and number of petal.
Unsupervised model when other data is not available. Determine what are
the nearest flowers based on length and number of petals.

Iterate based on mean distance between points.

<figure>
<img
src="../media/Tech-Microsoft-AI-Fundamentals-2022-09-15-13-49-55.png" />
<figcaption>clustering and close relationships of flowers</figcaption>
</figure>

## Azure Machine Learning

### What is Azure Machine Learning?

Cloud-based platform for machine learning

- Azure Subscription
  - Azure ML Workspace
    - Compute
    - Data
    - Experiments - track all your previous work
    - Models
    - Services - publish work for use

Automated machine learning

- Supply data and desired model type, Azure ML finds the best model for
  you.
- Data -\> Find and iterate -\> Model

### Azure Machine Learning designer

- Visual tools to create a ML pipeline

1.  Training pipeline to train and evaluate model
2.  Create a inference pipeline to predict labels from new data
3.  Deploy the inference pipeline as a service for others/apps to use

Example: diabetes data -\> normalize data -\> split data -\> train model
using two-class logistic regression -\> score model \> evaluate model

### Demo of Azure Machine Learning Designer

[Demo](https://aka.sm/no-code-automl)

- Create machine learning workspace

  - Choose Enterprise to use with Azure ML Studio

- Compute instances (single computers), compute clusters (multiple
  computers)

- Inference clusters - uses your model

- Dataset

  - See data - for diabetes example shoes health metrics and diabetes
    indicator (1/0)
  - Data quality must be high and clean for training
  - Feature engineering: New columns can be created like calculated
    columns

- Pipeline design

  - Modules for us
  - Visualize results
    - Adjust threshold to visualize true/false positives/negatives
      table. Example: pregnancy test must have high true positives and
      low false positives and threshold must be adjusted to get that.

- Automated ML

  - Configure new run
    - Select data
    - Target column for prediction
    - Configure featurization (columns), automatic data quality cleaning
      and how to handle data issues
  - Runs can take hours and can be cancelled to find initial results and
    model for it to chose good algorithms

## Computer Vision

### What is Computer Vision?

- Computer gets images from pictures, cameras, videos
- Images are pixel, each pixel is array of values = pixel with r,g,b
  values
- Computer vision algorithms can detect colours and patterns like lines,
  circles

### Applications of Computer Vision

- Image classification
  - Example: identify a picture of a dog, taxi
- Object detection
  - Example: number of people in the picture, location of objects in
    image
- Semantic segmentation
  - Example: identify objects and pixels they are made up of and filter
    them
- Image analysis
  - Example: description of what image is
- Face detection and recognition
  - Example: identify face is in picture and attributes of face like
    feeling, age
- Optical character recognition
  - Example: identify text in image and translate it like for typed and
    written text

<figure>
<img
src="../media/Tech-Microsoft-AI-Fundamentals-2022-09-15-14-29-40.png" />
<figcaption>computer vision examples of the above
applications</figcaption>
</figure>

[Demo](https://aidemos.microsoft.com/computer-vision)

- Algorithm identifies objects in image with a confidence level,
  describes picture, check for racy and adult content

## Computer Vision in Azure

### Cognitive Services

- Al application resources in an Azure subscription:
  - Standalone resources for specific services
  - General Cognitive Services resource for multiple services
- Consumed by applications via:
  - A REST endpoint (<https://> address)
  - Authentication key

### Image Analysis with the Computer Vision Service

- Pre—trained computer vision model
- Object detection for over 10,000 predefined classes
- Image description and tag generation
- Face detection and analysis
- Content moderation
  - Ratings of adult, racy, and gore content
- Text detection and OCR

### Training Models with the Custom Vision Service

- Use for image classification, object detection

### Analyzing Faces with the Face Service

- More facial analysis functionality than the Computer Vision service,
  including:
  - Facial attributes:
    - Gender
    - Age
    - Emotions
- Facial recognition:
  - Similarity matching
  - Identity verification

### Reading Text with the Computer Vision Service

- Detect the location of text:
  - Printed
  - Handwritten
- Options for quick text extraction from images, or asynchronous
  analysis of larger scanned documents

### Analyzing Forms with the Form Recognizer Service

- Extract information from scanned forms in image or PDF format

  - Train a custom model using your own forms
  - Use the pre-trained receipt model

- Models perform semantic recognition of form fields — not just text
  extraction

- Train your own model, example scan receipts into a data set

### Computer Vision Service

[Demo](https://aka.ms/learn-image-classification)

- Create new compute resource
- Create new notebook
  - Paste git clone code from exercise
- Create custom vision resource
- Upload images for training at customvision.ai
- Train and test model with a test image
- Publish service
- Run code in notebook to test service and get true positive results

[Learn about computer vision](https://aka.ms/explore-computer-vision)

## Natural Language Processing (NLP)

### Introduction to Natural Language Processing

- Natural language = imprecise langage vs programmatic languages that
  are precise

### What is Natural Language Processing?

- Text analysis and entity recognition
- Sentiment analysis
  - Example: Twitter sentiments of comments
- Speech recognition and synthesis
  - Example: voice assistant, analysis of spoken language
- Machine translation
  - Example: automatic closed captions and transcripts
- Semantic language modeling
  - Multiple phrases can mean the same thing
  - Contextual and subject area meanings like a job

### Natural Language Processing in Azure

- Text analytics

  - Language detection
  - Key phrase extraction
  - Entity detection
  - Sentiment analysis

- Speech

  - Text to speech
  - Speech to text
  - Speech translation

- Translator

  - Text translation

- Language understanding

  - Custom language modeling

[Demo](https://aidemos.microsoft.com/text-analytics)

- Typed sentence and it shows sentiment, key phrases, entities (links to
  wikipedia), Bing entity search (relevant links/organizations in search
  engine)

### Text Analytics

Example: I had a wonderful vacation in France.

- Determine language of text: English
- Sentiment: Positive
- Key phrases: wonderful vacation
- Entities: France

### Speech Recognition and Synthesis

- Speech to Text: Use the speech-to-text capabilities of the Speech
  service to transcribe audible speech to text
- Text to Speech: Use the text-to-speech capabilities of the Speech
  service to generate audible speech from text

### Language Understanding (aka LUIS)

- "Switch the light on" - utterance, example of home automation
- "light" - entity - item referenced
- Turn on light - intent - desired action for utterance

[Demos](https://aidemos.microsoft.com/luis/demo)

[Demo for LUIS and Azure](https://aka.ms/learn-luis)

- Create new language understanding resource

- Create new app at [luis.ai](http://luis.ai) for home automation

  - Create new list entity for light/lamp, AC/fan
  - Add utterances for each intent like switch-on "turn on the light"
    and "turn on the fan" and for switch-off intent "turn off the light"
    and "turn off the fan"
  - Publish app, get keys from Azure language understanding resource
    using `Keys and endpoint` in Azure portal

- Run code in notebook to test service for home automation

- Add voice services to the LUIS demo

- Create Azure Cognitive Services resource

## Conversational AI

### What is Conversational AI?

- A solution that enables a dialog between an Al agent and a human
- Generically, conversational Al agents are known as bots
- Bots can engage over multiple channels:
  - Web chat interfaces
  - Email
  - Social media platforms
  - Voice

Examples: support chatbots, assistants, agents, health care assessments

### Responsible Al Guidelines for Bots

1.  Be transparent about what the bot can (and can't) do
2.  Make it clear that the user is communicating with a bot
    1.  User knows it is a bot, known limitations
3.  Enable the bot to seamlessly hand—off to a human if necessary
4.  Ensure the bot respects cultural norms
    1.  Code of conduct for bot
5.  Ensure the bot is reliable
6.  Respect user privacy
7.  Handle data securely
8.  Ensure the bot meets accessibility standards
9.  Assume accountability for the bot's actions

[Health Bot
Demo](https://www.microsoft.com/en-us/research/project/health-bot/)

- Assess symptoms, get a diagnosis options, and suggests care options
- Can be used to send information to a doctor

### QnA Maker Service

- Define a knowledge base of question and answer pairs:

  - By entering questions and answers
  - From an existing FAQ document
  - By using built-in chit-chat

- Consume the knowledge base from client apps, including bots

- Can train a model with the knowledge base and publish to use

### Azure Bot Service

- Cloud-based platform for developing and managing bots
- Integration with LUIS, QnA Maker, and others
- Connectivity through multiple channels (web chats, email, Microsoft
  Teams)

Create a bot demo

- Create QnA Maker resource
- Create app in qnamaker.ai using FAQ documents
- Train and test, then publish for use

## See also

### Resources

- [Learn More
  AI](https://docs.microsoft.com/en-us/certifications/azure-ai-fundamentals/)
