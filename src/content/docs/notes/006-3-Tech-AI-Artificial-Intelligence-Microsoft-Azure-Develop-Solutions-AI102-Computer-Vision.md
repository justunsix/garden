---
filetags: ":artificial-intelligence:ai:microsoft:azure:ai102:epubnote:computer-vision:"
id: 586c528a-cbe1-4d1d-9026-844ad393e82f
title: Computer Vision in Azure AI solutions
---

Source: My personal notes from [Course AI-102T00-A: Develop AI solutions
in Azure - Microsoft
Learn](https://learn.microsoft.com/en-us/training/courses/ai-102t00)
with labs from [Exercises for Develop vision solutions in
Azure](https://microsoftlearning.github.io/mslearn-ai-vision/)

## Image Analysis

Use cases: create captions for image, image tagging, detect and locate
objects and people

Existing models will respond with JSON with the image information.
Response will include information like entity and the boundary box of
the entity in the image.

Access can be using an SDK or API to submit images and get responses.

## Text in Images

Use cases: get information from text like addresses, identifiers,
numbers, photographer, license plates, and digitize notes

Optical character recognition (OCR) recognizes text and structure.
Responses from the service include blocks and text and information for
that block.

Example solution: A camera periodically uploads images to blob storage.
On an event, the code checks for an update, extracts entities and
responds.

## Facial Recognition: Detect, Analyze And Recognize Faces

Use cases: detect and locate faces, analyze facial features.

Using Azure AI face services requires approval due to sensitivity and
are used for facial recognition solutions. For features, see [Computer
Vision (CV) Concepts and in
Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-computer-vision) -
[Computer Vision (CV) Concepts and in
Azure](id:87af447e-094c-4839-a517-88cfd185b8e6)

Accessing Azure AI Vision Face resources can be done using Face SDK to
get detection and face attributes and features responses.

## Classify images and detect objects

Use case: classify images (categorization) and detect object(s) and
classify them

Classification can be:

- **Multi class** where each image is tagged with 1 class label from
  several, for example apple from \[apple, orange, pineapple, banana\].
- **Multi label** where each image can be tagged with multiple classes,
  for example fruit bowl with apple, orange, and banana

Example solutions: Food processing where image classification checks for
"good" versions of a food product and remove "bad" versions. Medical
imaging checks if a disease is present or not.

See [Research Data - Mendeley
Data](https://data.mendeley.com/research-data/?query=image%20classification)
for sample data sets to play with.

### Azure AI Custom Vision

Models can be trained with custom classifications.

## Generative AI and Vision

### Multimodel generative AI

Multimodel generative AI model respond to prompts and return created
content. Prompts can include text, speech, and images and typically
include a text part and media part.

### Generate images with AI

Uses prompt to create images.

Image generation can have responsible AI implications like other
generative AI with malicious use.

## Exercise: Analyze Images

Create Azure AI vision resource and using the SDK, submit images for
captions, entity location, get objects, tagging, and people
identification.

## Exercise: Detect and analyze faces

Create a face service and using the SDK, submit images for face
detection and boundary box location.

## Exercise: Generate images with AI

Use the OpenAI DALL-E generative AI model like `dall-e-3` to create
images and OpenAI Python SDK to create a simple app to generate images
based on prompts.

## See Also

- [Develop AI solutions in Azure
  AI-102](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)
- [Computer Vision (CV) Concepts and in
  Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-computer-vision) -
  [Computer Vision (CV) Concepts and in
  Azure](id:87af447e-094c-4839-a517-88cfd185b8e6)
