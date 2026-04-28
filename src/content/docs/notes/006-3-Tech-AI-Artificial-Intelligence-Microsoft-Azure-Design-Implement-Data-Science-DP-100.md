---
date: 2026-03-24
filetags: ":artificial-intelligence:ai:data-science:microsoft:azure:dp100:epubnote:"
id: 276d06c2-5240-4f8f-bbb3-c964cecfce30
title: Design and Implement Data Science Solution in Azure DP-100
---

Source: My personal notes from [Course DP-100 Designing and implementing
a data science solution on Azure - Microsoft
Learn](https://learn.microsoft.com/en-ca/training/courses/DP-100T01)
with labs from [MicrosoftLearning/mslearn-azure-ml ·
GitHub](https://github.com/MicrosoftLearning/mslearn-azure-ml)

## Introduction

Course looks at data science work for machine learning in Azure.

Topics include input data preparation and ingestion, machine learning
model training, and model deployment and use. Machine learning
operations (MLOps) is used for managing a model deployment from start to
production use.

Half of course learning is labs using Python SDK and Azure compute and
storage to train and deploy models.

### Learning Agenda

- Day 1: Explore Azure Machine Learning (ML)
- Day 2: MLFlow, hyperparameters tuning, notebooks and scripts for
  custom model training
- Day 3: Pipelines, Responsible AI, model deployment
- Day 4: Model use and deployment, compare models, prompt engineering,
  exam preparation

### Case study: Diabetes diagnosis prediction

Using patient data, course will design an ML solution for diagnosis
starting from looking at data, ingestion, and ML training to model
deployment, use, and operations.

### Determine the Problem

For models to predict values, need to know machine learning methods:

1.  Classification - determine class
2.  Regression - numeric values
3.  Time-series forecasting - predict based on previous data
4.  Computer vision
5.  Natural language processing (NLP)

For the case study of diabetes diagnosis, classification is appropriate
with the metric of Accuracy of the diabetes classification of diabetic.

### Prepare data and plan machine learning (ML)

Identify where data is coming from and its data source. Could be tabular
/ structured, semi-structured, and unstructured data.

Determine appropriate storage for data and compute to do training.

Design data ingestion and how training will happen. Microsoft services:

- Azure storage and compute like virtual machines (VM)
- Azure AI Services
- Fabric
- Azure Databricks (Apache Spark based)
- Azure Machine Learning (ML)

For case study, configure appropriate training task settings and compute
like `serverless` and CPU. Compute infrastructure in Azure ML runs in
containers.

### Deploy and Use Model

#### Endpoints

Deploy to an endpoint for real time or batch predictions.

Endpoints are encrypted and could be deployed on public network or
private endpoint in a private network. Access can be controlled using
Managed Identity (no password, managed with ML resource).

After creating a ML workspace, access it on the web Azure ML studio.

#### Monitoring

Monitor the model for performance, data drift (changes in input or
target distributions), and adjust training with new data and schedule
it.

## Managing Azure Resources in the Labs

To speed up node management in compute clusters, you can optionally add
`az ml compute create ... --min-instances 2` to the Azure CLI command to
ensure 2 nodes are always running during the lab since cluster node
scaling can take minutes. This setting will consume more resources and
cost so make sure to shutdown resources when finished as the setting
will prevent the cluster from scaling to 0 nodes.

## Course Modules

- [Explore and configure the Azure Machine Learning
  workspace](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-design-implement-data-science-dp-100-machine-learning) covers
  introduction to data management, developer / data scientist tools, and
  compute and environment management
- [Model Training with Azure Machine Learning,
  MLflow](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-design-implement-data-science-dp-100-model-training-mlflow) covers MLflow
  experiment and job management, hyperparameter tuning, and pipelines.
- [Deploy and Use Models with Azure Machine
  Learning](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-design-implement-data-science-dp-100-model-deploy-and-use) covers registration
  of models, Responsible AI, management of endpoints, and generative
  models.

## See Also

### Resources

- [Azure/azureml-examples: Azure Machine Learning examples, tested with
  GitHub Actions -
  GitHub](https://github.com/Azure/azureml-examples/tree/main) - code
  samples similar to lab work
- [Designing and implementing a data science solution on Azure - Courses
  and Syllabus - Microsoft
  Learn](https://learn.microsoft.com/en-us/training/courses/dp-100t01)
- [MicrosoftLearning/mslearn-azure-ml -
  GitHub](https://github.com/MicrosoftLearning/mslearn-azure-ml) - Labs
  for course

### Video Learning

- [DP-100 On Demand Instructor-led Training Series - YouTube
  Playlist](https://www.youtube.com/playlist?list=PLahhVEj9XNTdbbqZh4B0lkLqg8aYbDyr9)
