---
filetags: ":artificial-intelligence:generative:ai:azure:epubnote:"
id: 4e618b1d-6f89-4eb3-811b-be31133ea2f3
title: "Microsoft Azure AI Fundamentals: Generative AI"
---

\#date: 2025-04-09

Source: My personal notes and comments from [Microsoft Azure AI
Fundamentals: Generative
AI](https://learn.microsoft.com/en-us/training/paths/introduction-generative-ai/)
course, Retrieved 2025-04-09

Use cases for generative AI can be:

- Assistants and custom ones to build on for complex applications like
  use of agents
- Analyze and use data

## Introduction to Generative AI

### What is Generative AI?

- Generative AI is artificial intelligence where models are trained to
  generate new original content from natural language input
- Learning will show:
  - Large language models (LLM) support generative AI
  - About Azure OpenAI service
  - Application such as copilots and use cases
  - Prompt and response tuning
  - Ethical AI
- Takes natural language input from a person and returns responses like
  language, images, code, and media.

### Large Language Models (LLM)

A LLM is specialized type of machine learning model to do natural
language processing (NLP) tasks

1.  Tokens

    Tokenization is to put training text in tokens to identify unique
    text values, could be words, partial words, and works and
    punctuation. With tokens, statistics can be used with computers to
    find patterns and apply rules.

    For example:

    ``` txt

    I (1)
    heard (2)
    a (3)
    dog (4)
    bark (5)
    loudly (6)
    at (7)
    ("a" is already tokenized as 3)
    cat (8)
    The sentence can now be represented with the tokens: [1 2 3 4 5 6 7 3 8]. Similarly, the sentence "I heard a cat" could be represented as [1 2 3 8].

    As you continue to train the model, each new token in the training text is added to the vocabulary with appropriate token IDs:

    meow (9)
    skateboard (10)
    and so on...

    ```

2.  Word Embeddings

    The application of deep learning techniques to NLP is word
    embeddings which helps set the semantic relationship between words.

    - They are created during self-supervised learning. During training,
      model finds occurrence of patterns of words in sentences and
      represents them as vectors (coordinates in a multidimensional
      space).
    - The semantic relationship is the distance between vectors
      - For example, `bike` and `car` are used in same patterns of words
        and are used like driving, buying, or repairing them. As a
        result, the model will put the bike and car words close in
        vector space. See [Vector
        Database](../006-3-tech-ai-vector-database) - [Vector
        Database](id:67032821-f795-4059-bc63-ae4adada458a) for more on
        vectors and a simple example
      - The training can have issues like:
        - Words of `love` and `hate` may seem related, despite being
          different
        - Single words like `bank` (place, verb, business, item) can be
          different meanings and could be related to many words and will
          be semantically different depending on usage

3.  Need for Context

    As a explained in word embedding, context is important in the use of
    the word, but currently not stored due to complexity and cost.
    Recurrent Neural Networks (RNNs) can help with context.

    RNNs use steps to take an input and a hidden state and each step
    makes an output and can be used as input to the next step. For
    example, an NLP task is the predict the value of the last word in:
    Vincent Van Gogh was a painter known for \[MASK\]. The network's
    memory is given information about Vincent and through multiple steps
    can process words in the sentence together to predict the \[MASK\]
    token. For example, Vincent Van Gogh was a painter known for
    <u>Starry Night</u> .

    RNN limitations:

    - Hidden state is limited size
    - Some words are more relevant than others in the prediction, but
      RNN does not know that and irrelevant information is in the hidden
      state

### Transformers and Language Models

Current generative AI applications use transformer architecture which
improve models' ability to understand and generate text. Transformer
architecture as two components:

- Encode: processing input and create a representation with context of
  tokens

- Decoder: generative output by looking at the encode's representation
  and predicting the next token in the sequence

- Transformer models - trained on large text data to understand semantic
  relationships to determine probable sequences of text

  - Two blocks:
    - Encode block - creates relationships of training data
      - Example: BERT used in Google search
    - Decoder block - generate new content
      - Example: GPT
  - Each text data is tokenized:

With training, many tokens are compiled

1.  Positional Encoding

    Transformers use positional encoding which is the sum of word
    embedding vectors and positional vectors. The result is encoded text
    has information about the meaning and position of a word in a
    sentence.

    To encode the position of a word in a sentence, a single number
    represents the index value.

2.  Attention and Relationships

    Attention is used to establish relationship between tokens.

    Transformers use an attention function where a new word is encoded
    using positional encoding and represented as a query. The output of
    encoded word is a key with a related value. For example,
    `Vincent Van Gogh` is a query and related to the key `painter`. The
    key and values are stored in a table for decoding later.

    The attention function calculations help determine the most relevant
    output. Transformers use multi-head attention meaning tokens are
    processing by the attention function in parallel to get different
    kinds of information from a sentence.

### Different Language Models
