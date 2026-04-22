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

### Example of Analyze Image

Source: [Analyze Image - Analyze Image - REST API (Azure Azure AI
Services) \| Microsoft
Learn](https://learn.microsoft.com/en-us/rest/api/computervision/analyze-image/analyze-image?view=rest-computervision)

Operation extracts a set of visual features based on the image content.
Two input methods are supported

1.  Uploading an image
2.  Give an image URL

Within your request, there is an optional parameter to allow you to
choose which features to return. By default, image categories are
returned in the response. A successful response will be returned in
JSON. If the request failed, the response will contain an error code and
a message.

Sample request and response

POST
<https://westus.api.cognitive.microsoft.com/vision/v3.2/analyze?visualFeatures=Categories,Adult,Tags,Description,Faces,Color,ImageType,Objects,Brands&details=Celebrities,Landmarks&language=en>

``` json
{
  "url": "{url}"
}

```

Sample Response

``` json

---

{
  "categories": [
    {
      "name": "abstract_",
      "score": 0.00390625
    },
    {
      "name": "people_",
      "score": 0.83984375,
      "detail": {
        "celebrities": [
          {
            "name": "Satya Nadella",
            "faceRectangle": {
              "left": 597,
              "top": 162,
              "width": 248,
              "height": 248
            },
            "confidence": 0.999028444
          }
        ]
      }
    },
    {
      "name": "building_",
      "score": 0.984375,
      "detail": {
        "landmarks": [
          {
            "name": "Forbidden City",
            "confidence": 0.9829016923904419
          }
        ]
      }
    }
  ],
  "adult": {
    "isAdultContent": false,
    "isRacyContent": false,
    "isGoryContent": false,
    "adultScore": 0.0934349000453949,
    "racyScore": 0.06861349195241928,
    "goreScore": 0.012872257380997575
  },
  "tags": [
    {
      "name": "person",
      "confidence": 0.9897908568382263
    },
    {
      "name": "man",
      "confidence": 0.9449388980865479
    },
    {
      "name": "outdoor",
      "confidence": 0.938492476940155
    },
    {
      "name": "window",
      "confidence": 0.8951393961906433
    },
    {
      "name": "pangolin",
      "confidence": 0.7250059783791661,
      "hint": "mammal"
    }
  ],
  "description": {
    "tags": [
      "person",
      "man",
      "outdoor",
      "window",
      "glasses"
    ],
    "captions": [
      {
        "text": "Satya Nadella sitting on a bench",
        "confidence": 0.48293603002174407
      }
    ]
  },
  "requestId": "0dbec5ad-a3d3-4f7e-96b4-dfd57efe967d",
  "metadata": {
    "width": 1500,
    "height": 1000,
    "format": "Jpeg"
  },
  "modelVersion": "2021-04-01",
  "faces": [
    {
      "age": 44,
      "gender": "Male",
      "faceRectangle": {
        "left": 593,
        "top": 160,
        "width": 250,
        "height": 250
      }
    }
  ],
  "color": {
    "dominantColorForeground": "Brown",
    "dominantColorBackground": "Brown",
    "dominantColors": [
      "Brown",
      "Black"
    ],
    "accentColor": "873B59",
    "isBWImg": false
  },
  "imageType": {
    "clipArtType": 0,
    "lineDrawingType": 0
  },
  "objects": [
    {
      "rectangle": {
        "x": 0,
        "y": 0,
        "w": 50,
        "h": 50
      },
      "object": "tree",
      "confidence": 0.9,
      "parent": {
        "object": "plant",
        "confidence": 0.95
      }
    }
  ],
  "brands": [
    {
      "name": "Pepsi",
      "confidence": 0.857,
      "rectangle": {
        "x": 489,
        "y": 79,
        "w": 161,
        "h": 177
      }
    },
    {
      "name": "Coca-Cola",
      "confidence": 0.893,
      "rectangle": {
        "x": 216,
        "y": 55,
        "w": 171,
        "h": 372
      }
    }
  ]
}

```

## Text in Images

Use cases: get information from text like addresses, identifiers,
numbers, photographer, license plates, and digitize notes

Optical character recognition (OCR) recognizes text and structure.
Responses from the service include blocks and text and information for
that block.

Example solution: A camera periodically uploads images to blob storage.
On an event, the code checks for an update, extracts entities and
responds.

### Example of Operation: Recognize Printed Text

Source: [Recognize Printed Text - Recognize Printed Text - REST API
(Azure Azure AI Services - Microsoft
Learn](https://learn.microsoft.com/en-us/rest/api/computervision/recognize-printed-text/recognize-printed-text?view=rest-computervision-v3.2&tabs=HTTP)

Sample response. Regions (blocks) have bounding boxes. Boxes have lines
and in the lines are words. Words are sets of text like the example
image `A GOAL WITHOUT`

Response is provided in `json` with the following structure:

- Metadata
- Regions
  - Bounding boxes
    - Lines
      - Words
        - Text

Each bounding box provides the coordinates in the image of the content
(lines, words, text).

``` json

{
  "language": "en",
  "textAngle": -2.0000000000000338,
  "orientation": "Up",
  "regions": [
    {
      "boundingBox": "462,379,497,258",
      "lines": [
        {
          "boundingBox": "462,379,497,74",
          "words": [
            {
              "boundingBox": "462,379,41,73",
              "text": "A"
            },
            {
              "boundingBox": "523,379,153,73",
              "text": "GOAL"
            },
            {
              "boundingBox": "694,379,265,74",
              "text": "WITHOUT"
            }
          ]
        },
        {
          "boundingBox": "565,471,289,74",
          "words": [
            {
              "boundingBox": "565,471,41,73",
              "text": "A"
            },
            {
              "boundingBox": "626,471,150,73",
              "text": "PLAN"
            },
            {
              "boundingBox": "801,472,53,73",
              "text": "IS"
            }
          ]
        },
        {
          "boundingBox": "519,563,375,74",
          "words": [
            {
              "boundingBox": "519,563,149,74",
              "text": "JUST"
            },
            {
              "boundingBox": "683,564,41,72",
              "text": "A"
            },
            {
              "boundingBox": "741,564,153,73",
              "text": "WISH"
            }
          ]
        }
      ]
    }
  ],
  "modelVersion": "2021-04-01"
}

```

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

### Multimodel generative AI with mixed media

A Multimodel generative AI model responds to prompts and returns created
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

## Exercise: Generate images with AI (DALL-E or Flux)

Use the OpenAI DALL-E generative AI model like `dall-e-3` or
`flux.2-pro` to create images and OpenAI Python SDK to create a simple
app to generate images based on prompts.

## Exercise: Develop a vision-enabled chat app

Use a generative AI model to generate responses to prompts that include
images. The app provides AI assistance with fresh produce in a grocery
store by using Microsoft Foundry and the OpenAI SDK.

## Exercise: Generate video with Sora in Microsoft Foundry

Sora is an AI model from OpenAI that creates realistic and imaginative
video scenes from text instructions. The model can generate a wide range
of video content, including realistic scenes, animations, and special
effects. It supports several video resolutions and durations, and can
also use reference images and remix existing videos.

- Deploy the Sora model
- Generate video content using the Microsoft Foundry portal
- Create app that generates videos from images, polls for completion
  status, and remixes existing videos.

## Exercise: Analyze images with Azure Content Understanding (ACU)

ACU in Foundry Tools is a capability available in Microsoft AI Foundry
that uses generative AI to analyze and interpret different types of
unstructured content, including documents, images, audio, and video.

Using AI models with content can generate structured outputs following a
user defined schema. These structured outputs make it easier to
integrate extracted information into automation, analytics, and search
workflows.

- Use Azure Content Understanding to analyze images and generate
  structured descriptions that help classify and index visual content,
  making it easier to locate relevant images and integrate them into
  search systems.
- Create and use an image analyzer in the Content Understanding Studio
  web interface
- Run the analyzer on sample images and review the generated
  descriptions that can be used as metadata for indexing and search such
  as `description` and `tags`. AI-generated image descriptions help make
  visual content searchable.

## See Also

- [Develop AI solutions in Azure
  AI-102](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)
- [Computer Vision (CV) Concepts and in
  Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-computer-vision) -
  [Computer Vision (CV) Concepts and in
  Azure](id:87af447e-094c-4839-a517-88cfd185b8e6)
