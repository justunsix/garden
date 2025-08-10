---
filetags: ":artificial-intelligence:ai:microsoft:azure:ai900:epubnote:"
id: dea94cad-796a-4c53-bf8a-99d0a9e88934
title: Introduction to AI in Microsoft Azure AI-900 Labs
---

Labs for hands on work related to [Introduction to AI in Azure -
Training \| Microsoft
Learn](https://learn.microsoft.com/en-us/training/paths/introduction-to-ai-on-azure/)
with labs described at [Microsoft Learn - Introduction to AI in Azure
exercises \|
mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/)

Each lab uses sign in at <https://ai.azure.com> and then manages
resources at <https://ai.azure.com/managementCenter/AllResources>. Each
lab takes 20-30 minutes though with exploration can take 1 hour.

## Explore Automated Machine Learning in Azure Machine Learning (1 hour)

[Explore Automated Machine Learning in Azure Machine Learning \|
mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/Instructions/Exercises/01-machine-learning.html)

Working on a model predicts number of bicycle rentals expected in a day,
based on seasonal and meteorological features.

- Create new Azure ML resource
- Use the Studio at <https://ml.azure.com>
- Authoring \> Automated ML \> New job with settings using
  - Task type: Regression
  - Primary metric: Normalized Root Mean Squared Error
  - Wait for job to finish, can take a while
- In Overview, view algorithm name and Metrics tab for residuals
  (difference in predicted and actual values) and predicted true chart
  comparing against true values.
- Deploy and test the model: Model tab and select Deploy using Real-time
  endpoint
- Test in ML studio \> Endpoints \> predict-rentals endpoint \> Test tab
- Use lab input data to test

## Explore generative AI in Azure AI Foundry portal (1 hour)

Source: [Explore generative AI in Azure AI Foundry Portal \|
mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/Instructions/Exercises/02-generative-ai.html)

- Create new AI Foundry resource, project in existing RG
- Playgrounds \> Try chat \> Deploy new gpt-4o model
- Use chat history interface
- Provide prompts about a Paris trip and iterate on locations,
  accommodations and city history

## Analyze text in Azure AI Foundry portal (1 hour)

[Analyze text in Azure AI Foundry portal \|
mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/Instructions/Exercises/03-text-analysis.html)

- Create new AI Foundry resource, project in existing RG
- Playground \> Try the Language playground
- Extract information \> Extract named entities
- Using a text sample below, run to review extracted entities

``` text

Tired hotel with poor service
The Royal Hotel, London, United Kingdom
5/6/2018
This is an old hotel (has been around since 1950's) and the room furnishings

```

- Next, select Extract key phrases and run, note details of subjects
- Summarize information tile \> Summarize text, run on a text sample.
  Note the Extractive summary (use key phrases directly from text)

## Explore speech in Azure AI Foundry portal (1 hour)

[Explore speech in Azure AI Foundry portal \|
mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/Instructions/Exercises/04-speech.html)

- Create new project
- Playgrounds \> Try Speech Playground
- Go to Real-time transcription
- Upload lab audio, listen to recording. In output Text, see
  transcription

## Analyze images in Azure AI Foundry portal (1 hour)

[Analyze images in Azure AI Foundry portal \|
mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/Instructions/Exercises/05-image-analysis.html)

- Create new project \> AI services \> Vision + Document
- Go to Image \> Image captioning tile
- Add captions to images page \> Upload lab images
- See generated caption text, repeat for Dense captioning (descriptions
  for image's content and other objects detected)
- Hover over an attribute in Detected attributed list
- Return to Vision + Document \> Image \> Common tag extraction tile
- Upload lab image and note tags and confidence scores
- Return to Vision + Document \> Image \> Common object detection
- Upload lab image, see Detected attributes of objects and scores,
  adjust Threshold slider to 70 to see changes

## Extract data with Content Understanding in Azure AI Foundry portal​ (1 hour)

[Extract data with Content Understanding in Azure AI Foundry portal \|
mslearn-ai-fundamentals](https://microsoftlearning.github.io/mslearn-ai-fundamentals/Instructions/Exercises/06-content-understanding.html)

- Create new project in the Azure AI services \> Try Content
  Understanding tile
- Create new task for understand an invoice
- Upload lab invoice file in Define Schema and use the Invoice data
  extraction template, complete analysis
- In Test Analyzer, review fields and confidence scores, check JSON
  results
- Build an analyzer: Analyzer list \> + Build Analyzer with invoice
  details
- Test the built analyzer using lab file, look at code and endpoint
  variable in code
