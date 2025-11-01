---
date: 2025-01-25
filetags: ":ai:artificial-intelligence:epubnote:"
id: db7175d9-6a78-432d-888c-222e40787201
title: Open AI
---

Source: [OpenAI Documentation](https://openai.com/docs/introduction/)

## Introduction

- OpenAI API can be use for any task involved in understand/generating
  natural language or code.
- Different models are available for different tasks depending on power
  and task:
  - Content generation
  - Summarization
  - Classification, categorization, sentiment analysis
  - Data extraction
  - Translation
  - Conversation
  - Creative writing
  - Style changes
  - And More

### Tutorial

- Create good instructions to get good results
  - Tell the model what you want
  - Give examples of what you want

``` txt

Suggest three names for an animal that is a superhero.

Animal: Cat
Names: Captain Sharpclaw, Agent Fluffball, The Incredible Feline
Animal: Dog
Names: Ruff the Protector, Wonder Canine, Sir Barks-a-Lot
Animal: Horse
Names: The Mighty Steed, The Great Equine, The Valiant Charger

```

- With a temperature above 0 (like 1), different names will be suggested
  for completions. Low temperature is less risky and more accurate and
  deterministics, while higher temperature is more risky and more
  creative and diverse completions.
  - For the name example, a moderate temperature of 0.6 works.
- Want to provide more examples or a better trained model? Use the
  [fine-tuning API](https://beta.openai.com/docs/guides/fine-tuning) to
  provide 100+ - 1000s+ examples to customize a model for your specific
  use case.

### Prompts and Completions

- Completions endpoint is a simple use of the API with a `/prompt/` and
  the model generates a compleition.
- See [Examples](https://beta.openai.com/examples) for sample prompts,
  how to them them, and example completions.

### Tokens

- Tokens can be words or chunks of characters, generally 1 token = 4
  characters / 0.75 words of English
- Most models are limited to 2048 token inputs

### Models

- The API uses a set of models with different capabilities and costs.
- Base GPT-3 models are: Davinci, Curie, Babbage, and Ada. Codex series
  is a descendant of GPT-3 trained on natural language and code.
