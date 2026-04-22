---
filetags: ":responsible-ai:machine-learning:anki-emacs:anki-deck:artificial-intelligence:ai:epubnote:"
id: 18b5d0b7-d31c-47b0-8b5d-81541a537828
title: Anki Deck for Learning Artificial Intelligence
---

Anki deck cards to help with learning listed at [Artificial Intelligence
(AI)](/garden/notes/006-3-tech-ai-artificial-intelligence) - [Artificial
Intelligence (AI)](id:bfe7af6c-9a91-4f3e-a98c-60ed67b8285a) Some cards
were generated with the help of Microsoft Copilot Artificial
Intelligence (AI) and reviewed manually after.

## Artificial Intelligence

### Areas of artificial intelligence

#### Front

What are the 6 areas of AI use cases and functions

Hint: they are like human capabilities and senses

#### Back

1.  Machine learning - like human learning
2.  Generative AI - like human creativity and pattern matching
3.  Computer Vision - like human sight
4.  Speech - like human voice and hearing
5.  Natural Language Processing (NLP) - like human content analysis
6.  Extract data and insights - like human ability to follow a process
    and analysis

Bonus: Responsible AI - human ability for audit, monitoring, checking,
and inclusion is required in application of AI.

### Power of Machine Learning

#### Front

What human capability is machine learning like and how might it be used
and compared to traditional computer programming?

#### Back

Machine learning is like human learning where a computer can be
trained/learn using an algorithm to predict the correct human
capability.

In comparison to programming a computer to do human functions precisely
like coding all shapes of an orange for a computer to recognize. With
machine learning, the machine can be trained to do any tasks using
predictions as long as there is data of the input and what the task
completed looks like.

The data are features like what an orange looks like and labels like
whether it is an orange or type of oranges.

## Introduction to Artificial Intelligence Microsoft Azure AI-900

### Machine Learning <span class="tag" tag-name="machine"><span class="smallcaps">machine</span></span> <span class="tag" tag-name="learning"><span class="smallcaps">learning</span></span>

#### Goal of Machine Learning

1.  Front

    What is the goal of Machine Learning (ML)?

2.  Back

    To create a predictive model by combining data science and software
    engineering, enabling software to make predictions using past data.

#### ML Model as a Function

1.  Front

    How is a Machine Learning model structured as a function?

2.  Back

    An ML model is a function y = f(x), where x is a vector of input
    features and y is the predicted output. After training, the model
    generalizes this function to make predictions.

#### Supervised vs Unsupervised Learning

1.  Front

    What is the difference between supervised and unsupervised learning?

2.  Back

    Supervised learning uses labeled data to train models to predict
    known outcomes. Unsupervised learning uses unlabeled data to find
    patterns or groupings without predefined labels.

#### Types of Machine Learning

1.  Front

    What are the main types of Machine Learning?

2.  Back

    - Supervised Learning: uses labeled data (\[x1, x2, x3\], y)
      - Regression: numeric labels
      - Classification: categorical labels (binary or multiclass)
    - Unsupervised Learning: uses unlabeled data (\[x1, x2, x3\])
      - Clustering: groups data based on feature similarity

    Deep Learning (subset of ML using neural networks)

#### What is inferencing in machine learning?

1.  Front

    What is inferencing in machine learning?

2.  Back

    Inferencing is the process of using a trained machine learning model
    to make predictions on new data by applying the model's function to
    input features.

#### What is the difference between regression and classification?

1.  Front

    What is the difference between regression and classification?

2.  Back

    Regression predicts numeric values (e.g., ice cream sales), while
    classification predicts categorical labels (e.g., disease risk).

#### What is a confusion matrix used for?

1.  Front

    What is a confusion matrix used for?

2.  Back

    A confusion matrix visualizes the accuracy of a classification model
    with a matrix of the number of correct and incorrect predictions for
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

#### What does the R² (coefficient of determination) metric indicate?

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

#### What is the purpose of the softmax function in multiclass classification?

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

#### What is the role of centroids in K-Means clustering?

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

#### What are ways to evaluate a binary classification model in ML

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

#### What are the steps in designing a machine learning solution in Azure?

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

#### Azure ML solutions

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

#### What is the function of the encoder and decoder in transformer models?

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

#### Predicting use cases

1.  Front

    What type of machine learning should be used for these use cases?

    1.  If you need to predict the sea level in meter for the next 10
        years
    2.  If you need to predict the hours of overtime for an office
        worker given the number of incidents they receive?

    Examples: classification, regression, clustering

2.  Back

    Regression because the values predicted will be numeric values in
    meters for \#1 and hours in \#2.

    The trained model uses a labeled dataset and regression gets a
    relationship between feature variables like the sea level in meters
    in the training data, allowing it to make predictions.

#### Automated ML

1.  Front

    Which of the following statements are true about automated machine
    learning?

    1.  It can automate iterative tasks of model development
    2.  It can automatically infer training data from the use case
    3.  It runs multiple training iterations that are scored and ranked
        with user provided metrics
    4.  It allows setting a dataset and understanding which labels to
        predict

2.  Back

    1.  True - AutoML can do iterations for model development
    2.  F
    3.  True - Azure ML creates pipelines for running in parallel and
        tries different algorithms and parameters
    4.  F - Automated ML uses target metrics you specify

#### Banking system predictions

1.  Front

    A banking system can use the <u>\_</u> type of machine learning to
    predict whether a loan will be repaid.

2.  Back

    Classification - The bank can use features like information about
    the customer to predict yes or no classes for loan repayment.

#### Model training and setup

1.  Front

    Which of the following statements about models and training is true?

    1.  Labelling is tagging training data with known values
    2.  Data used for validation should be the same data used to train
        the model
    3.  Accuracy is always the primary metric to measure models

2.  Back

    1.  T - Labelled data does mean data is marked and annotated with
        the targets for predictions
    2.  F - a separate set of data should be set aside before training
        to be used for validation later
    3.  F - Accuracy is a metric for classification but may not be
        appropriate for unbalanced data where many data points are in
        one class or being correct in one class is more important than
        others.

#### Accessing Azure Machine Learning

1.  Front

    After creating a web service with Azure Machine Learning for
    inference, what two items of the following are required for
    accessing it?

    1.  Model name
    2.  Training endpoint
    3.  Authentication key
    4.  REST endpoint

2.  Back

    C and D: The (D) REST endpoint can be accessed by an application
    using an (C) authentication key.

    SDKs are available for some services to make application development
    easier.

#### Azure ML Designer first step

1.  Front

    You need to use the Azure Machine Learning designer to train a
    machine learning model.

    What should you do first in the Machine Learning designer?

2.  Back

    Before you can start training a machine learning model, you must
    first **create a pipeline** in the Machine Learning designer. This
    is followed by adding a dataset, adding training modules, and
    eventually deploying a service.

### Generative AI <span class="tag" tag-name="generative"><span class="smallcaps">generative</span></span> <span class="tag" tag-name="ai"><span class="smallcaps">ai</span></span>

#### What is Generative AI?

1.  Front

    What is Generative AI and what kind of outputs can it produce?

2.  Back

    Generative AI refers to artificial intelligence models trained to
    generate new, original content from natural language input. It can
    produce outputs such as text, images, code, and media.

#### What are Large Language Models (LLMs)?

1.  Front

    What are Large Language Models (LLMs) and what tasks are they used
    for?

2.  Back

    LLMs are specialized machine learning models designed for natural
    language processing (NLP) tasks. They support generative AI by
    processing and generating human-like language.

#### What is tokenization in NLP?

1.  Front

    What is tokenization and why is it important in training language
    models?

2.  Back

    Tokenization is to put training text in tokens to identify unique
    text values, could be words, partial words, and works and
    punctuation. With tokens, statistics can be used with computers to
    find patterns and apply rules.

#### What are word embeddings?

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

#### How do transformers improve upon RNNs?

1.  Front

    How do transformers improve upon RNNs in language modeling?

2.  Back

    Transformers use attention mechanisms instead of sequential
    processing, allowing parallel processing of tokens and better
    context handling, improving efficiency and scalability.

#### What is the role of attention in transformers?

1.  Front

    What is attention in transformers and how does it work?

2.  Back

    Attention maps new information to learned data using queries, keys,
    and values. It computes similarity scores to determine relevance and
    enables parallel processing of tokens.

#### What is prompt engineering?

1.  Front

    What is prompt engineering and why is it important in generative AI?

2.  Back

    Prompt engineering involves refining prompts to improve AI
    responses. It includes setting goals, context, expectations, and
    iterating to enhance relevance and quality.

#### How do transformers improve upon RNNs?

1.  Front

    How do transformers improve upon RNNs?

2.  Back

    Transformers use attention mechanisms to process words in parallel,
    capturing context more efficiently than RNNs which process
    sequentially.

#### What is Retrieval-Augmented Generation (RAG)?

1.  Front

    What is Retrieval-Augmented Generation (RAG)?

2.  Back

    RAG enhances model responses by retrieving relevant data from
    external sources, grounding outputs in factual and contextual
    information.

#### What is Azure AI Foundry?

1.  Front

    What is Azure AI Foundry?

2.  Back

    Azure AI Foundry is a platform for building, customizing, and
    deploying generative AI models and applications, including tools
    like model catalogues and playgrounds.

#### Azure AI Foundry Components

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

### Natural Language Processing (NLP) <span class="tag" tag-name="nlp"><span class="smallcaps">nlp</span></span>

#### What is Natural Language Processing (NLP)?

1.  Front

    What is Natural Language Processing (NLP)?

2.  Back

    NLP is the ability of computers to understand, interpret, and
    respond to human language, both written and spoken.

#### What are common NLP use cases?

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

#### What is tokenization in NLP?

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

#### What is TF-IDF and what is it used for?

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

#### What is sentiment analysis?

1.  Front

    What is sentiment analysis?

2.  Back

    Sentiment analysis is the process of determining whether a piece of
    text expresses a positive, negative, or neutral sentiment.

#### What is the difference between extractive and abstractive summarization?

1.  Front

    What is the difference between extractive and abstractive
    summarization?

2.  Back

    - Extractive summarization selects key sentences directly from the
      text.
    - Abstractive summarization rewrites key ideas using new phrasing.

#### What does Azure AI Language service provide?

1.  Front

    What does Azure AI Language service provide?

2.  Back

    Azure AI Language service: understanding and analyzing text like
    support sentiment analysis, key phrase identification, text
    summarization, and conversational language understanding.

#### Azure AI Translator service

1.  Front

    What does Azure AI Translator service provide?

2.  Back

    Azure AI Translator service: uses Neural Machine Translation (NMT)
    for translation, which analyzes the semantic context of the text and
    renders a more accurate and complete translation as a result.

    It does text, document, and custom translation.

#### Azure NLP Services

1.  Front

    Where in Azure are NLP services like Azure AI Language and
    Translator services?

2.  Back

    Azure AI Language and Translator can be used in solutions and
    created in:

    - Azure AI Foundry portal
    - Software development kit (SDK) or REST API

#### Azure Conversational Language Understanding (CLU) and Question Answering

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

#### What is the difference between NLP and Generative AI?

1.  Front

    What is the difference between NLP and Generative AI?

2.  Back

    NLP focuses on understanding and analyzing language, while
    Generative AI builds on NLP to create new content such as text,
    images, or code.

#### Tokenization for NLP

1.  Front

    What are 4 concepts in NLP tokenization?

2.  Back

    - Text normalization: Before generating tokens, text is normalized
      by removing punctuation and making all words lower case.
      - Good for analysis purely on word frequency with high
        performance.
      - Some semantic meaning may be lost like example, "Mr Banks has
        worked in many banks." where the sentence and punctuation has
        meaning for Mr. Banks and bank.
    - Stop word removal: Stop words are words that should be excluded
      from the analysis. For example, "the", "a", or "it" make text
      easier for people to read but add little semantic meaning.
      Excluding these words, allows better identification of important
      words.
    - n-grams: Multi-term phrases such as "I have" or "he walked". A
      single word phrase is a unigram, a two-word phrase is a bi-gram, a
      three-word phrase is a tri-gram, and so on. Considering words as
      groups allows a model to make better sense of the text.
    - Stemming: algorithms are applied to consolidate words before
      counting them, so that words with the same root, like "power",
      "powered", and "powerful", are interpreted as the same token.

### Computer Vision <span class="tag" tag-name="computer"><span class="smallcaps">computer</span></span> <span class="tag" tag-name="vision"><span class="smallcaps">vision</span></span>

#### What is computer vision (CV)?

1.  Front

    What is computer vision (CV)?

2.  Back

    Computer vision is a field of AI that enables machines to interpret
    and understand visual information from the world, such as images and
    videos.

#### What are the main capabilities of computer vision?

1.  Front

    What are the main capabilities of computer vision?

2.  Back

    - Image analysis
    - Spatial analysis
    - Facial recognition
    - Optical character recognition (OCR)

#### What is a convolutional neural network (CNN)?

1.  Front

    What is a convolutional neural network (CNN)?

    Image as a data in a computer program. An image is an array of
    numeric pixel values.

    ``` text

     0   0   0   0   0   0   0
     0   0   0   0   0   0   0
     0   0  255 255 255  0   0
     0   0  255 255 255  0   0
     0   0  255 255 255  0   0
     0   0   0   0   0   0   0
     0   0   0   0   0   0   0

    The array consists of seven rows and seven columns, representing the pixel values for a 7x7 pixel image (which is known as the image's resolution). Each pixel has a value between 0 (black) and 255 (white); with values between these bounds representing shades of gray.
    ```

2.  Back

    A CNN is a deep learning architecture that uses filters to extract
    features from images and predict labels, commonly used in image
    classification.

#### What is convolutional filtering in image processing?

1.  Front

    What is convolutional filtering in image processing?

2.  Back

    Convolutional filtering applies filter kernels to an image to
    transform pixel values, often used for edge detection, blurring, or
    sharpening.

#### What is OCR and how is it used in computer vision?

1.  Front

    What is OCR and how is it used in computer vision?

2.  Back

    Optical Character Recognition (OCR) extracts printed or handwritten
    text from images, enabling text analysis and digitization.

#### What are multi-modal models in computer vision?

1.  Front

    What are multi-modal models in computer vision?

2.  Back

    Multi-modal models combine image and language data, training on
    captioned images to perform tasks like classification, detection,
    and captioning.

#### What does Azure AI Vision Image Analysis service do?

1.  Front

    What does Azure AI Vision Image Analysis service do?

2.  Back

    It detects objects, tags features, creates captions, and performs
    OCR on images without requiring custom training.

#### What is the purpose of Azure AI Face service?

1.  Front

    What is the purpose of Azure AI Face service?

2.  Back

    It detects, recognizes, and analyzes human faces, including
    attributes like head pose, glasses, mask, and facial landmarks.

#### What are common use cases for computer vision in industry?

1.  Front

    What are common use cases for computer vision in industry? Name at
    least 3

2.  Back

    - Defect detection in manufacturing, anomaly detection in any
      industry
    - Medical imaging analysis
    - Retail shelf monitoring
    - Autonomous vehicle navigation
    - Object detection and analysis in transportation, security

#### What is the role of feature maps in CNNs?

1.  Front

    What is the role of feature maps in CNNs?

2.  Back

    Images –\> Feature maps –\> Visual features in classification

    Feature maps are arrays of numeric values extracted from images
    using filters, representing visual features used for classification.

#### Pixel Analysis

1.  Front

    Which type of artificial intelligence (AI) workload provides the
    ability to classify individual pixels in an image depending on the
    object that they represent?

2.  Back

    Semantic segmentation is advanced object detection where in addition
    to drawing a box around the object's location, it can identify
    pixels that belong to the object.

### AI Speech <span class="tag" tag-name="ai"><span class="smallcaps">ai</span></span> <span class="tag" tag-name="speech"><span class="smallcaps">speech</span></span>

#### What are the two main capabilities of AI speech?

1.  Front

    What are the two main capabilities of AI speech?

2.  Back

    - Speech recognition: interpreting spoken input
    - Speech synthesis: generating spoken output

#### What is speech recognition?

1.  Front

    What is speech recognition?

2.  Back

    Speech recognition converts spoken words into data, typically
    transcribing audio into text using acoustic and language models.

#### What is speech synthesis?

1.  Front

    What is speech synthesis?

2.  Back

    Speech synthesis converts text into spoken audio using phonetic
    transcription and prosodic units, with customizable voice settings.

#### What does a language and acoustic model do in speech recognition and synthesis?

1.  Front

    What does a language and acoustic model do in speech recognition?

2.  Back

    - Acoustic model that converts the audio signal into representations
      of specific sounds, called phonemes
    - Language model maps sounds (phonemes) to words, usually using
      statistics to predicts the most probable sequence of words based
      on phonemes.

#### What is Azure AI Speech used for?

1.  Front

    What is Azure AI Speech used for?

2.  Back

    Azure AI Speech provides capabilities for speech recognition, speech
    synthesis, and translation, accessible via Studio, CLI, REST APIs,
    and SDKs.

#### What is speech-to-text (STT)?

1.  Front

    What is speech-to-text (STT)?

2.  Back

    STT converts spoken audio into text, supporting real-time and batch
    transcription, with options for custom acoustic and language models.

#### What is text-to-speech (TTS)?

1.  Front

    What is text-to-speech (TTS)?

2.  Back

    TTS converts text into audible speech using selected voices,
    including neural voices for natural intonation and regional
    pronunciation.

#### What are neural voices in Azure AI Speech?

1.  Front

    What are neural voices in Azure AI Speech?

2.  Back

    Neural voices use deep learning to produce more natural-sounding
    speech with realistic intonation and expression.

#### What resources are needed to use Azure AI Speech?

1.  Front

    What resources are needed to use Azure AI Speech?

2.  Back

    You need either a dedicated Azure AI Speech resource or a general
    Azure AI services resource to access speech capabilities.

### Information Extraction <span class="tag" tag-name="info"><span class="smallcaps">info</span></span> <span class="tag" tag-name="extraction"><span class="smallcaps">extraction</span></span>

#### What is AI-powered information extraction?

1.  Front

    What is AI-powered information extraction?

2.  Back

    It is the process of identifying and extracting meaningful data from
    various content types like documents, images, audio, and video using
    AI techniques.

#### What are the four steps in the information extraction process?

1.  Front

    What are the four steps in the information extraction process?

2.  Back

    1.  Source Identification
    2.  Extraction
    3.  Transformation & Structuring
    4.  Storage & Integration

#### What is OCR and how is it used in information extraction?

1.  Front

    What is OCR and how is it used in information extraction?

2.  Back

    Optical Character Recognition (OCR) detects and extracts printed or
    handwritten text from images using machine learning models.

#### What is Document Intelligence in Azure?

1.  Front

    What is Document Intelligence in Azure?

2.  Back

    Document Intelligence extracts structured data from forms and
    documents using OCR and machine learning, identifying fields and
    values with confidence scores.

#### What is multi-modal data extraction?

1.  Front

    What is multi-modal data extraction?

2.  Back

    It involves using multiple AI services (e.g., vision, NLP, speech)
    to extract information from diverse content types like documents,
    images, and audio.

#### What is knowledge mining in AI?

1.  Front

    What is knowledge mining in AI?

2.  Back

    Knowledge mining automates extraction from large volumes of
    unstructured data, enriching it with AI and storing it for search
    and analysis.

#### What is a search index schema in Azure AI Search?

1.  Front

    What is a search index schema in Azure AI Search?

2.  Back

    It defines the structure of searchable data, including fields, data
    types, and attributes used for filtering and sorting.

#### What does Azure AI Vision Image Analysis provide?

1.  Front

    What does Azure AI Vision Image Analysis provide?

2.  Back

    It offers automated captioning, object detection, tagging, and OCR
    for images and scanned documents.

#### What is the role of Azure AI Content Understanding?

1.  Front

    What is the role of Azure AI Content Understanding?

2.  Back

    It performs multimodal analysis using generative AI to extract
    insights from text, images, audio, and video based on custom
    schemas.

#### What is the function of an indexer in Azure AI Search?

1.  Front

    What is the function of an indexer in Azure AI Search?

2.  Back

    An indexer ingests data, extracts content using AI skills, and
    stores it in a searchable index for querying and analysis.

#### Scanned documents and information extraction

1.  Front

    Which service can be used to extract data like text, field/data
    pairs, and tables from scanned documents?

    Which service can be used to extract totals and subtotals from an
    invoice?

2.  Back

    Azure AI Content Understanding can extract data from documents with
    structures and use schemas, for example scanning invoices and
    analyze their data.

### Responsible AI <span class="tag" tag-name="responsible"><span class="smallcaps">responsible</span></span> <span class="tag" tag-name="ai"><span class="smallcaps">ai</span></span>

#### What are Microsoft's principles for responsible AI?

1.  Front

    What are the key principles for responsible AI according to
    Microsoft?

2.  Back

    | Risk               | Responsible AI Principle |
    |--------------------|--------------------------|
    | Bias               | Fairness                 |
    | Error              | Reliability & Safety     |
    | Data exposure      | Privacy & Security       |
    | Not for everyone   | Inclusion                |
    | Trust?             | Transparency             |
    | Who is responsible | Accountability           |

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

#### Healthcare and responsible AI

1.  Front

    Which two principles of responsible artificial intelligence (AI) are
    most important when designing an AI system to manage healthcare
    data? Each correct answer presents part of the solution.

    Example: reliability and safety, accountability, transparency,
    inclusiveness, privacy & security

2.  Back

    1.  Privacy & security
    2.  Accountability

    The accountability principle states that AI systems are designed to
    meet any ethical and legal standards that are applicable. The system
    must be designed to ensure that privacy of the healthcare data is of
    the highest importance, including anonymizing data where applicable.

#### Responsible AI Limits

1.  Front

    Which principle of responsible artificial intelligence (AI) raises
    awareness about the limitations of AI-based solutions?

    Example: reliability and safety, accountability, transparency

2.  Back

    Transparency so users understand how an AI came up with its
    predictions and limits of the model.

## Developing AI solutions in Microsoft Azure AI-102

### Generative AI

#### Responsible AI in Solutions

1.  Front

    What steps are used to reduce risk in AI solutions?

2.  Back

    - Determine potential harms and measure them in the solution's
      outputs and operation
    - Mitigate harms using multiple layers like:
      - Model
      - Safety system
        - Content filters, thresholds for violence, hate and unfairness,
          sexual content, self harm (guardrails)
        - Prompt shields to prevent "jailbreak" attacks by malicious
          people that want to work around content safety
      - System message and grounding
      - User experience
    - Manage the operational solution responsibly

#### Foundry Workflow

1.  Front

    What is a workflow to use models in Azure AI Foundry?

2.  Back

    Workflow based on exercises from the AI-102 course:

    - Create an Azure AI Foundry and projects
    - Compare and see model details to select model(s) for deployment
    - Deploy a model and/or agent, optionally test it in the playground
      and get its endpoints
    - Either in the Foundry or through SDK:
      - Configure behaviour with system or user prompts, functions
      - Add tools to model
      - Add data for indexing and for model to use
      - Set guardrails / content filters for safet
      - Fine tune model

#### Model Considerations

1.  Front

    What are considerations when comparing and choosing models?

2.  Back

    - Use case and capabilities:
      agent/reasoning/streaming/assistant/multi modal/other, industry,
      inference tasks like coding/math, fine tuning with your data to
      replace frequent system prompts or grounding data
    - Vendor, license
    - Size and cost
    - Performance metrics: quality, accuracy, fluency, groundness,
      latency, throughput, safety (attack vulnerability)
      - Compare models for the use case or constraints like cost and
        throughput. In Azure AI Foundry, use the model benchmarks and
        compare model functions
    - Deployment options: [Deploy Microsoft Foundry Models in the
      Foundry portal - Microsoft
      Foundry](https://learn.microsoft.com/en-us/azure/foundry/foundry-models/how-to/deploy-foundry-models)
      - Managed compute: Virtual Machines (VM) are required, only cost
        is Azure hosted VMs
      - Serverless API (Default)
    - Region availability
      - Geographic limits and quotas

#### Azure AI Foundry Resources Organization

1.  Front

    How are Azure AI Foundry Resources organized?

2.  Back

    - Azure AI Foundry (classic)
      - Project
      - Hub
        - Project 1
        - Project 2
          - Azure resource
        - Services including AI Services, other Azure service like key
          vault, storage account
        - Users, models, connected resources (data, Azure resources,
          OpenAI), compute used/read access by all projects in hub

    In newer Foundry as of 2026-03, resources are:

    - Azure AI Foundry Resource
      - Project
        - Resources (models, agents)
        - Connections (AI Search, Other AI Services, Storage, Functions)

    Source: [Migrate From Hub-based to Foundry Projects (classic) -
    Microsoft Foundry (classic) portal \| Microsoft
    Learn](https://learn.microsoft.com/en-us/azure/foundry-classic/how-to/migrate-project?tabs=azure-ai-foundry#new-foundry-projects-overview)

#### Evaluating Generative AI Performance

1.  Front

    How can models be evaluated?

2.  Back

    - Automated evaluation: use test data and compare results,
      evaluating can be AI assisted
    - Metrics like answer quality, accessibility, accuracy, tone, cost
    - Risk and safety measures like violence, sexual, self-hard content
      in results

    Evaluators assess quality, safety, and reliability of AI response.

    Built in evaluators and custom ones can be used in AI Foundry. Built
    in ones are in categories of:

    - General purpose:
      - Coherence: logic, flow of responses
      - Fluency: natural language quality and readability
    - Textual similarity
      - F1 Score (trust): precision and recall in token overlaps between
        response and truth
      - Others
    - RAG evaluators: measures retrieval on relevant information,
      accuracy, completeness, groundness in data
    - Risk and safety evaluators: hate, unfairness, sexual, violence,
      self harm, data leakage, and other prohibited actions
    - Agent evaluators: task management, tool selection and use, intent
      resolution
    - Azure OpenAI graders: custom classification, validations and
      pattern matching, semantic closeness

#### Developing an Application with Azure AI Foundry SDK

1.  Front

    How would a developer connect to the Azure AI Foundry SDK? What
    items would the developer need?

2.  Back

    Use the Azure AI Foundry SDK to connect securely to a project which
    has access to multiple Azure AI services instead of connecting to
    each service. For example, connecting to Azure AI services (formerly
    known as Cognitive Services), Azure OpenAI service, Azure AI search
    like vector search.

    The developer requires:

    - [Azure AI Projects Client
      library](https://learn.microsoft.com/en-us/python/api/overview/azure/ai-projects-readme?view=azure-python)
    - Credentials like Entra authentication and/or API key
    - Endpoint

    Requests to Azure AI Foundry projects are sent using the library
    with endpoint and credentials.

#### Fine tune a model and the process

1.  Front

    Describe why to fine tune a model and the process

2.  Back

    Fine tuning may occur because:

    - Prompt engineering and grounding is not sufficient for response
      quality such as a specialist
    - Need to train on examples that are larger than the model's context
      limit
    - Saving tokens with smaller prompts
    - Faster response, especially with small models instead of a
      generalist model

    A risk is the training data is poorly managing and fine tuning does
    not improve results.

    Fine tuning will shift the models weights, like "re-wiring the
    model's brain" and the process is:

    - Prepare training and validation data for fine tuning, prepare data
      in `JSONL` format
    - Set options like:

    | Name | Description |
    |----|----|
    | batch<sub>size</sub> | Number of training examples used to train a single forward and backward pass |
    | learning<sub>ratemultiplier</sub> | Original learning rate used for pre-training multiplied by this value |
    | n<sub>epochs</sub> | The number of epochs to train the model for |
    | seed | Random seed used to control the reproducibility of the job |

    Supervised fine-tuning is providing the model with many examples on
    input and desired results. There are other types of fine tuning like
    Direct Preference Optimization and Reinforcement.

### Agents

#### Parts of an Agent

1.  Front

    What are components that make up an agent?

2.  Back

    - Generative AI language model
    - Goal: Instructions for the agent to follow
    - Tools, Functions like APIs, web search, file operations, data
      access, run code

#### Work flows for Agents

1.  Front

    What are approaches for multi agent workflows?

2.  Back

    Main agent:

    - User input
    - Select connected agent to do work
    - Forward context, instructions
    - Manage results to users

    Connected agents:

    - Single domain of responsibility
    - Complete actions with prompts
    - Uses tools, return results

    Workflow might be combination of these multi-agent (multi-agentic)
    flows:

    ``` text

    Fanned out parallel tasks from main to multiple connected agents, for example collect opinions

        o
        |____
       /|\   \
      o o o   o

    Sequential actions of main agent waiting sequential for processing by connected agents

    o
    |\
    1 \__
      2 /\
        3 4
          |
          5

    Selected action where main agent will select appropriate agent(s) for work

        o
        | (selected)
      o o o

    ```

#### Model Context Protocol (MCP) Benefits

1.  Front

    When would an Model Context Protocol (MCP) server be useful?

2.  Back

    Allow agents to discover tools and call tools on the server and
    connect agents to external data and systems.

    MCP and Agent Flow:

    ``` text

    Agent --> MCP Server : Agent gets list of tools

    MCP Server --> Agent : Tool information is given to agent for use, like Function A database access, B ticket, and C that sends email

    Agent --> Function A : Agent can use tool from Function A

    ```

#### Ways of developing Agents

1.  Front

    What are ways of developing AI agents in Azure?

2.  Back

    AI-102 focus:

    - Azure AI Foundry Agent Service - managed service for creating,
      managing, using agents. Similar to OpenAI Assistants API with more
      functionality
    - Microsoft Agent Framework - service and data connectors, prompt
      templates, functions. Can manage agents in concurrent, sequential,
      handoff, group chat and other orchestration patterns. Framework
      can work with workflows where sequential steps are done and steps
      can include other systems and human interaction along with agents

    Other options:

    - Microsoft 365 Agents SDK - for self hosted agents, for Microsoft
      365 and other channels like Slack
    - OpenAI Assistance API - standard API for OpenAI agent development
    - Microsoft Agent Framework - development kit, framework for
      developing agents and orchestration of multiple agents
    - AutoGen - open source framework for agent development. Good for
      research, ideation, and experiments.
    - Copilot Studio - low-code development for building and deploying
      agents, integrates with Microsoft and other services
    - Agent Builder - custom agent development

### Natural Language Processing (NLP)

#### NLP Use Cases

1.  Front

    What are Use cases for NLP?

2.  Back

    - Language detection: with documents, can determine language(s) in
      text –\> detected language(s), confidence scores, identifiers
    - Key phrase extraction: keywords –\> key phrase array
    - Sentiment analysis: determine positive, neutral, negative –\>
      sentiment breakdown by sentence, confidence scores
    - Named entity recognition: find and identify specific things in
      text like locations, people, addresses, food, actions –\> entity
      category, location in text, confidence scores
      - In Azure, can include custom named entities like organization's
        terms
    - Entity linking: understand a word (entity) in text and its meaning
      –\> link a keyword in text to its Wikipedia article
    - Summarizing text, content: outline –\> Extractive summarization
      selects key sentences directly from the text. Abstractive
      summarization rewrites key ideas using new phrasing.
    - Personal identifiable information (PII) detection: detect and/or
      remove sensitive information like name, phone number, credit card
      –\> label sensitive fields, redacted text array, type of PII,
      confidence scores
    - Speech recognition: who is speaker, pronunciation, intent, speech
      to text and text to speech
    - Translation

    Customizable models are available for each specific case. Generally
    Azure AI services give JSON responses.

#### Speech Synthesis Markup Language (SSML)

1.  Front

    What is Speech Synthesis Markup Language (SSML) used for in text to
    speech?

2.  Back

    Speech Synthesis Markup Language (SSML) helps with defining the
    speech output.

    SSML is an XML-based markup language that you can use to fine-tune
    your text to speech output attributes such as pitch, pronunciation,
    speaking rate, volume, and more. It gives you more control and
    flexibility than plain text input.

    Example SSML

    ``` xml

    <?xml version="1.0"?>
    <speak xmlns="http://www.w3.org/2001/10/synthesis" xmlns:mstts="https://www.w3.org/2001/mstts" version="1.0" xml:lang="en-US">
      <voice name="en-US-Ava:DragonHDLatestNeural">Hello, welcome to Azure AI Foundry!</voice>
    </speak>

    ```

#### Conversational Understanding

1.  Front

    The natural language understanding (NLU) model understands
    utterances from the language input and maps them to intents that
    assign semantic meaning. Map these examples to the corresponding
    term (entity, intent, utterance) for them.

    what is the time in Toronto

    Get Time (function)

    Toronto (location)

2.  Back

    | Examples  | Term                        |
    |-----------|-----------------------------|
    | Utterance | what is the time in Toronto |
    | Intent    | Get Time (function)         |
    | Entities  | Toronto (location)          |

#### Question Answering (QA)

1.  Front

    What kind of data does Question Answering (QA) services use?

    What method is QA similar to when using large language models to
    provide answers?

2.  BACK

    QA is focused on static answers from known content and use existing
    data. It is similar to retrieval augmented generation used with
    LLMs.

#### Text Analysis and SDK

1.  Front

    As a developer, describe the process to use the Azure Foundry SDK to
    do text analysis. Include required resources and sequence of calls.

2.  Back

    - Create a Foundry resource and get its endpoint. Prepare documents
      for analysis.
    - Log into Azure CLI and set up the SDK development environment
    - Create a text analysis client using the `textanalytics` library
      using the endpoint and Azure credential
    - Use the client's functions to:
      - Load documents as text and submit text to AI services
      - Detect the language
      - Recognize entities
      - Recognize personal information in the entities
    - Output results, process response data

### Computer Vision

#### Multiclass vs Multilabel in Computer Vision

1.  Front

    What is the difference between multiclass and multilabel

2.  Back

    Multiclass: Model recognizes multiple classes - each image tagged
    using **one** class label, for example fruit/plant identifier

    Multilabel: Each image can be tagged as multiple classes, for
    example groups of fruit like fruit bowls

#### Computer Vision Use Cases

1.  Front

    What are use cases for using AI computer vision?

2.  Back

    - Image recognition like captions for images, image tagging,
      detecting and locating objects and people, image tagging
    - Finding text in images with optical character recognition (OCR)
      and getting text in a schema like identity documents
    - Find faces, facial features
    - Existing and custom classification. Analyze images and generate
      structured descriptions to classify and index content
    - Create image/video from existing images using computer vision and
      generative models

#### Recognize Printed Text

1.  Front

    When doing the recognize printed text operation on an image with
    text, how is text structured in the response?

2.  Back

    Response is provided in `json` with the following structure:

    - Metadata
    - Regions
      - Bounding boxes
        - Lines
          - Words
            - Text

    Each bounding box provides the coordinates in the image of the
    content (lines, words, text).

### Information Extraction, Extracted Data Projections

#### Projections

1.  Front

    Which kind of projection results in a relational data schema for
    extracted fields?

2.  Back

    It depends on the data type. Projections for relational data are
    stored in Tables. Projections for other formats like images and
    objects are stored as Files and Objects.

#### Using Content Understanding and Document Intelligence

1.  Front

    What are use cases for information extraction solutions?

2.  Back

    Extract data from structured data in documents and text, images,
    audio, and videos

    - Recognize data in forms for processing
    - Extracting data from documents and indexing for search and
      processing. Extract can include custom:
      - Classification
      - Extraction: labelling text and values
    - Azure AI Content Understanding can analyze multiple input mediums
    - Recognition can be in images and video like graphs, charts, and
      other structured data. For example, in a video, speakers,
      transcription, and summary of activity will be detected.

#### Differences between document intelligence and other vision services?

1.  Front

    What are differences between document intelligence and other vision
    services?

2.  Back

    Document intelligence and content understanding uses an existing
    schema like an invoice to extract information. Either existing or
    custom analyzers extract data into schema fields.

    Pre-built models are available like for receipt, invoice, business
    cards, and other common documents. In summary, document intelligence
    uses specific models / AI services for data extraction and
    recognition.

#### Process Of Knowledge Mining

1.  Front

    Describe the process of knowledge mining

2.  Back

    Knowledge mining helps find information and search for relevant
    information in knowledge bases like web, document, and other data.
    Implementations are organizational search and supporting retrieval
    augmented generation (RAG).

    1.  An *Indexer* gets data from data sources
    2.  *Document cracking* retrieves the text content and attributes
    3.  An *enrichment pipeline* builds JSON representations of each
        indexed document
    4.  Fields for each document might be file name, date, size. Result
        is an *index* of the indexed documents. The idea is similar to
        indexes in books with keywords and page numbers.

    Azure AI Search with vector databases and also regular databases
    with vectors can be used for search. It indexes documents and data,
    use AI to enrich index data and store insights in a knowledge store
    for analysis and integration.

    Examples of Enrichment Pipeline features:

    - Language detection
    - Key phrase detection
    - Translation
    - Get text from images
    - Image description
    - PII identification
    - Captions, tags
    - Custom skills: other logic

    New data can be added and indexed over time.

#### Data storage in Knowledge Mining

1.  Front

    How is data stored in indexed information during knowledge mining?

2.  Back

    It depends on the data type. Projections for relational data are
    stored in Tables. Projections for other formats like images and
    objects are stored as Files and Objects.

    | Projection storage | Input type                             |
    |--------------------|----------------------------------------|
    | Objects            | JSON documents                         |
    | Tables             | Relational schema for extracted fields |
    | Files              | Extracted images                       |

    Projections are separate from the index and could be used for
    additional processing.

#### Knowledge Mining process steps using SDK

1.  Front

    Describe steps using the Azure Portal and Azure AI SDK to create a
    knowledge mining solution.

2.  Back

    - Create the infrastructure: Azure AI Foundry, Azure Storage
      account, Azure AI Search
    - Upload documents for indexing and AI enrichment to a Azure storage
      account container
    - Connect the Azure AI Search to the document container and
      configure Retrievable, Filterable, Sortable, and Facetable for
      indexed fields
    - Search through documents using index created by Azure AI Search
    - Create an app that can query and get specific fields from searched
      documents
      - Create an analyzer for the documents
      - Build an automated retrieval augmented generation pipelines to
        ingest documents
      - App can be used with a conversational agent to answer questions
        grounded in the indexed data
