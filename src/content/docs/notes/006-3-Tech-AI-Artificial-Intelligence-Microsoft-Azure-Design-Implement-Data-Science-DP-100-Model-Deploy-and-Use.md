---
date: 2026-03-24
filetags: ":artificial-intelligence:ai:data-science:microsoft:azure:dp100:epubnote:"
id: 582cfcae-bd6b-41ff-9601-1576eb726d90
title: Deploy and Use Models with Azure Machine Learning
---

Source: My personal notes from [Course DP-100 Designing and implementing
a data science solution on Azure - Microsoft
Learn](https://learn.microsoft.com/en-ca/training/courses/DP-100T01)
with labs from [MicrosoftLearning/mslearn-azure-ml ·
GitHub](https://github.com/MicrosoftLearning/mslearn-azure-ml) and
[MicrosoftLearning/mslearn-genaiops, specific commit-
GitHub](https://github.com/MicrosoftLearning/mslearn-genaiops/tree/816d960840a03499a56eb7e7a96a46ea865d4620)
(Compare language models and Prompty lab)

## Responsible Artificial Intelligence (AI) Dashboard

[Responsible AI: Ethical policies and practices \| Microsoft
AI](https://www.microsoft.com/en-us/ai/responsible-ai) explains
principles, tools, and resources. [GitHub -
microsoft/responsible-ai-toolbox](https://github.com/microsoft/responsible-ai-toolbox)
provides tools for model and data exploration and assessment user
interfaces and libraries that enable a better understanding of AI
systems. These interfaces and libraries help developers and stakeholders
of AI systems to develop and monitor AI more responsibly, and make
decisions with data.

[Responsible AI Dashboard and Scorecard in Azure Machine
Learning](https://www.youtube.com/watch?v=1AYQBW11jXE) (video) from the
makers of the dashboard explains how the dashboard can help data
scientists and developers can improve models with analytics.

Use case: data analytics helps to make interventions or policy changes
during model usage

Dashboard uses components and can be found in the Azure ML model
details. The dashboard is available for building in CLI, SDK, and web
interface. Dashboard in code can be built in SDK. In Azure ML model
details web interface, it can be built visually.

Example components:

- Error analysis: which cohorts have error percentages
- Fairness Metrics: check how model is treating different cohorts in
  data
- What-if counterfactuals: on features
- Feature importances: features impacting model output
- Data explorer: check distribution of data
- Casual analysis: casual effects of features on outcomes
- Scorecard: easy to share and summarize

## Endpoints

An endpoint is HTTPS which receives data and returns a response. Azure
ML manages all infrastructure for managed endpoints.

Deployments can be done with MLflow models or other custom models.
MLflow are easier to deploy while custom models require additional
scripts and steps. MLflow models come with the pickle file,
specifications, and Python environment information. See the Deploy a
model labs for example `MLmodel` files.

### Using Endpoints

There are real time and batch endpoints. For batch, they trigger a batch
scoring job and an advantage is the job can be triggered from other
services like other Azure or external services. Real time endpoints
provide immediate responses.

Endpoint have a testing interface and provide code to use the endpoint

For batch endpoints, available compute resources with the endpoint will
be used.

## Azure AI Foundry

Main article: [Develop generative AI apps in
Azure](/garden/notes/006-3-tech-ai-artificial-intelligence-microsoft-azure-develop-solutions-ai102-generative) -
[Generative AI in Azure AI
Solutions](id:d5571956-346d-433d-8500-0b58a819fffb)

## Lab: Log and register models with MLflow

When logging models with MLflow and registering the model as an MLflow
model, you can move the model across platforms and workloads.

When you log a model as a model instead of an artifact, a MLmodel is
created in the output directory. The `MLmodel` file contains all the
model's metadata. You can customize the model's signature when logging
the model.

Similar to previous labs, set up the environment and run the notebook
to:

- Submit command job for training that will use MLflow autologging
- Specify the model's flavour as `scikit-learn` with autologging. The
  script trains a classification model by using the `diabetes.csv` data.
- Try autologging and manual logging of a model and check the signatures
- Customize the model with a defined signature and manual logging
- Register the model of the last run using its job name

After the jobs, compare the `MLmodel` files in the job Outputs + logs to
each other. Notice that the 3rd signature of the custom defined
signature is different from the previous runs. Previous runs used
tensor-based signatures, whereas the 3rd run used a column-based
signature.

Review the model details and note it can be deployed to an endpoint

### Model Output

The `MLmodel` file will look like:

``` yaml

artifact_path: model
flavors:
  python_function:
    env:
      conda: conda.yaml
      virtualenv: python_env.yaml
    loader_module: mlflow.sklearn
    model_path: model.pkl
    predict_fn: predict
    python_version: 3.8.16
  sklearn:
    code: null
    pickled_model: model.pkl
    serialization_format: cloudpickle
    sklearn_version: 1.0.2
mlflow_version: 2.4.1
model_uuid: 5b417457c7df470d905140fdfa2c3e83
run_id: good_arm_1x6r4ycb2r
signature:
  inputs: '[{"type": "integer", "name": "Pregnancies"}, {"type": "integer", "name":
    "PlasmaGlucose"}, {"type": "integer", "name": "DiastolicBloodPressure"}, {"type":
    "integer", "name": "TricepsThickness"}, {"type": "integer", "name": "DiastolicBloodPressure"},
    {"type": "integer", "name": "SerumInsulin"}, {"type": "double", "name": "BMI"},
    {"type": "double", "name": "DiabetesPedigree"}, {"type": "integer", "name": "Age"}]'
  outputs: '[{"type": "boolean"}]'
utc_time_created: '2026-03-24 18:44:31.435665'

```

The model output files will have Python environment information like
`conda.yaml`, `requirements.txt`, and `python_env.yaml` defining
packages used and their versions used.

## Lab: Create and explore the Responsible AI dashboard

After model training, we want to evaluate the model to see if it is
performing as expected. Next to performance metrics, there are other
factors to check. The [Responsible AI dashboard in Azure Machine
Learning](https://learn.microsoft.com/en-us/azure/machine-learning/how-to-responsible-ai-dashboard?view=azureml-api-2)
can analyze data and the model's predictions to identify any bias or
unfairness.

To prevent issues when running the notebook, set [add time to the
timeout
statements](https://github.com/MicrosoftLearning/mslearn-azure-ml/issues/158)
like `(timeout=300000)` in the notebook to prevent the host from
cancelling the jobs before they complete.

Like previous labs, the environment is setup and a notebook sets data up
and a training pipeline is submitted.

After the notebook finishes, the view the dashboard in Azure ML with
Assets \> Models \> select specific model and \> Responsible AI tab.

Exploring the dashboard allows connection to a compute instance for
analytics and can look at things affecting the model and outcomes.

## Lab: Deploy a model to a managed online endpoint / Deploy a model to a batch endpoint

To consume a model in an application, and get real-time or batch
predictions, you can deploy the model to a managed online endpoint. An
MLflow model can be deployed since you won't need to define the
environment or create the scoring script.

Once the environment is setup with calling lab's script
`./setup1.sh 60311720`. Run notebook to:

Due to deployment, set up and job times, run the notebook cell by cell
waiting for jobs / deployments to complete before moving to the next
cell.

- Set up the model, both labs will use an `MLModel` in the lab files and
  use it. The batch lab will register the model before deployment

- Set up an endpoint and configure a deployment

  - Note deployment to endpoint and endpoint deletion can take 10-15
    minutes.

- After deployment creation, it is will be tested and endpoint details
  checked

  - For batch, a job will have the unlabelled data set submitted to the
    batch endpoint for processin
    - View the unlabelled data imported by the notebook under the Assets
      \> Data
  - To save resources and costs for real time endpoints, the real time
    endpoint is deleted

- Results of the testing can be see in the notebook output. For batch, a
  CSV results file is available.

This code show model registration, creation and deployment of a batch
endpoint, then creation of input data for testing and submission of the
data in a job and retrieval of results.

``` python
#
# Imagine a health clinic takes patient measurements all day, saving the details for each patient in a separate file. Then overnight, the diabetes prediction model can be used to process all of the day's patient data as a batch, generating predictions that will be waiting the following morning so that the clinic can follow up with patients who are predicted to be at risk of diabetes. With Azure Machine Learning, you can accomplish this by creating a batch endpoint; and that's what you'll implement in this exercise.

# ## Connect to your workspace
#
# With the required SDK packages installed, now you're ready to connect to your workspace.
#
# To connect to a workspace, we need identifier parameters - a subscription ID, resource group name, and workspace name. Since you're working with a compute instance, managed by Azure Machine Learning, you can use the default values to connect to the workspace.

# %%
from azure.identity import DefaultAzureCredential, InteractiveBrowserCredential
from azure.ai.ml import MLClient

try:
    credential = DefaultAzureCredential()
    # Check if given credential can get token successfully.
    credential.get_token("https://management.azure.com/.default")
except Exception as ex:
    # Fall back to InteractiveBrowserCredential in case DefaultAzureCredential not work
    credential = InteractiveBrowserCredential()

# %%
# Get a handle to workspace
ml_client = MLClient.from_config(credential=credential)

# %% [markdown]
# ## Register the model
#
# Batch deployments can only deploy models registered in the workspace. You'll register an MLflow model, which is stored in the local `model` folder.

# %%
from azure.ai.ml.entities import Model
from azure.ai.ml.constants import AssetTypes

model_name = 'diabetes-mlflow'
model = ml_client.models.create_or_update(
    Model(name=model_name, path='./model', type=AssetTypes.MLFLOW_MODEL)
)

# %% [markdown]
# ## Create a batch endpoint
#
# A batch endpoint is an HTTPS endpoint that applications can call to trigger a batch scoring job. A batch endpoint name needs to be unique within an Azure region. You'll use the `datetime` function to generate a unique name based on the current date and time.

# %%
import datetime

endpoint_name = "batch-" + datetime.datetime.now().strftime("%m%d%H%M%f")
endpoint_name

# %% [markdown]
# To create an endpoint with the `BatchEndpoint` class, you need to specify the name and optionally a description. After creating an endpoint, you'll deploy a model to the endpoint.

# %%
from azure.ai.ml.entities import BatchEndpoint

# create a batch endpoint
endpoint = BatchEndpoint(
    name=endpoint_name,
    description="A batch endpoint for classifying diabetes in patients",
)

ml_client.batch_endpoints.begin_create_or_update(endpoint)

# %% [markdown]
# <p style="color:red;font-size:120%;background-color:yellow;font-weight:bold"> IMPORTANT! Wait until the endpoint is created before continuing! A green notification should appear in the studio. </p>
#
# ## Create the deployment
#
# A deployment is a set of resources required for hosting the model that does the actual inferencing. We will create a deployment for our endpoint using the `BatchDeployment` class.
#
# Since you're deploying an MLflow model, you don't need a scoring script or define the environment. Azure Machine Learning will automatically create those assets for you. The `MLmodel` file in the `model` folder is used to understand what the expected inputs and outputs are of the model.
#
# You'll deploy a model with the following parameters:
#
# - `name`: Name of the deployment.
# - `description`: Optional description to further clarify what the deployment represents.
# - `endpoint_name`: Name of the previously created endpoint the model should be deployed to.
# - `model`: Name of the registered model.
# - `compute`: Compute to be used when invoking the deployed model to generate predictions.
# - `instance_count`: Count of compute nodes to use for generating predictions.
# - `max_concurrency_per_instance`: Maximum number of parallel scoring script runs per compute node.
# - `mini_batch_size`: Number of files passed per scoring script run.
# - `output_action`: Each new prediction will be appended as a new row to the output file.
# - `output_file_name`: File to which predictions will be appended.
# - `retry_settings`: Settings for a mini-batch fails.
# - `logging_level`: The log verbosity level. Allowed values are `warning`, `info`, and `debug`.
#
# Running the following cell will configure and create the deployment.

# %%
from azure.ai.ml.entities import ModelBatchDeployment, BatchRetrySettings
from azure.ai.ml.constants import BatchDeploymentOutputAction

deployment = ModelBatchDeployment(
    name="classifier-diabetes-mlflow",
    description="A diabetes classifier",
    endpoint_name=endpoint.name,
    model=model,
    compute="aml-cluster",
    instance_count=2,
    max_concurrency_per_instance=2,
    mini_batch_size=2,
    output_action=BatchDeploymentOutputAction.APPEND_ROW,
    output_file_name="predictions.csv",
    retry_settings=BatchRetrySettings(max_retries=3, timeout=300),
    logging_level="info",
)
ml_client.batch_deployments.begin_create_or_update(deployment)

# %% [markdown]
# <p style="color:red;font-size:120%;background-color:yellow;font-weight:bold"> IMPORTANT! Wait until the deployment is completed before continuing! A green notification should appear in the studio. </p>
#
# You can deploy multiple models to an endpoint. You can set the default deployment to specify which model should be used by default when calling a batch endpoint.

# %%
endpoint.defaults = {}

endpoint.defaults["deployment_name"] = deployment.name

ml_client.batch_endpoints.begin_create_or_update(endpoint)

# %% [markdown]
# <p style="color:red;font-size:120%;background-color:yellow;font-weight:bold"> IMPORTANT! Wait until the default deployment is set before continuing! A green notification should appear in the studio. </p>
#
# ## Prepare the data for batch predictions
#
# In the `data` folder you'll find CSV files with unlabeled data. You'll create a data asset that points to the files in the `data` folder, which you'll use as input for the batch job.

# %%
from azure.ai.ml.entities import Data
from azure.ai.ml.constants import AssetTypes

data_path = "./data"
dataset_name = "patient-data-unlabeled"

patient_dataset_unlabeled = Data(
    path=data_path,
    type=AssetTypes.URI_FOLDER,
    description="An unlabeled dataset for diabetes classification",
    name=dataset_name,
)
ml_client.data.create_or_update(patient_dataset_unlabeled)

# %%
patient_dataset_unlabeled = ml_client.data.get(
    name="patient-data-unlabeled", label="latest"
)

# %% [markdown]
# ## Submit the job
#
# Now that you have deployed a model to a batch endpoint, and have an unlabeled data asset, you're ready to invoke the endpoint to generate predictions on the unlabeled data.
#
# First, you'll define the input by referring to the registered data asset. Then, you'll invoke the endpoint, which will submit a pipeline job. You can use the job URL to monitor it in the Studio. The job will contain a child job that represents the running of the (generated) scoring script to get the predictions.

# %%
from azure.ai.ml import Input
from azure.ai.ml.constants import AssetTypes

input = Input(type=AssetTypes.URI_FOLDER, path=patient_dataset_unlabeled.id)

# %%
job = ml_client.batch_endpoints.invoke(
    endpoint_name=endpoint.name,
    input=input)

ml_client.jobs.get(job.name)

# %% [markdown]
# ## Get the results
#
# When the pipeline job that invokes the batch endpoint is completed, you can view the results. All predictions are collected in the `predictions.csv` file that is stored in the default datastore. You can download the file and visualize the data by running the following cells.

# %%
ml_client.jobs.download(name=job.name, download_path=".", output_name="score")

# %%
import pandas as pd

score = pd.read_csv("predictions.csv", index_col=0, names=["patient", "prediction", "file"])
score

```

[Issue
\#160](https://github.com/MicrosoftLearning/mslearn-azure-ml/issues/160):
"Lab 11 Batch Endpoint - ML Job Failing" involves this error which may
block progression in the lab:

``` text

Azure Machine Learning Batch Inference Start
[2026-03-25 17:32:18.918602] No started flag set. Skip creating started flag.
No module named 'pkg_resources'
No module named 'pkg_resources'
Azure Machine Learning Batch Inference End
Cleaning up all outstanding Run operations, waiting 300.0 seconds
2 items cleaning up...
Cleanup took 0.14349722862243652 seconds
Traceback (most recent call last):
  File "driver/amlbi_main.py", line 275, in <module>
    main()
  File "driver/amlbi_main.py", line 226, in main
    sys.exit(exitcode_candidate)
SystemExit: 42

```

### Example sample data to use for testing the model's endpoint

The model will return a response of 0 (Not diabetic) or 1 (diabetic)

``` json

{
  "input_data": {
    "columns": [
      "Pregnancies",
      "PlasmaGlucose",
      "DiastolicBloodPressure",
      "TricepsThickness",
      "SerumInsulin",
      "BMI",
      "DiabetesPedigree",
      "Age"
    ],
    "index": [1],
    "data": [
      [
      0,148,58,11,179,39.19207553,0.160829008,45
    ]
    ]
  }
}

```

## Lab: Compare language models from the model catalog

### Case Study

Use Case: Building an app to help students learn how to code in Python.
In the app, you want an automated tutor that can help students write and
evaluate code. In one exercise, students need to come up with the
necessary Python code to plot a pie chart based on a provided image.

Pie chart showing marks obtained in an exam with sections for maths
(34.9%), physics (28.6%), chemistry (20.6%), and English (15.9%)

Use the model catalog to explore whether an AI model solves your
problem. You can use the model catalog to select models to deploy, which
you can then compare to explore which model best meets your needs.

### Comparing Models

The lab compares two language models in the Azure AI Foundry portal
model catalog.

You need to select a language model that accepts images as input, and is
able to generate accurate code. The available models that meet those
criteria are GPT-4o, and GPT-4o mini.

### Deploy resources - Create an Azure AI hub and project

You can create an Azure AI hub and project manually through the Azure AI
Foundry portal, as well as deploy the models used in the exercise.
However, you can also automate this process through the use of a
template application with Azure Developer CLI (azd).

Use the cloud shell. In the PowerShell pane, enter the following
commands to clone this exercise's repo:

``` powershell

rm -r mslearn-genaiops -f
git clone https://github.com/MicrosoftLearning/mslearn-genaiops && cd mslearn-genaiops && git checkout 816d960840a03499a56eb7e7a96a46ea865d4620

# After the repo has been cloned, enter the following commands to initialize the Starter template.
cd Starter
azd init

# Once prompted, give the new environment the name =AIFoundry= It will be used as basis for giving unique names
# to all the provisioned resources.

# Next, enter the following command to run the Starter template. It will provision an AI Hub with dependent resources
# AI project, AI Services and an online endpoint. It will also deploy the models GPT-4o, and GPT-4o mini.
azd up

```

When prompted, choose the subscription to use and then choose
`(Europe) Sweden Central (swedencentral)` as your current location for
resource provision.

Wait for the script to complete - this typically takes around 10
minutes, but in some cases may take longer.

### Troubleshooting deployment

Note: Azure OpenAI resources are constrained at the tenant level by
regional quotas. The listed regions above include default quota for the
model type(s) used in this exercise. Randomly choosing a region reduces
the risk of a single region reaching its quota limit. In the event of a
quota limit being reached, there's a possibility you may need to create
another resource group in a different region. Learn more about model
availability per region

Troubleshooting tip: No quota available in a given region

### Compare the models

You know that there are three models that accept images as input whose
inference infrastructure is fully managed by Azure. Now, you need to
compare them to decide which one is ideal for our use case.

### Select Models

In a new browser tab, open Azure AI Foundry portal at
<https://ai.azure.com> and sign in using your Azure credentials. If
prompted, select the AI project created earlier.

- Navigate to the Model catalog page using the menu on the left.
- Select Compare models (find the button next to the filters in the
  search pane).
- Remove the selected models.
- One by one, add the three models you want to compare: gpt-4o, and
  gpt-4o-mini. For gpt-4, make sure that the selected version is
  turbo-2024-04-09, as it is the only version that accepts images as
  input.
- Change the x-axis to Accuracy.
- Ensure the y-axis is set to Cost.

Review the plot and try to answer the following questions:

- Which model is more accurate?
- Which model is cheaper to use?

The benchmark metric accuracy is calculated based on publicly available
generic datasets. From the plot we can already filter out one of the
models, as it has the highest cost per token but not the highest
accuracy. Before making a decision, let's explore the quality of outputs
of the two remaining models specific to your use case.

### Set up your development environment in Cloud Shell

To quickly experiment and iterate, you'll use a set of Python scripts in
Cloud Shell.

Back in the Azure Portal tab, navigate to the resource group created by
the deployment script earlier and select your Azure AI Foundry resource.

In the Overview page for your resource, select Click here to view
endpoints and copy the AI Foundry API endpoint.

Save the endpoint to use later to connect to your project in a client
application.

Back in the Azure Portal tab, open Cloud Shell if you closed it before
and run the following command to navigate to the folder with the code
files used in this exercise:

``` powershell

cd ~/mslearn-genaiops/Files/02/
# In the Cloud Shell command-line pane, enter the following command to install the libraries you need:

python -m venv labenv
./labenv/bin/Activate.ps1

pip install python-dotenv azure-identity azure-ai-projects openai matplotlib

# Enter the following command to open the configuration file that has been provided

code .env
```

The file is opened in a code editor.

In the code file, replace the your<sub>projectendpoint</sub> placeholder
with the endpoint for your project that you copied earlier. Observe that
the first and second model used in the exercise are gpt-4o and
gpt-4o-mini respectively.

After you've replaced the placeholder, in the code editor, use the
CTRL+S command or Right-click \> Save to save your changes and then use
the CTRL+Q command or Right-click \> Quit to close the code editor while
keeping the cloud shell command line open.

### Send prompts to your deployed models

You'll now run multiple scripts that send different prompts to your
deployed models. These interactions generate data that you can later
observe in Azure Monitor.

Run the following command to view the first script that has been
provided `code model1.py`

For both Python files, remove the `api_version "2024-10-21"` code from
the `get_openai_client` call due to API changes.

The script will encode the image used in this exercise into a data URL.
This URL will be used to embed the image directly in the chat completion
request together with the first text prompt. Next, the script will
output the model's response and add it to the chat history and then
submit a second prompt. The second prompt is submitted and stored for
the purpose of making the metrics observed later on more significant,
but you can uncomment the optional section of the code to have the
second response as an output as well.

In the cloud shell command-line pane, enter the following command to
sign into Azure `az login`. You must sign into Azure - even though the
cloud shell session is already authenticated.

Note: In most scenarios, just using az login will be sufficient.
However, if you have subscriptions in multiple tenants, you may need to
specify the tenant by using the –tenant parameter. See Sign into Azure
interactively using the Azure CLI for details.

When prompted, follow the instructions to open the sign-in page in a new
tab and enter the authentication code provided and your Azure
credentials. Then complete the sign in process in the command line,
selecting the subscription containing your Azure AI Foundry hub if
prompted.

After you have signed in, enter the following command to run the
application: `python model1.py`

The model will generate a response, which will be captured with
Application Insights for further analysis. Let's use the second model to
explore their differences.

In the Cloud Shell command-line pane beneath the code editor, enter the
following command to run the second script: `python model2.py`

Now that you have outputs from both models, are they in any way
different?

Note: Optionally, you can test the scripts given as answers by copying
the code blocks, running the command code your<sub>filename</sub>.py,
pasting the code in the editor, saving the file and then running the
command python your<sub>filename</sub>.py. If the script ran
successfully, you should have a saved image that can be downloaded with
download imgs/gpt-4o.jpg or download imgs/gpt-4o-mini.jpg.

### Compare token usage of models

Lastly, you will run a third script that will plot the number of
processed tokens over time for each model. This data is obtained from
Azure Monitor.

Before running the last script, you need to copy the resource ID for
your Azure AI Foundry resource from the Azure Portal. Go to the overview
page of your Azure AI Foundry resource and select JSON View. Copy the
Resource ID and replace the your<sub>resourceid</sub> placeholder in the
code file:

``` powershell

code plot.py
# Save your changes

# In the Cloud Shell command-line pane beneath the code editor,
# enter the following command to run the third script
python plot.py
# Once the script is finished, enter the following command to
# download the metrics plot
download imgs/plot.png

```

### Conclusion

After reviewing the plot and remembering the benchmark values in the
Accuracy vs. Cost chart observed before, can you conclude which model is
best for your use case? Does the difference in the outputs' accuracy
outweigh the difference in tokens generated and therefore cost?

`gpt-4o-mini` uses less token and for the simple task, provides a
reasonable accuracy.

## Lab: Explore prompt engineering with Prompty

During ideation, you want to quickly test and improve on different
prompts with your language model. There are various ways you can
approach prompt engineering, through the playground in the Azure AI
Foundry portal, or using Prompty for a more code-first approach.

In this exercise, you explore prompt engineering with Prompty in Azure
Cloud Shell, using a model deployed through Azure AI Foundry.

### Set up the environment

To complete the tasks in this exercise, you need:

An Azure AI Foundry hub, An Azure AI Foundry project, A deployed model
(like GPT-4o). Create an Azure AI hub and project Note: If you already
have an Azure AI project, you can skip this procedure and use your
existing project.

You can create an Azure AI project manually through the Azure AI Foundry
portal, as well as deploy the model used in the exercise. However, you
can also automate this process through the use of a template application
with Azure Developer CLI (azd).

In a web browser, open Azure portal at <https://portal.azure.com> and
sign in using your Azure credentials.

Use the \[\>\_\] button to the right of the search bar at the top of the
page to create a new Cloud Shell in the Azure portal, selecting a
PowerShell environment. The cloud shell provides a command line
interface in a pane at the bottom of the Azure portal. For more
information about using the Azure Cloud Shell, see the Azure Cloud Shell
documentation.

Note: If you have previously created a cloud shell that uses a Bash
environment, switch it to PowerShell.

In the PowerShell pane, enter the following commands to clone this
exercise's repo:

``` powershell

rm -r mslearn-genaiops -f
git clone https://github.com/MicrosoftLearning/mslearn-genaiops && cd mslearn-genaiops && git checkout 816d960840a03499a56eb7e7a96a46ea865d4620

#After the repo has been cloned, enter the following commands to initialize the Starter template.
cd Starter
azd init

# Once prompted, give the new environment the name AIFoundry It will be used as basis for giving unique names
# to all the provisioned resources.
# Next, enter the following command to run the Starter template. It will provision an AI Hub with dependent resources,
# AI project, AI Services and an online endpoint.
azd up

```

When prompted, choose the subscription to use and then choose
`(Europe) Sweden Central (swedencentral)` as your current location for
resource provision.

Wait for the script to complete - this typically takes around 10
minutes, but in some cases may take longer.

Note: Azure OpenAI resources are constrained at the tenant level by
regional quotas. The listed regions above include default quota for the
model type(s) used in this exercise. Randomly choosing a region reduces
the risk of a single region reaching its quota limit. In the event of a
quota limit being reached, there's a possibility you may need to create
another resource group in a different region. Learn more about model
availability per region

Once all resources have been provisioned, use the following commands to
fetch the endpoint and access key to your AI Services resource. Note
that you must replace \<rg-env<sub>name</sub>\> and \<aoai-xxxxxxxxxx\>
with the names of your resource group and AI Services Foundry resource.
Both are printed in the deployment's output.

``` powershell

Get-AzCognitiveServicesAccount -ResourceGroupName <rg-env_name> -Name <aoai-xxxxxxxxxx> | Select-Object -Property endpoint
Get-AzCognitiveServicesAccountKey -ResourceGroupName <rg-env_name> -Name <aoai-xxxxxxxxxx> | Select-Object -Property Key1

# Examples and output
Get-AzCognitiveServicesAccount -ResourceGroupName rg-AIFoundry -Name aoai-fmguhzgsrvhrs | Select-Object -Property endpoint
Endpoint
--------
https://aoai-fmguhzgsrvhrs.cognitiveservices.azure.com/

Get-AzCognitiveServicesAccountKey -ResourceGroupName rg-AIFoundry -Name aoai-fmguhzgsrvhrs | Select-Object -Property Key1
Key1
----
a66a1kye2868d4bbc...mylongkey...42323

```

Copy these values as they will be used later on.

### Set up your virtual environment in Cloud Shell

To quickly experiment and iterate, you'll use a set of Python scripts in
Cloud Shell.

In the Cloud Shell command-line pane, enter the following command to
navigate to the folder with the code files used in this exercise:

``` powershell

cd ~/mslearn-genaiops/Files/03/

#Enter the following commands to activate a virtual environment and install the libraries you need:

python -m venv labenv
./labenv/bin/Activate.ps1
pip install python-dotenv openai tiktoken azure-ai-projects prompty[azure]

# Enter the following command to open the configuration file that has been provided
code .env

```

In the code file, replace the ENDPOINTNAME and APIKEY placeholders with
the endpoint and key values you copied earlier.

After you've replaced the placeholders, in the code editor, use the
CTRL+S command or Right-click \> Save to save your changes and then use
the CTRL+Q command or Right-click \> Quit to close the code editor while
keeping the cloud shell command line open.

### Optimize system prompt

Minimizing the length of system prompts while maintaining functionality
in generative AI is fundamental for large-scale deployments. Shorter
prompts can lead to faster response times, as the AI model processes
fewer tokens, and also uses fewer computational resources.

Open the Python file:

``` powershell

code optimize-prompt.py

```

Review the code and note that the script executes the start.prompty
template file that already has a pre-defined system prompt.

Run code start.prompty to review the system prompt. Consider how you
might shorten it while keeping its intent clear and effective. For
example:

``` python

original_prompt = "You are a helpful assistant. Your job is to answer questions and provide information to users in a concise and accurate manner."
optimized_prompt = "You are a helpful assistant. Answer questions concisely and accurately."

```

Remove redundant words and focus on the essential instructions. Save
your optimized prompt in the file.

### Test and validate your optimization

Testing prompt changes is important to ensure you reduce token usage
without losing quality.

Run `code token-count.py` to open and review the token counter app
provided in the exercise. If you used an optimized prompt different than
what was provided in the example above, you can use it in this app as
well.

Run the script with `python token-count.py` and observe the difference
in token count. Ensure the optimized prompt still produces high-quality
responses.

### Analyze user interactions

Understanding how users interact with your app helps identify patterns
that increase token usage.

Review a sample dataset of user prompts:

``` text

Summarize the plot of War and Peace.
What are some fun facts about cats?
Write a detailed business plan for a startup that uses AI to optimize supply chains.
Translate 'Hello, how are you?' into French.
Explain quantum entanglement to a 10-year-old.
Give me 10 creative ideas for a sci-fi short story.

```

For each, identify whether it is likely to result in a short, medium, or
long/complex response from the AI.

Review your categorizations. What patterns do you notice? Consider:

- Does the level of abstraction (e.g., creative vs factual) affect
  length?
- Do open-ended prompts tend to be longer?
- How does instructional complexity (e.g., “explain like I’m 10”)
  influence the response?
- Enter the following command to run the optimize-prompt application:

`python optimize-prompt.py` Use some of the samples provided above to
verify your analysis.

Now use the following long-form prompt and review its output:

``` text
Write a comprehensive overview of the history of artificial intelligence, including key milestones, major contributors, and the evolution of machine learning techniques from the 1950s to today.
```

Rewrite this prompt to:

- Limit the scope
- Set expectations for brevity
- Use formatting or structure to guide the response
- Compare the responses to verify that you obtained a more concise
  answer.

NOTE: You can use `token-count.py` to compare token usage in both
responses.

Example of a rewritten prompt:

“Give a bullet-point summary of 5 key milestones in AI history.”

\[OPTIONAL\] Apply your optimizations in a real scenario

- Imagine you are building a customer support chatbot that must provide
  quick, accurate answers.
- Integrate your optimized system prompt and template into the chatbot's
  code (you can use optimize-prompt.py as a starting point).
- Test the chatbot with various user queries to ensure it responds
  efficiently and effectively.

### Conclusion

Prompt optimization is a key skill for reducing costs and improving
performance in generative AI applications. By shortening prompts, using
templates, and analyzing user interactions, you can create more
efficient and scalable solutions.
