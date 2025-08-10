---
date: 2023-02-25
filetags: ":ai:artificial-intelligence:power-platform:epubnote:"
id: d85c6b3c-b675-46bd-8399-7919d2a3a6b3
title: Microsoft Power Platform and AI
---

## Using AI to make Building Power Platform Solutions Easier

Source: My notes from session at Microsoft with April Dunnam on 2023-02

- Include AI models for NLP, code, and image generation from OpenAI
  connectors
  - See PowerPlatformConnectors on GitHub for more information
  - Other connectors are available and independent publisher connectors
    now are more than certified ones
- Integrate with GPT-3, ChatGPT, Codex, and DALL-E

### Demonstration

- Current connection with OpenAI can use GPT-3 to complete or read an
  image
  - Configure the connector like API key before use
- Built a chatbot that integrates with GPT-3
  - Power Apps
- Can be used with Power Automate
  - Example: trigger, generate an image

### Power Apps In Product AI Support

- Microsoft Power Fx is low code computer language for logic
- Power Fx can call GPT-3 and PROSE
  - GPT-3 large AI model
  - PROSE develops API for programming by examples
  - Examples:
    - Reformat names from input, like reverse names
    - Format inputs to match a specific format
    - Natural language prompt to generate a Power Automate flow
    - Format data with examples
- Build flow with natural language
  - Will be built from existing connectors
  - Example
    - "grab form details and add to SharePoint"
    - "format data using my examples"
  - It will suggest a flow and expressions
- Assist in Power Apps Studio
  - Select a component and click a purple/light bulb icon to generate
    Power Fx

### AI Builder

- AI Builder is built on top of Azure AI
- AI Builder in Power Automate
  - Example:
    - Process invoices and get data, OCR
  - Build intelligent solutions
    - Process input
    - Parse fields as metadata into data source
    - Process and route or act on data source input
    - Sentiment analysis
  - Can use pre-built and custom AI models
    - Pre-built like business card, ID document readers
  - Canvas apps can using AI builder like process business cards
- Good place to start is Power Automate \> AI Builder \> Explore
  - Document processing like US Passport model to use in flow
  - Trial available

### Recommendations

- See prompt [OpenAI prompt
  examples](https://platform.openai.com/examples) and [OpenAI text
  completion prompt
  design](https://platform.openai.com/docs/guides/completion)
- Use smaller prompts
- Feed off the existing outputs and asks AI for clarifications
- AI builder is available in canvas apps and automate, though not model
  driven yet
  - It can detect issues in input

### Questions

- How to get profile in directory?
  - Get AAD profile using Get Profile function
  - In Canvas App: App \> On Start \> Code:

Per the demo, the code is stored in the App \> On Start part of the
Power App and then can be called from the UI component.

``` powerfx

Set(
  currentUser,
  User()
);
Set(
profilePhoto,
Office365Users.UserPhotoV2(currentUser.Email)
);
Set(
  varCategory,
  Param("Category")
)

```

## See Also

- [Artificial Intelligence
  (AI)](../006-3-tech-ai-artificial-intelligence) - [Artificial
  Intelligence (AI)](id:bfe7af6c-9a91-4f3e-a98c-60ed67b8285a)
- [Create Power Platform solutions with AI and
  Copilot](../005-tech-microsoft-power-platform-ai-solutions-and-copilot) -
  [Create Power Platform solutions with AI and
  Copilot](id:09ea5ea0-19da-40ca-bb27-f78ed8938e2f)

### Resources

- [OpenAI prompt examples](https://platform.openai.com/examples) and
  [OpenAI text completion prompt
  design](https://platform.openai.com/docs/guides/completion)
