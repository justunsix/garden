---
filetags: ":artificial-intelligence:ai:microsoft:azure:ai102:epubnote:generative-ai:"
id: d5571956-346d-433d-8500-0b58a819fffb
title: Generative AI in Azure AI Solutions
---

Source: My personal notes from [Course AI-102T00-A: Develop AI solutions
in Azure - Microsoft
Learn](https://learn.microsoft.com/en-us/training/courses/ai-102t00)
with labs from [Exercises for Develop generative AI solutions in
Azure](https://microsoftlearning.github.io/mslearn-ai-studio/)

## What is Artificial Intelligence

Data Science is applied math and statistics to analyze data has
components:

- Machine Learning - data and algorithms to train predictive models
  - Artificial Intelligence (AI) - software the emulates human abilities

### Machine Learning and Aspects of AI

Foundation: Machine Learning y = f(x)

- Generative AI
- Agents and Automation
- Natural Language
- Computer Vision
- Information Extraction

## Generative AI (GenAI)

GenAI creates content by a language model:

1.  Large language models (LLM) trained with lots of data, millions of
    parameters (weights) or Small language models (SLM) trained smaller
    amounts of data and fewer parameters
    - y = f(x) where x are parameters. Example is machine learning uses
      vectors to represent concepts in multiple dimensional space like
      dogs and cats.
2.  An input from a prompt. Promts can be:
    - System prompt: guidelines for model behaviour
    - User prompt: specific question
    - Created content
    - History: conversation history of previous prompts and responses
3.  Output of the generated response, example natural language, image,
    code

## GenAI in Azure AI Foundry

Some of AI Foundry functions were formerly called Azure AI studio.

2 project types:

- Azure AI Foundry project
- Azure AI hub project

### Models

Advantages is using Azure AI Foundry Models to combine use of different
models like OpenAI, Microsoft, X, Meta, HuggingFace models. When
choosing models, think about:

- Vendor, license
- Size and cost
- Performance metrics: quality, accuracy, fluency, groundness, latency,
  throughput, safety (attack vulnerability)
  - Compare models for the use case or constraints like cost and
    throughput. In Azure AI Foundry, use the model benchmarks and
    compare model functions
- Deployment options:
  - Managed compute: Virtual Machines (VM) are required, only cost is
    Azure hosted VMs
  - Serverless APIa
- Region availability
- Capabilities: agent/reasoning/streaming/assistant/other, industry,
  inference tasks like coding/math, fine tuning

Choosing a good model depends on the requirements and usage.

1.  Model Optimization

    Depends on use case:

    - Optimize for context like with contextual knowledge to maximize
      response accuracy, example: RAG
    - Optimize the model to improve response format, style, or speech to
      maximize consistency of behaviour, example: model fine-tuning

    These strategies can be combined to improve both accuracy and
    consistency.

    Look at other settings like temperature which determines have
    chaotic the responses can be. Higher temperature can result in more
    hallucinations and creative response while low temperature will be
    more factual.

2.  Model Questions and Answers on Context Use and Azure AI Foundry
    Model Hosting

    1.  Does the system prompt and things like current conversation
        history take up space in the context window during LLM
        interactions? the question comes from considering size of
        context windows when selecting models for different use cases

    Yes, system prompt and history do take up context window tokens.
    During chat in Azure AI foundry, see that tokens are used. For
    example, most models include history with the user's prompt and use
    tokens. However, applications can choose what they pass to the model
    like changing amount of history, no history and adjusting prompts.

    1.  In Azure AI Foundry, when using proprietary models like ones
        from Meta, Grok, do they run in a Microsoft data centre or
        depends?

    It depends on the model and is indicated during deployment. GenAI
    use compute which interface with the LLM. API calls are through
    Azure and logged by Microsoft. No customer data is used for model
    training.

    If there are externally hosted models, external organization will
    not do logging.

    1.  How does Azure AI deployment options like Global Standard or
        other options affect Data residency?

    Azure AI Foundry Models are hosted in different regions across the
    world, for example GPT 5 in East US.

    In an example, you want to use GPT 5 in the AI Foundry, the model is
    actually hosted in a certain region and shared. With "Global
    Standard", it will choose the closest or most available region. No
    data is kept where the model hosting is and processing occurs.
    Grounding data is kept in its original location. During processing,
    grounding data is sent by the solution to the model.

    During deployment, you can set the preferred region if global is not
    desired.

### Foundry Resource Organization

- Azure AI Foundry
  - Project
  - Hub
    - Project 1
    - Project 2
      - Azure resource
    - Services including AI, other Azure service like key vault, storage
      account
    - Users, models, connected resources (data, Azure resources,
      OpenAI), compute used/read access by all projects in hub

### Microsoft Copilot, Example of an agent

Copilot takes a user's prompt and sits in front of AI services like
LLMs, Microsoft Graph to get information for grounding, and compliance
and controls. Prompts and responses can be screened for controls. It is
an agent.

``` text

User --> Copilot --> LLM with modifed prompts
           |--> Microsoft Graph for messages
           |<-- Organization controls, constraints

```

## Exercise: Choose and Deploy a Language Model

If using a lab machine, do the lab in the machine like opening the
browser and logging in.

Choose the `gpt-4o` model, review its details and compare it with
`Phi-4-mini-instruct`. Use the gpt-4o model, set an alternative system
prompt, and try chat. Also deploy the Phi-4-mini-instruct model. In
chat, give both models riddles to test responses.

## Developing an Application with Azure AI Foundry SDK

Use the Azure AI Foundry SDK to connect securely to a project which has
access to multiple Azure AI services instead of connecting to each
service. For example, connecting to Azure AI services (formerly known as
Cognitive Services), Azure OpenAI service, Azure AI search like vector
search.

The developer requires the Azure AI Projects Client library and Entra
authentication

## Develop a RAG-based Solution with Your Own Data with Azure AI Foundry

Grounding means giving context to the model to allow it to give accurate
and relevant responses.

It uses [Retrieval Augmented Generation
(RAG)](../006-3-tech-ai-retrieval-augmented-generation-rag) - [Retrieval
Augmented Generation (RAG)](id:4a445fad-74c1-42c9-bba8-fe0c067b6d23)
which gets relevant data to include with a prompt to use for grounding
context.

Grounded approach uses an LLM with its original training data with
access to the relevant data for prompts to the application. The
grounding data, for example files, is put into a [Vector
Database](../006-3-tech-ai-vector-database) - [Vector
Database](id:67032821-f795-4059-bc63-ae4adada458a). Grouding data is
processed and set as vectors in the vector database. During prompting,
the LLM will use the database when creating a response to get relevant
ground content.

A similar approach is to put the relevant grounding data into the
prompt, so the LLM knows about it and then generate a response, though
it uses token and context.

### Using RAG with Azure AI

Example using Azure OpenAI API: Index data using Azure AI Search. Get
Azure AI Search connection and use it for responses.

## Fine-Tune A Language Model With Azure AI Foundry

To improve responses, strategies can include prompt engineering,
grounding, and fine-tuning a model.

### What is fine-tuning?

It is additional training for a foundation model resulting in a
fine-tuned model. It is separate from grounding.

Neural networks in the foundation model process information in the
layers and has weights. Fine tuning shifts the model weights with
example prompts and responses. Like "re-wiring the model's brain" and
similar human brain by strengthening neural pathways through practice.
Examples include formatting preferences, using professional tone.

### Preparing data for fine-tuning a model

Choose a model that supports fine-tuning and tuning type.

Data must be formatting as a JSON Lines (JSONL) document like:

`xbox-support-finetune.jsonl`

``` json
{
  "messages": [
    {
      "role": "system",
      "content": "You are an Xbox customer support agent whose primary goal is to help users with issues they are experiencing with their Xbox devices. You are friendly and concise. You only provide actual answers to queries, and do not provide answers that are not related to Xbox."
    },
    {
      "role": "user",
      "content": "Is Xbox better than PlayStation?"
    },
    {
      "role": "assistant",
      "content": "I apologize, but I cannot provide personal opinions. My primary job is to assist you with any issues related to your Xbox device. Do you have any Xbox-related issues that need addressing?"
    }
  ]
}
```

### Fine-tuning

See [Customize a model with Azure OpenAI in Azure AI Foundry Models -
Azure OpenAI \| Microsoft
Learn](https://learn.microsoft.com/en-us/azure/ai-foundry/openai/how-to/fine-tuning?tabs=azure-openai&pivots=programming-language-studio)
and related lab at [Fine-tune a language
model](https://microsoftlearning.github.io/mslearn-ai-studio/Instructions/05-Finetune-model.html)

Select a model, your training data, and optionally your validation data.
Advanced options can be set:

| Name | Description |
|----|----|
| batch<sub>size</sub> | Number of training examples used to train a single forward and backward pass |
| learning<sub>ratemultiplier</sub> | Original learning rate used for pre-training multiplied by this value |
| n<sub>epochs</sub> | The number of epochs to train the model for |
| seed | Random seed used to control the reproducibility of the job |

An epoch refers to one full cycle through the training dataset

## Responsible Generative AI, Responsible AI (RAI)

When planning, use the following approach:

- Map potential harms for planned solution
- Measure harms in the solution's outputs
- Mitigate harms using multiple layers like:
  - Model
  - Safety system
    - Content filters, thresholds for violence, hate and unfairness,
      sexual content, self harm
    - Prompt shields to prevent "jailbreak" attacks by malicious people
      that want to work around content safety
  - System message and grounding
  - User experience
- Manage the solution responsibly through deployment and operations

## Evaluating Generative AI Performance

Examples:

Comparisons: Compare an input with the expected response. Comparisons
can be done across models to check model suitability.

Automated evaluation: Use test data and compare results, test data
generation and evaluation can be AI assisted and automated. Results are
evaluated on different criteria like:

- Quality of answers like accessibility, tone
- Quality using specific scores
- Risk and safety measuring violent, sexual, self-harm content

## Exercise: Create a chat app

Deploy a `gpt-4o` model in the foundry and using the endpoint
information and Azure identity and AI libraries in Python, call the
model with prompts to receive responses.

For this exercise and others, see completed lab code at [GitHub -
justunsix/automatetheboringstuff-py-tests: Testing
Python](https://github.com/justunsix/automatetheboringstuff-py-tests)

## Exercise: Create an generative AI using your own data

Create new AI hub resource and create an ada-002 embedding model and
gpt-4o model. Add data in the form of PDF documents with travel
brochures for cities and index them with Azure AI Search.

Set up the GPT chat with the indexed data in the chat playground and
give it a prompt and observe usage and citing of the indexed data.

Using code, call the chat model with the Azure AI Search index and
vectorize the query. Give it a prompt and observe usage and citing of
the indexed data.

## Exercise: Apply Content Filters to prevent output of harmful content

Create an AI Foundry gpt-4o model. Set up content filters and see
changes in responses to high offensive or worrisome prompts.

## Exercise: Evaluate generative AI model performance

Create two models and upload travel agent chat questions and expected
answers. Use manual inspection of results with the questions with gpt-4o
to evaluate answers. Use automated evaluation of gpt-4o-mini using
gpt-4o as an evaluator based on various methods like semantic
comparison.

## Exploration Questions

Q: What are ways for an application to authenticate for using the API?

Entra ID is preferred. In the lab, `az login` does that login. If an
application cannot use Entra ID, the API endpoints and keys can be used,
but not recommended.

Q: I'm interested in the RAG app we worked on yesterday in the labs and
expanding on it like an operational knowledge base for employees. What
is your recommendation after this course to apply the RAG concepts we
learned. So far going through the [Python SDK
docs](https://learn.microsoft.com/en-us/python/api/overview/azure/ai-projects-readme?view=azure-python),
[library docstrings](https://pypi.org/project/azure-ai-projects/) and
Microsoft Learn docs for [Azure AI Search, Azure AI Foundry
Models](https://learn.microsoft.com/en-us/azure/ai-foundry/concepts/retrieval-augmented-generation)
were helpful

Read and understand vector databases and [Azure AI
Search](https://learn.microsoft.com/en-us/azure/search/search-what-is-azure-search)
for indexing data.

Another approach is investigate data stores like Cosmos DB. Content can
be stored as a vector in a database and application calling the model
can use the database. For examples, vectors can be added as an
additional column in a table.

Q: What happens when models change?

If using a specific model like gpt-4o, the model might be updated with
the latest training information, but the same version of the model would
have similar reasoning and functionality and not require further changes
after deployment and use with a solution.

## See Also

- [Develop AI solutions in Azure
  AI-102](../006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102) -
  [Develop AI solutions in Azure
  AI-102](id:dc608ccd-b4bc-4820-8bfa-e522c827e6f8)
- [Machine Learning (ML) Concepts and in
  Azure](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-machine-learning) -
  [Machine Learning (ML) Concepts and in
  Azure](id:c04c162a-85c7-4295-b9b9-5bbb71270b1b)
- [Microsoft Azure AI Fundamentals, Generative
  AI](../006-3-tech-ai-artificial-intelligence-microsoft-azure-ai900-generative-ai) -
  [Microsoft Azure AI Fundamentals: Generative
  AI](id:4e618b1d-6f89-4eb3-811b-be31133ea2f3)
