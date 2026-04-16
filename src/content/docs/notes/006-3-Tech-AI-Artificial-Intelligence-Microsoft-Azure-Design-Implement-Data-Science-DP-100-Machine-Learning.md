---
date: 2026-03-24
filetags: ":artificial-intelligence:ai:data-science:microsoft:azure:dp100:epubnote:"
id: e2ac631f-68af-42d2-af70-6297a9f575e6
title: Explore and configure the Azure Machine Learning workspace
---

Source: My personal notes from [Course DP-100 Designing and implementing
a data science solution on Azure - Microsoft
Learn](https://learn.microsoft.com/en-ca/training/courses/DP-100T01)
with labs from [MicrosoftLearning/mslearn-azure-ml ·
GitHub](https://github.com/MicrosoftLearning/mslearn-azure-ml)

## About Azure Machine Learning

Similar products are Azure Foundry (machine learning and generative
models) and Azure Machine Learning (training models).

It manages a workspace for working with data (assets), compute
resources, and integration with developer tools (Python, Azure CLI, VS
Code). Data can be uploaded and external data storage.

Access is managed by Azure role based access control.

### Compute and Options

- Compute instances - single computer
- Compute cluster - multiple computers to run jobs
- Kubernetes cluster - run containers for scaling and different
  environments
- Serverless - good for small jobs, experiments

#### Choosing compute

| Use Case               | Compute                         |
|------------------------|---------------------------------|
| Small jobs, experience | Serverless                      |
| Training, pipelines    | Serverless, Instances, Clusters |
| Regular workload       | Instances, Clusters             |

Can be configured to start and stop.

### URIs

Uniform Resource Identifier (URI) are locations of data. Azure ML uses
URIs to connect to data directly such as https, abfs, and others.

### Assets

- Data used for training and updates. Can be reused and versioned.
  Examples or URI file, URI folder, and MLTable file with schema to read
  tabular data.
- Environments for packages and scripts
  - Custom environments are supported with container images, build
    context like `requirements.txt` and Conda specification.
- Models are trained models in the workspace
- Components for sharing code

### Development

Model training options include one or combinations:

- Automated ML
  - Explore algorithms and hyperparameter (a parameter that can be set
    in order to define any configurable part of a model's learning
    process) values
- Experiment by running notebooks, running scripts
  - Tune hyperparameters
  - Run pipelines of multiple scripts or components
- Optimization of code and inputs

### Configuration and Setup, User Interface

Can be done in web interface, using Azure CLI, and IDE integration like
VS Code's Azure Machine Learning extension.

Notebooks can be converted to scripts, set up in a job and then
optimized and parameters set up.

## Lab: Explore the Azure Machine Learning workspace

- Create a new Azure machine learning workspace in a region close to
  you, leave defaults which will create an Azure Machine Learning
  workspace, an Application Insights, a Key Vault, and a Storage
  Account.
- Open the workspace in Azure ML Studio and see Authoring, Assets, and
  Manage parts of ML solutions.
- Create a new Automated ML job using `Classification` and upload
  diabetes data for training.
- Use `Diabetic (boolean)` as target column and `Accuracy` as primary
  metric
- Set other experiment settings and compute VM
- Submit the job and when finished, review the run and output.
  - For example, in one run, the algorithm selected was `VotingEnsemble`

## Lab: Explore developer tools for ML workspace

Log into the Azure CLI to:

- Install ML extension. Use the Azure Cloud shell to avoid issues with
  extension installations.
- Create the ML workspace and compute VM

Example commands

``` shell

az login
az extension remove -n azure-cli-ml
az extension remove -n ml
az extension add -n ml -y

# Create group and workspace
az group create --name "rg-dp100-labs" --location "eastus"
az ml workspace create --name "mlw-dp100-labs60228811" -g "rg-dp100-labs"

# Create compute and compute cluster
az ml compute create --name "ci60228811" --size STANDARD_DS11_V2 --type ComputeInstance -w mlw-dp100-labs60228811 -g rg-dp100-labs
az ml compute create --name "aml-cluster" --size STANDARD_DS11_V2 --max-instances 2 --type AmlCompute -w mlw-dp100-labs60228811 -g rg-dp100-labs

```

Run the `Labs/02/Run training script.ipynb` notebook. For notebook run,
example `config.json` to store in same directory as notebook.

``` json

{
  "subscription_id": "1805fe6f-51e4-4eb0-abc3-4a01d91fa842",
  "resource_group": "rg-dp100-labs",
  "workspace_name": "mlw-dp100-labs60228811"
}

```

Script will import libraries needs for data, calculation, and trianing.
It will load data, select classification, split data for testing, set
features and label (Diabetic), hyperparameters, and calculate metrics.
After setup, script will submit job using script using compute
resources.

## Lab: Find the best classification model with Automated Machine Learning

- Create a workspace and associated compute using shell scripts and
  Azure CLI
- Run scripts to set up training job with specific settings and data
- Automated Machine Learning (AutoML) will automatically try different
  algorithms to find the best fit.
- Review the results of the jobs, models, and accuracy results, area
  under the curve (AUC) and other metrics
