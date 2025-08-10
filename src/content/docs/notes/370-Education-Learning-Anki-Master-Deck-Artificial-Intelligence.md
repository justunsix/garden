---
filetags: ":machine-learning:anki-emacs:anki-deck:artificial-intelligence:ai:epubnote:"
id: 18b5d0b7-d31c-47b0-8b5d-81541a537828
title: Anki Deck for Learning Artificial Intelligence
---

Anki deck cards to help with learning listed at [Artificial Intelligence
(AI)](../006-3-tech-ai-artificial-intelligence) - [Artificial
Intelligence (AI)](id:bfe7af6c-9a91-4f3e-a98c-60ed67b8285a) Some cards
were generated with the help of Microsoft Copilot Artificial
Intelligence (AI) and are being updated or corrected.

# Areas of artificial intelligence

## Front

What are the 5 areas of AI use cases and functions

Hint: they are like human capabilities and senses

## Back

1.  Generative AI - like human creativity and pattern matching
2.  Computer Vision - like human sight
3.  Speech - like human voice and hearing
4.  Natural Language Processing (NLP) - like human content analysis
5.  Extract data and insights - like human ability to follow a process
    and analysis

Bonus: Responsible AI - human ability for audit, monitoring, checking,
and inclusion is required in application of AI.

# Introduction to Artificial Intelligence Microsoft Azure AI-900

## Machine Learning <span class="tag" tag-name="machine"><span class="smallcaps">machine</span></span> <span class="tag" tag-name="learning"><span class="smallcaps">learning</span></span>

### Goal of Machine Learning

1.  Front

    What is the goal of Machine Learning (ML)?

2.  Back

    To create a predictive model by combining data science and software
    engineering, enabling software to make predictions using past data.

### ML Model as a Function

1.  Front

    How is a Machine Learning model structured as a function?

2.  Back

    An ML model is a function y = f(x), where x is a vector of input
    features and y is the predicted output. After training, the model
    generalizes this function to make predictions.

### Supervised vs Unsupervised Learning

1.  Front

    What is the difference between supervised and unsupervised learning?

2.  Back

    Supervised learning uses labeled data to train models to predict
    known outcomes. Unsupervised learning uses unlabeled data to find
    patterns or groupings without predefined labels.

### Types of Machine Learning

1.  Front

    What are the main types of Machine Learning?

2.  Back

    - Supervised Learning: uses labeled data (\[x1, x2, x3\], y)
      - Regression: numeric labels
      - Classification: categorical labels (binary or multiclass)
    - Unsupervised Learning: uses unlabeled data (\[x1, x2, x3\])
      - Clustering: groups data based on feature similarity

    Deep Learning (subset of ML using neural networks)

### What is inferencing in machine learning?

1.  Front

    What is inferencing in machine learning?

2.  Back

    Inferencing is the process of using a trained machine learning model
    to make predictions on new data by applying the model's function to
    input features.

### What is the difference between regression and classification?

1.  Front

    What is the difference between regression and classification?

2.  Back

    Regression predicts numeric values (e.g., ice cream sales), while
    classification predicts categorical labels (e.g., disease risk).

### What is a confusion matrix used for?

1.  Front

    What is a confusion matrix used for?

2.  Back

    A confusion matrix visualizes the performance of a classification
    model.

    A matrix with the number of correct and incorrect predictions for
    each possible class label like:

    |     |       |       |
    |-----|-------|-------|
    |     | y-hat | y-hat |
    | y   | 0     | 1     |
    | 0   | 2     | 0     |
    | 1   | 1     | 3     |

    This visualization is called a confusion matrix showing prediction
    totals of: In the matrix, true predictions are on the diagonal line
    from top left to bottom right.

    - ŷ=0 and y=0: True negatives (TN)
    - ŷ=1 and y=0: False positives (FP)
    - ŷ=0 and y=1: False negatives (FN)
    - ŷ=1 and y=1: True positives (TP)

### What does the R² (coefficient of determination) metric indicate?

1.  Front

    What does the R² (coefficient of determination) metric indicate?

2.  Back

    The coefficient of determination (more commonly referred to as
    R<sup>2</sup> or R-Squared) is a metric that measures the proportion
    of variance in the validation results that can be explained by the
    model, as opposed to some odd aspect of the validation data (for
    example, a day with a highly unusual number of ice creams sales
    because of a local festival).

    R2 is more complex then previous options and compares the sum of
    squared differences between predicted and actual labels with the sum
    of squared differences between the actual label values and the mean
    of actual label values, like this:

    R2 = 1- ∑(y-ŷ)<sup>2</sup> ÷ ∑(y-ȳ)<sup>2</sup>

    The result is a value between 0 and 1 that describes the proportion
    of variance explained by the model:

    - Closer to 1 this value is, means the better the model fits
      validation data
    - In example ice cream regression model, the R2 calculated from the
      validation data is 0.95.

### What is the purpose of the softmax function in multiclass classification?

1.  Front

    What is the purpose of the softmax function in multiclass
    classification?

2.  Back

    Softmax converts raw scores into probabilities for each class,
    ensuring they sum to 1. The class with the highest probability is
    selected.

    Example is a model predicts these scores:

    - Cat: 2.0
    - Dog: 1.0
    - Bird: 0.1

    Using the Softmax function, these scores will be transformed into
    probabilities:

    - Cat: 0.73 (73% chance)
    - Dog: 0.25 (25% chance)
    - Bird: 0.02 (2% chance)

### What is the role of centroids in K-Means clustering?

1.  Front

    What is the role of centroids in K-Means clustering?

2.  Back

    Centroids are the center points of clusters that features vectors
    are organized close to. Data points are assigned to the nearest
    centroid, which is updated iteratively to minimize distance.

    - Features (x) are vectorized to n-dimensional coordinates (n is the
      number of features). In the example, we use leaves (x1) and petals
      (x2) and would have coordinates in 2 dimensional space \[x1, x2\]
    - Each data point (example observed flower) is assign to its nearest
      centroid
    - The centroids are moved to the centre of the data points assigned
      to it based on mean (average) distance between the points
    - After the centroid moves, the data points are reassigned to
      clusters based on the new closest centroid.
    - The centroid movement and cluster reassignment can be repeated
      until becoming stable or set number of iterations

### What are ways to evaluate a binary classification model in ML

1.  Front

    What are ways to evaluate a binary classification model in ML?

    List at least 3 ways and summaries of them.

2.  Back

    - Accuracy uses the confusion matrix to check proportion of
      predictions the model get right
    - Precision measures how many predicted positives are true positives
    - Recall measures how many actual positives were correctly predicted
    - F1-score is a combination of recall and precision
    - Area Under the Curve (AUC) uses the true positive rate and false
      positive rate to determine how often to expect the model to be
      correct.

    Bonus: multiclass classification models can be evaluated using a
    confusion matrix with multiple labels against features and then the
    above methods can be used for each class.

### What are the steps in designing a machine learning solution in Azure?

1.  Front

    What are the steps in designing a machine learning solution in
    Azure?

2.  Back

    1.  Define problem and decide on type of model
    2.  Get data
    3.  Prepare data - explore, clean, and transform data for the model
    4.  Train model - choose algorithm, hyperparameter values and
        experiment.
    5.  Integrate the model - deploy to an endpoint
    6.  Monitor - check the model's performance

### Azure ML solutions

1.  Front

    Following the problem \> data \> train model \> use model \> monitor
    steps of an ML solution in Azure, what are possible Azure services
    used for:

    1.  Data management and loading
    2.  Model training, including data management, pipelines
    3.  Integrations with model, including visualizations and reports
    4.  Using prebuilt models and APIs for them and customizing models

2.  Back

    1.  Data management and loading: Azure Databricks, Synapse Analytics
    2.  Model training, including data management, pipelines: Azure
        Machine Learning, and its Studio UI, Azure Automated Machine
        Learning
    3.  Integrations with model, including visualizations and reports:
        Microsoft Fabric
    4.  Using prebuilt models and APIs for them and customizing models:
        Azure AI Services

### What is the function of the encoder and decoder in transformer models?

1.  Front

    What is the function of the encoder and decoder in transformer
    models?

2.  Back

    Encoder processes input and creates contextual representations.
    Decoder generates output by predicting the next token using
    encoder's context.

    - Encoder block: processing input and create a representation with
      context of tokens, creates semantic representation of the training
      vocabulary
    - Decoder block: generates new language sequences, generative output
      by looking at the encoder's representation and predicting the next
      token in the sequence

## Generative AI <span class="tag" tag-name="generative"><span class="smallcaps">generative</span></span> <span class="tag" tag-name="ai"><span class="smallcaps">ai</span></span>

### What is Generative AI?

1.  Front

    What is Generative AI and what kind of outputs can it produce?

2.  Back

    Generative AI refers to artificial intelligence models trained to
    generate new, original content from natural language input. It can
    produce outputs such as text, images, code, and media.

### What are Large Language Models (LLMs)?

1.  Front

    What are Large Language Models (LLMs) and what tasks are they used
    for?

2.  Back

    LLMs are specialized machine learning models designed for natural
    language processing (NLP) tasks. They support generative AI by
    processing and generating human-like language.

### What is tokenization in NLP?

1.  Front

    What is tokenization and why is it important in training language
    models?

2.  Back

    Tokenization is to put training text in tokens to identify unique
    text values, could be words, partial words, and works and
    punctuation. With tokens, statistics can be used with computers to
    find patterns and apply rules.

### What are word embeddings?

1.  Front

    What are word embeddings and how do they represent semantic
    relationships?

2.  Back

    Word embeddings are vectors representing words in a multidimensional
    space, created during training. They capture semantic relationships
    based on word usage patterns.

    A vocabulary is developed that holds semantic relationships between
    the tokens. The vocabulary has contextual vectors for the
    relationships known as embeddings.

    The semantic relationship is the distance between vectors

    For example, `bike` and `car` are used in same patterns of words and
    are used like driving, buying, or repairing them. As a result, the
    model will put the bike and car words close in vector space.

### How do transformers improve upon RNNs?

1.  Front

    How do transformers improve upon RNNs in language modeling?

2.  Back

    Transformers use attention mechanisms instead of sequential
    processing, allowing parallel processing of tokens and better
    context handling, improving efficiency and scalability.

### What is the role of attention in transformers?

1.  Front

    What is attention in transformers and how does it work?

2.  Back

    Attention maps new information to learned data using queries, keys,
    and values. It computes similarity scores to determine relevance and
    enables parallel processing of tokens.

### What is prompt engineering?

1.  Front

    What is prompt engineering and why is it important in generative AI?

2.  Back

    Prompt engineering involves refining prompts to improve AI
    responses. It includes setting goals, context, expectations, and
    iterating to enhance relevance and quality.

### What are Microsoft's principles for responsible AI?

1.  Front

    What are the key principles for responsible AI according to
    Microsoft?

2.  Back

    - Fairness - treat all people fairly. Example: models make
      predictions without incorporating bias
    - Reliability and safety - Example: an autonomous vehicle or patient
      diagnoses must be safe to use related to human life
    - Privacy and security - training data may have personal details and
      must be kept private, even after model deployment, sensitive data
      must be protected
    - Inclusiveness - AI must empower everyone and benefit all parts of
      society, regardless of physical ability, gender, sexual
      orientation, ethnicity, or other factors. Example: have a diverse
      group of people test applications
    - Transparency - systems are understandable and users know the
      purpose of the system, how it works, and what limitations may be
      expected. Example: a system communicates to users about its
      accuracy, training data, and features that affect predictions.
      When personal data like faces are use in a system, the system
      makes clear how the personal data is handled, retained, and
      accessed.
    - Accountability - although many AI systems seem to operate
      autonomously, it is the responsibility of the developers who
      trained and validated the models they use, and defined the logic
      that bases decisions on model predictions to ensure that the
      system meets requirements. Example: solutions use a framework of
      governance and principles to meet responsible and legal standards
      that are defined.

### How do transformers improve upon RNNs?

1.  Front

    How do transformers improve upon RNNs?

2.  Back

    Transformers use attention mechanisms to process words in parallel,
    capturing context more efficiently than RNNs which process
    sequentially.

### What is Retrieval-Augmented Generation (RAG)?

1.  Front

    What is Retrieval-Augmented Generation (RAG)?

2.  Back

    RAG enhances model responses by retrieving relevant data from
    external sources, grounding outputs in factual and contextual
    information.

### What is Azure AI Foundry?

1.  Front

    What is Azure AI Foundry?

2.  Back

    Azure AI Foundry is a platform for building, customizing, and
    deploying generative AI models and applications, including tools
    like model catalogues and playgrounds.

### Azure AI Foundry Components

1.  Front

    List parts of the AI Foundry and their uses

2.  Back

    - Azure AI Foundry model catalog: for generative AI model selection
      and use
    - Playgrounds: Ready-to-use environments for testing ideas, trying
      out models, and exploring services
    - Azure AI services: build, test, see demos, and deploy Azure AI
      services
    - Solutions: build agents and customize models
    - Observability: monitor usage and performance of models

    Bonus: Microsoft Copilot Studio is used for low code development
    approach.

## Natural Language Processing (NLP) <span class="tag" tag-name="nlp"><span class="smallcaps">nlp</span></span>

### What is Natural Language Processing (NLP)?

1.  Front

    What is Natural Language Processing (NLP)?

2.  Back

    NLP is the ability of computers to understand, interpret, and
    respond to human language, both written and spoken.

### What are common NLP use cases?

1.  Front

    What are common NLP use cases?

2.  Back

    - Speech-to-text and text-to-speech conversion. For example,
      generate subtitles for videos.
    - Machine translation. For example, translate text from English to
      Japanese.
    - Text classification. For example, label an email as spam or not
      spam.
    - Entity extraction. For example, extract keywords or names from a
      document.
    - Question answering. For example, provide answers to questions like
      "What is the capital of France?"
    - Text summary. For example, generate a short one-paragraph summary
      from a multi-page document.

### What is tokenization in NLP?

1.  Front

    What is tokenization in NLP?

2.  Back

    Tokenization is the process of breaking text into smaller units
    called tokens, which can be words, phrases, or symbols.

    For example, "we choose to go to the moon", the phrase is broken
    down into the following tokens, with numeric identifiers:

    1.  we
    2.  choose
    3.  to
    4.  go
    5.  the
    6.  moon

    The word "to" is token number 3. The phrase "we choose to go to the
    moon" can be represented by the tokens {1,2,3,4,3,5,6}.

### What is TF-IDF and what is it used for?

1.  Front

    What is TF-IDF and what is it used for?

2.  Back

    Term Frequency-Inverse Document Frequency (TF-IDF) is a statistical
    technique used to evaluate the importance of a word in a document
    relative to a corpus. It's used for information retrieval and text
    classification.

    TF-IDF calculates scores based on how often a word or term appears
    in one documents compared to its frequency across the collection of
    documents. The technique assumes a high relevance for words that
    appear frequently in a documents but relatively infrequently in the
    other documents.

### What is sentiment analysis?

1.  Front

    What is sentiment analysis?

2.  Back

    Sentiment analysis is the process of determining whether a piece of
    text expresses a positive, negative, or neutral sentiment.

### What is the difference between extractive and abstractive summarization?

1.  Front

    What is the difference between extractive and abstractive
    summarization?

2.  Back

    - Extractive summarization selects key sentences directly from the
      text.
    - Abstractive summarization rewrites key ideas using new phrasing.

### What does Azure AI Language service provide?

1.  Front

    What does Azure AI Language service provide?

2.  Back

    Azure AI Language service: understanding and analyzing text like
    support sentiment analysis, key phrase identification, text
    summarization, and conversational language understanding.

### Azure AI Translator service

1.  Front

    What does Azure AI Translator service provide?

2.  Back

    Azure AI Translator service: uses Neural Machine Translation (NMT)
    for translation, which analyzes the semantic context of the text and
    renders a more accurate and complete translation as a result.

    It does text, document, and custom translation.

### Azure NLP Services

1.  Front

    Where in Azure are NLP services like Azure AI Language and
    Translator services?

2.  Back

    Azure AI Language and Translator can be used in solutions and
    created in:

    - Azure AI Foundry portal
    - Software development kit (SDK) or REST API

### Azure Conversational Language Understanding (CLU) and Question Answering

1.  Front

    What is Conversational Language Understanding (CLU) and Question
    Answering Services in Azure?

2.  Back

    Question Answering allows Azure Language Services to create a
    knowledge base of question and answer pairs that can be queried
    using natural language input.

    CLU builds language models that interpret meaning of phrases in a
    conversation.

    Example: commands like "turn on lights"

    - Intent: Turn on
    - Entity: Lights
    - Entity recognition: action

### What is the difference between NLP and Generative AI?

1.  Front

    What is the difference between NLP and Generative AI?

2.  Back

    NLP focuses on understanding and analyzing language, while
    Generative AI builds on NLP to create new content such as text,
    images, or code.

## Computer Vision <span class="tag" tag-name="computer"><span class="smallcaps">computer</span></span> <span class="tag" tag-name="vision"><span class="smallcaps">vision</span></span>

### What is computer vision (CV)?

1.  Front

    What is computer vision (CV)?

2.  Back

    Computer vision is a field of AI that enables machines to interpret
    and understand visual information from the world, such as images and
    videos.

### What are the main capabilities of computer vision?

1.  Front

    What are the main capabilities of computer vision?

2.  Back

    - Image analysis
    - Spatial analysis
    - Facial recognition
    - Optical character recognition (OCR)

### What is a convolutional neural network (CNN)?

1.  Front

    What is a convolutional neural network (CNN)?

2.  Back

    A CNN is a deep learning architecture that uses filters to extract
    features from images and predict labels, commonly used in image
    classification.

### What is convolutional filtering in image processing?

1.  Front

    What is convolutional filtering in image processing?

2.  Back

    Convolutional filtering applies filter kernels to an image to
    transform pixel values, often used for edge detection, blurring, or
    sharpening.

### What is OCR and how is it used in computer vision?

1.  Front

    What is OCR and how is it used in computer vision?

2.  Back

    Optical Character Recognition (OCR) extracts printed or handwritten
    text from images, enabling text analysis and digitization.

### What are multi-modal models in computer vision?

1.  Front

    What are multi-modal models in computer vision?

2.  Back

    Multi-modal models combine image and language data, training on
    captioned images to perform tasks like classification, detection,
    and captioning.

### What does Azure AI Vision Image Analysis service do?

1.  Front

    What does Azure AI Vision Image Analysis service do?

2.  Back

    It detects objects, tags features, creates captions, and performs
    OCR on images without requiring custom training.

### What is the purpose of Azure AI Face service?

1.  Front

    What is the purpose of Azure AI Face service?

2.  Back

    It detects, recognizes, and analyzes human faces, including
    attributes like head pose, glasses, mask, and facial landmarks.

### What are common use cases for computer vision in industry?

1.  Front

    What are common use cases for computer vision in industry?

2.  Back

    - Defect detection in manufacturing
    - Medical imaging analysis
    - Retail shelf monitoring
    - Autonomous vehicle navigation

### What is the role of feature maps in CNNs?

1.  Front

    What is the role of feature maps in CNNs?

2.  Back

    Feature maps are arrays of numeric values extracted from images
    using filters, representing visual features used for classification.

## AI Speech <span class="tag" tag-name="ai"><span class="smallcaps">ai</span></span> <span class="tag" tag-name="speech"><span class="smallcaps">speech</span></span>

### What are the two main capabilities of AI speech?

1.  Front

    What are the two main capabilities of AI speech?

2.  Back

    - Speech recognition: interpreting spoken input
    - Speech synthesis: generating spoken output

### What is speech recognition?

1.  Front

    What is speech recognition?

2.  Back

    Speech recognition converts spoken words into data, typically
    transcribing audio into text using acoustic and language models.

### What is speech synthesis?

1.  Front

    What is speech synthesis?

2.  Back

    Speech synthesis converts text into spoken audio using phonetic
    transcription and prosodic units, with customizable voice settings.

### What does an acoustic model do in speech recognition?

1.  Front

    What does an acoustic model do in speech recognition?

2.  Back

    It converts audio signals into phonemes, which are representations
    of specific sounds.

### What does a language model do in speech recognition?

1.  Front

    What does a language model do in speech recognition?

2.  Back

    It maps phonemes to words using statistical algorithms to predict
    the most probable word sequence.

### What is Azure AI Speech used for?

1.  Front

    What is Azure AI Speech used for?

2.  Back

    Azure AI Speech provides capabilities for speech recognition, speech
    synthesis, and translation, accessible via Studio, CLI, REST APIs,
    and SDKs.

### What is speech-to-text (STT)?

1.  Front

    What is speech-to-text (STT)?

2.  Back

    STT converts spoken audio into text, supporting real-time and batch
    transcription, with options for custom acoustic and language models.

### What is text-to-speech (TTS)?

1.  Front

    What is text-to-speech (TTS)?

2.  Back

    TTS converts text into audible speech using selected voices,
    including neural voices for natural intonation and regional
    pronunciation.

### What are neural voices in Azure AI Speech?

1.  Front

    What are neural voices in Azure AI Speech?

2.  Back

    Neural voices use deep learning to produce more natural-sounding
    speech with realistic intonation and expression.

### What resources are needed to use Azure AI Speech?

1.  Front

    What resources are needed to use Azure AI Speech?

2.  Back

    You need either a dedicated Azure AI Speech resource or a general
    Azure AI services resource to access speech capabilities.

## Information Extraction <span class="tag" tag-name="info"><span class="smallcaps">info</span></span> <span class="tag" tag-name="extraction"><span class="smallcaps">extraction</span></span>

### What is AI-powered information extraction?

1.  Front

    What is AI-powered information extraction?

2.  Back

    It is the process of identifying and extracting meaningful data from
    various content types like documents, images, audio, and video using
    AI techniques.

### What are the four steps in the information extraction process?

1.  Front

    What are the four steps in the information extraction process?

2.  Back

    1.  Source Identification
    2.  Extraction
    3.  Transformation & Structuring
    4.  Storage & Integration

### What is OCR and how is it used in information extraction?

1.  Front

    What is OCR and how is it used in information extraction?

2.  Back

    Optical Character Recognition (OCR) detects and extracts printed or
    handwritten text from images using machine learning models.

### What is Document Intelligence in Azure?

1.  Front

    What is Document Intelligence in Azure?

2.  Back

    Document Intelligence extracts structured data from forms and
    documents using OCR and machine learning, identifying fields and
    values with confidence scores.

### What is multi-modal data extraction?

1.  Front

    What is multi-modal data extraction?

2.  Back

    It involves using multiple AI services (e.g., vision, NLP, speech)
    to extract information from diverse content types like documents,
    images, and audio.

### What is knowledge mining in AI?

1.  Front

    What is knowledge mining in AI?

2.  Back

    Knowledge mining automates extraction from large volumes of
    unstructured data, enriching it with AI and storing it for search
    and analysis.

### What is a search index schema in Azure AI Search?

1.  Front

    What is a search index schema in Azure AI Search?

2.  Back

    It defines the structure of searchable data, including fields, data
    types, and attributes used for filtering and sorting.

### What does Azure AI Vision Image Analysis provide?

1.  Front

    What does Azure AI Vision Image Analysis provide?

2.  Back

    It offers automated captioning, object detection, tagging, and OCR
    for images and scanned documents.

### What is the role of Azure AI Content Understanding?

1.  Front

    What is the role of Azure AI Content Understanding?

2.  Back

    It performs multimodal analysis using generative AI to extract
    insights from text, images, audio, and video based on custom
    schemas.

### What is the function of an indexer in Azure AI Search?

1.  Front

    What is the function of an indexer in Azure AI Search?

2.  Back

    An indexer ingests data, extracts content using AI skills, and
    stores it in a searchable index for querying and analysis.
