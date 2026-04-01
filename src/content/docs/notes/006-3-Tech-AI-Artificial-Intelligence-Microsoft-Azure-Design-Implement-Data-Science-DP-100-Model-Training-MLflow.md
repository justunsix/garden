---
date: 2026-03-24
filetags: ":artificial-intelligence:ai:data-science:microsoft:azure:dp100:hyperparameter:pipelines:epubnote:"
id: f3e103ad-6b0b-49f2-8afa-66c4c55f17d5
title: Model Training with Azure Machine Learning, MLflow
---

Source: My personal notes from [Course DP-100 Designing and implementing
a data science solution on Azure - Microsoft
Learn](https://learn.microsoft.com/en-ca/training/courses/DP-100T01)
with labs from [MicrosoftLearning/mslearn-azure-ml ·
GitHub](https://github.com/MicrosoftLearning/mslearn-azure-ml). See labs
repository for updated code in this article.

## MLflow, Workflow for Training Models

MLflow is an open source framework for artificial intelligence (AI)
engineering platform for agents, LLMs, and machine learning (ML) models.
MLflow enables people to debug, evaluate, monitor, and optimize
production-quality AI applications while controlling costs and managing
access to models and data.

The MLflow platform can manage the machine learning lifecycle. MLflow
Tracking is a component that logs and tracks your training job metrics,
parameters and model artifacts.

## About Hyperparameters in Model Training and Hyperparamter Tuning

Hyperparameters are variables that affect how a model is trained, but
can't be obtained from the training data. Choosing the optimal
hyperparameter values for model training can be difficult and is usually
done through experiments (multiple trials) to find the best
hyperparameters.

### Hyperparameter Tuning

Hyparameter tuning is done by training models, using the same algorithm
and training data, but different hyperparameter values. This tuning is
needed as resulting models can differ with different hyperparamters and
tuning helps identify the best model for the use case. The set of
hyperparmater values during tuning is called a **search space**. Range
of possible values could be:

- Discrete - specific values, finite set
- Continuous - any value along a scale, infinite number

Sampling hyperparameters is done in a hyperparameter tuning run or sweep
job and there are different methods:

- Grid sampling can only be applied when all hyperparameters are
  discrete, and is used to try every possible combination of parameters
  in the search space.
- Random sampling is used to randomly select a value for each
  hyperparameter, which can be a mix of discrete and continuous values.
- Sobol - You may want to be able to reproduce a random sampling sweep
  job. Sobol is a type of random sampling that allows you to use a seed.
  When you add a seed, the sweep job can be reproduced, and the search
  space distribution is spread more evenly.
- Bayesian sampling chooses hyperparameter values based on the Bayesian
  optimization algorithm, which tries to select parameter combinations
  that will result in improved performance from the previous selection.

1.  Termination policies to Stop Trials

    Termination policies are set to stop a trial based on metrics. An
    early termination policy may depend on the search space and sampling
    method.

    There are two main parameters when you choose to use an early
    termination policy:

    - `evaluation_interval`: Specifies at which interval you want the
      policy to be evaluated. Every time the primary metric is logged
      for a trial counts as an interval.
    - `delay_evaluation`: Specifies when to start evaluating the policy.
      This parameter allows for at least a minimum of trials to complete
      without an early termination policy affecting them.

    Policies:

    - Bandit policy: stop a trial if the target performance metric
      underperforms the best trial so far by a specified margin.
    - Median stopping policy: abandons trials where the target
      performance metric is worse than the median of the running
      averages for all trials.
    - Truncation selection policy: cancels the lowest performing X% of
      trials at each evaluation interval based on the
      truncation<sub>percentage</sub> value you specify for X.

### Compute management

For training, consider compute than can scale to allow parallel trials
to speed up ML.

### Data Science Time Considerations

Because of hyperparameter tuning, it can be common for data scientists
to spend more time working on:

- Data preparation
- Tuning
- Waiting for experiments and trials to run

with other time on testing and evaluation of models.

## Components and Pipelines

Use case: components and pipelines allow sharing of common tasks and
their components and managing them together for machine learning work.
Component allow people to share and work on them together.

Components are reusable commands, code, or environments with its
metadata (name, version, other) and interface like parameters.
Components can be registered for use later on.

Examples include Python scripts, containers.

Pipelines are workflows for ML tasks where each task is defined as a
component. Azure ML pipelines are set in `yaml` files which include
pipeline job name, inputs, outputs, and settings.

## Lab: Track model training in notebooks with MLflow

- Create a workspace and associated compute using shell scripts and
  Azure CLI
- Run notebook that reads data, splits the data for testing, and starts
  one experiment for all jobs
- Models are trained and tracked using MLflow and outputs can be seen in
  Assets \> Jobs. MLflow will automatically create and log evaluation
  metrics. Custom logging of parameters and metrics is also possible.
- Jobs can log artifacts such as image plots and other files

``` python

# ## Connect to your workspace
# In[ ]:

from azure.identity import DefaultAzureCredential, InteractiveBrowserCredential
from azure.ai.ml import MLClient

try:
    credential = DefaultAzureCredential()
    # Check if given credential can get token successfully.
    credential.get_token("https://management.azure.com/.default")
except Exception as ex:
    # Fall back to InteractiveBrowserCredential in case DefaultAzureCredential not work
    credential = InteractiveBrowserCredential()

# In[ ]:

# Get a handle to workspace
ml_client = MLClient.from_config(credential=credential)

# ## Prepare the data
#
# You'll train a diabetes classification model. The training data is stored in the **data** folder as **diabetes.csv**.
#
# First, let's read the data:

# In[ ]:

import pandas as pd

print("Reading data...")
df = pd.read_csv('./data/diabetes.csv')
df.head()


# Next, you'll split the data into features and the label (Diabetes):

# In[ ]:

print("Splitting data...")
X, y = df[['Pregnancies','PlasmaGlucose','DiastolicBloodPressure','TricepsThickness','SerumInsulin','BMI','DiabetesPedigree','Age']].values, df['Diabetic'].values


# In[ ]:

from sklearn.model_selection import train_test_split

X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=0)

# You now have four dataframes:
#
# - `X_train`: The training dataset containing the features.
# - `X_test`: The test dataset containing the features.
# - `y_train`: The label for the training dataset.
# - `y_test`: The label for the test dataset.
#
# You'll use these to train and evaluate the models you'll train.
#
# ## Create an MLflow experiment
#
# Now that you're ready to train machine learning models, you'll first create an MLflow experiment. By creating the experiment, you can group all runs within one experiment and make it easier to find the runs in the studio.

# In[ ]:

import mlflow
experiment_name = "mlflow-experiment-diabetes"
mlflow.set_experiment(experiment_name)

# ## Train and track models
#
# To track a model you train, you can use MLflow and enable autologging. The following cell will train a classification model using logistic regression. You'll notice that you don't need to calculate any evaluation metrics because they're automatically created and logged by MLflow.

# In[ ]:

from sklearn.linear_model import LogisticRegression

with mlflow.start_run():
    mlflow.sklearn.autolog()

    model = LogisticRegression(C=1/0.1, solver="liblinear").fit(X_train, y_train)


# You can also use custom logging with MLflow. You can add custom logging to autologging, or you can use only custom logging.
#
# Let's train two more models with scikit-learn. Since you ran the `mlflow.sklearn.autolog()` command before, MLflow will now automatically log any model trained with scikit-learn. To disable the autologging, run the following cell:

# In[ ]:

mlflow.sklearn.autolog(disable=True)

# Now, you can train and track models using only custom logging.
#
# When you run the following cell, you'll only log one parameter and one metric.

# In[ ]:

from sklearn.linear_model import LogisticRegression
import numpy as np

with mlflow.start_run():
    model = LogisticRegression(C=1/0.1, solver="liblinear").fit(X_train, y_train)

    y_hat = model.predict(X_test)
    acc = np.average(y_hat == y_test)

    mlflow.log_param("regularization_rate", 0.1)
    mlflow.log_metric("Accuracy", acc)


# The reason why you'd want to track models, could be to compare the results of models you train with different hyperparameter values.
#
# For example, you just trained a logistic regression model with a regularization rate of 0.1. Now, train another model, but this time with a regularization rate of 0.01. Since you're also tracking the accuracy, you can compare and decide which rate results in a better performing model.

# In[ ]:

from sklearn.linear_model import LogisticRegression
import numpy as np

with mlflow.start_run():
    model = LogisticRegression(C=1/0.01, solver="liblinear").fit(X_train, y_train)

    y_hat = model.predict(X_test)
    acc = np.average(y_hat == y_test)

    mlflow.log_param("regularization_rate", 0.01)
    mlflow.log_metric("Accuracy", acc)


# Another reason to track your model's results is when you're testing another estimator. All models you've trained so far used the logistic regression estimator.
#
# Run the following cell to train a model with the decision tree classifier estimator and review whether the accuracy is higher compared to the other runs.

# In[ ]:

from sklearn.tree import DecisionTreeClassifier
import numpy as np

with mlflow.start_run():
    model = DecisionTreeClassifier().fit(X_train, y_train)

    y_hat = model.predict(X_test)
    acc = np.average(y_hat == y_test)

    mlflow.log_param("estimator", "DecisionTreeClassifier")
    mlflow.log_metric("Accuracy", acc)


# Finally, let's try to log an artifact. An artifact can be any file. For example, you can plot the ROC curve and store the plot as an image. The image can be logged as an artifact.
#
# Run the following cell to log a parameter, metric, and an artifact.

# In[ ]:

from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import roc_curve
import matplotlib.pyplot as plt
import numpy as np

with mlflow.start_run():
    model = DecisionTreeClassifier().fit(X_train, y_train)

    y_hat = model.predict(X_test)
    acc = np.average(y_hat == y_test)

    # plot ROC curve
    y_scores = model.predict_proba(X_test)

    fpr, tpr, thresholds = roc_curve(y_test, y_scores[:,1])
    fig = plt.figure(figsize=(6, 4))
    # Plot the diagonal 50% line
    plt.plot([0, 1], [0, 1], 'k--')
    # Plot the FPR and TPR achieved by our model
    plt.plot(fpr, tpr)
    plt.xlabel('False Positive Rate')
    plt.ylabel('True Positive Rate')
    plt.title('ROC Curve')
    plt.savefig("ROC-Curve.png")

    mlflow.log_param("estimator", "DecisionTreeClassifier")
    mlflow.log_metric("Accuracy", acc)
    mlflow.log_artifact("ROC-Curve.png")

```

## Lab: Run a training script as a command job in Azure Machine Learning, Notebook Export to Script, and Script parameters

Similar to previous labs, create the environment and run a Python script
manually in a compute instance. The example script below gets the data,
splits it, trains and then evaluates a model. Data is passed into the
script using a parameter like
`python train-model-parameters.py --training_data diabetes.csv`

``` python

import argparse
import pandas as pd
import numpy as np
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LogisticRegression
from sklearn.metrics import roc_auc_score
from sklearn.metrics import roc_curve
import matplotlib.pyplot as plt

def main(args):
    # read data
    df = get_data(args.training_data)

    # split data
    X_train, X_test, y_train, y_test = split_data(df)

    # train model
    model = train_model(args.reg_rate, X_train, X_test, y_train, y_test)

    # evaluate model
    eval_model(model, X_test, y_test)

# function that reads the data
def get_data(path):
    print("Reading data...")
    df = pd.read_csv(path)

    return df

# function that splits the data
def split_data(df):
    print("Splitting data...")
    X, y = df[['Pregnancies','PlasmaGlucose','DiastolicBloodPressure','TricepsThickness',
    'SerumInsulin','BMI','DiabetesPedigree','Age']].values, df['Diabetic'].values

    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.30, random_state=0)

    return X_train, X_test, y_train, y_test

# function that trains the model
def train_model(reg_rate, X_train, X_test, y_train, y_test):
    print("Training model...")
    model = LogisticRegression(C=1/reg_rate, solver="liblinear").fit(X_train, y_train)

    return model

# function that evaluates the model
def eval_model(model, X_test, y_test):
    # calculate accuracy
    y_hat = model.predict(X_test)
    acc = np.average(y_hat == y_test)
    print('Accuracy:', acc)

    # calculate AUC
    y_scores = model.predict_proba(X_test)
    auc = roc_auc_score(y_test,y_scores[:,1])
    print('AUC: ' + str(auc))

    # plot ROC curve
    fpr, tpr, thresholds = roc_curve(y_test, y_scores[:,1])
    fig = plt.figure(figsize=(6, 4))
    # Plot the diagonal 50% line
    plt.plot([0, 1], [0, 1], 'k--')
    # Plot the FPR and TPR achieved by our model
    plt.plot(fpr, tpr)
    plt.xlabel('False Positive Rate')
    plt.ylabel('True Positive Rate')
    plt.title('ROC Curve')

def parse_args():
    # setup arg parser
    parser = argparse.ArgumentParser()

    # add arguments
    parser.add_argument("--training_data", dest='training_data',
                        type=str)
    parser.add_argument("--reg_rate", dest='reg_rate',
                        type=float, default=0.01)

    # parse args
    args = parser.parse_args()

    # return args
    return args

# run script
if __name__ == "__main__":
    # add space in logs
    print("\n\n")
    print("*" * 60)

    # parse args
    args = parse_args()

    # run main function
    main(args)

    # add space in logs
    print("*" * 60)
    print("\n\n")

```

Submit a job using Azure ML libraries which will use the Python scripts
from the previous step.

The benefit of running the script as a command job in Azure ML is you'll
be able to track all the inputs and outputs of the script. All code and
data used with the script are stored in the job. Code to submitting the
job using existing Python scripts and CSV data is below.

``` python

from azure.ai.ml import command

# configure job in Azure ML

job = command(
    code="./src",
    command="python train-model-parameters.py --training_data diabetes.csv",
    environment="AzureML-sklearn-1.5@latest",
    compute="aml-cluster",
    display_name="diabetes-train-script",
    experiment_name="diabetes-training"
    )

# submit job
returned_job = ml_client.create_or_update(job)
aml_url = returned_job.studio_url
print("Monitor your job at", aml_url)

```

The job specifies the code to use, environment, and computer in the
workspace to use.

Scripts can be designed to take parameters as arguments and
hyperparamters can be passed into as script argument as an example.

## Lab: Use MLflow to track training jobs

Lab is similar to lab "Track model training in notebooks with MLflow" in
setup and run and differs in including custom tracking for parameters,
metrics, and artifacts and uses MLflow for outputting experiment
information.

It uses MLflow and Azure ML jobs to do training and tracking.

The follow code shows using MLflow to view experiment jobs. The same
information is available in Azure ML jobs interface after the job
completes.

``` python

# ## Use MLflow to view and search for experiments
#
# The Azure Machine Learning Studio is an easy-to-use UI to view and compare job runs. Alternatively, you can use MLflow to view experiment jobs.
#
# To list the jobs in the workspace, use the following command to list the experiments in the workspace:
#

# In[ ]:

import mlflow
experiments = mlflow.search_experiments()
for exp in experiments:
    print(exp.name)


# To retrieve a specific experiment, you can get it by its name:

# In[ ]:

experiment_name = "diabetes-training"
exp = mlflow.get_experiment_by_name(experiment_name)
print(exp)


# Using an experiment name, you can retrieve all jobs of that experiment:

# In[ ]:

mlflow.search_runs(exp.experiment_id)


# To more easily compare job runs and outputs, you can configure the search to order the results. For example, the following cell orders the results by `start_time`, and only shows a maximum of `2` results:

# In[ ]:

mlflow.search_runs(exp.experiment_id, order_by=["start_time DESC"], max_results=2)


# You can even create a query to filter the runs. Filter query strings are written with a simplified version of the SQL `WHERE` clause.
#
# To filter, you can use two classes of comparators:
#
# - Numeric comparators (metrics): =, !=, >, >=, <, and <=.
# - String comparators (params, tags, and attributes): = and !=.
#
# Learn more about [how to track experiments with MLflow](https://learn.microsoft.com/azure/machine-learning/how-to-track-experiments-mlflow).

# In[ ]:

query = "metrics.AUC > 0.8 and tags.model_type = 'LogisticRegression'"
mlflow.search_runs(exp.experiment_id, filter_string=query)

```

## Lab: Run pipelines in Azure Machine Learning

Pipelines manage steps required to prepare data, run training scripts,
and other tasks in machine learning.

Similar to previous labs, create the environment and run a Python
notebook. The notebook will:

- Create scripts in Python files, 1 for preparing data called
  `prep-data.py` and 1 for training the model called `train-model.py`.
  Python files use `mlflow`, `pandas`, `numpy`, and `scikit-learn` to
  manage data and train the model.
- Create pipeline files in `yaml` (code below)
- Load data, configure the pipeline and submit the pipeline job for
  running (code below)
- After, in Azure ML, go to Assets \> Pipelines to view the results of
  the run and view outputs of individual pipeline sub-jobs.

### Pipeline YAML files

The pipeline defines input and outputs. It will reuse a defined
environment in Azure ML called `azureml:AzureML-sklearn-1.5@latest`.

``` yaml

$schema: https://azuremlschemas.azureedge.net/latest/commandComponent.schema.json
name: prep_data
display_name: Prepare training data
version: 1
type: command
inputs:
  input_data:
    type: uri_file
outputs:
  output_data:
    type: uri_folder
code: ./src
environment: azureml:AzureML-sklearn-1.5@latest
command: >-
  python prep-data.py
  --input_data ${{inputs.input_data}}
  --output_data ${{outputs.output_data}}

---

$schema: https://azuremlschemas.azureedge.net/latest/commandComponent.schema.json
name: train_model
display_name: Train a logistic regression model
version: 1
type: command
inputs:
  training_data:
    type: uri_folder
  reg_rate:
    type: number
    default: 0.01
outputs:
  model_output:
    type: mlflow_model
code: ./src
environment: azureml:AzureML-sklearn-1.5@latest
command: >-
  python train-model.py
  --training_data ${{inputs.training_data}}
  --reg_rate ${{inputs.reg_rate}}
  --model_output ${{outputs.model_output}}

```

### Pipeline loading, building. configuration, and submission

``` python


# ## Load the components
#
# Now that you have defined each component, you can load the components by referring to the YAML files.

# In[9]:


from azure.ai.ml import load_component
parent_dir = ""

prep_data = load_component(source=parent_dir + "./prep-data.yml")
train_logistic_regression = load_component(source=parent_dir + "./train-model.yml")


# ## Build the pipeline
#
# After creating and loading the components, you can build the pipeline. You'll compose the two components into a pipeline. First, you'll want the `prep_data` component to run. The output of the first component should be the input of the second component `train_logistic_regression`, which will train the model.
#
# The `diabetes_classification` function represents the complete pipeline. The function expects one input variable: `pipeline_job_input`. A data asset was created during setup. You'll use the registered data asset as the pipeline input.

# In[10]:


from azure.ai.ml import Input
from azure.ai.ml.constants import AssetTypes
from azure.ai.ml.dsl import pipeline

@pipeline()
def diabetes_classification(pipeline_job_input):
    clean_data = prep_data(input_data=pipeline_job_input)
    train_model = train_logistic_regression(training_data=clean_data.outputs.output_data)

    return {
        "pipeline_job_transformed_data": clean_data.outputs.output_data,
        "pipeline_job_trained_model": train_model.outputs.model_output,
    }

pipeline_job = diabetes_classification(Input(type=AssetTypes.URI_FILE, path="azureml:diabetes-data:1"))


# You can retrieve the configuration of the pipeline job by printing the `pipeline_job` object:

# In[11]:


print(pipeline_job)


# You can change any parameter of the pipeline job configuration by referring to the parameter and specifying the new value:

# In[12]:


# change the output mode
pipeline_job.outputs.pipeline_job_transformed_data.mode = "upload"
pipeline_job.outputs.pipeline_job_trained_model.mode = "upload"
# set pipeline level compute
pipeline_job.settings.default_compute = "aml-cluster"
# set pipeline level datastore
pipeline_job.settings.default_datastore = "workspaceblobstore"

# print the pipeline job again to review the changes
print(pipeline_job)


# ## Submit the pipeline job
#
# Finally, when you've built the pipeline and configured the pipeline job to run as required, you can submit the pipeline job:

# In[13]:


# submit job to workspace
pipeline_job = ml_client.jobs.create_or_update(
    pipeline_job, experiment_name="pipeline_diabetes"
)
pipeline_job

```

## Lab: Perform hyperparameter tuning with a sweep job

Similar to previous labs, create the environment and run a Python
notebook to:

- Create the training script
- Set up a command job that will use the script and environment
- Set a search space for hyperparameters. To train three models, each
  with a different regularization rate (\`0.01\`, \`0.1\`, or \`1\`),
  the notebook defines the search space with a \`Choice\`
  hyperparameter.
- Configure and submit the sweep job with the training script and search
  space

After notebook run, go to Azure ML Jobs and the trials area to show all
models trained and see the `Accuracy` score differences for the
different regularization rate in the search space and which
regularization rate was the best.

The code below shows the command job, search space, and trials run of
the sweep job after the training script is created in the `src` folder:

``` python
# ## Configure and run a command job
#
# Run the cell below to train a classification model to predict diabetes. The model is trained by running the **train\.py** script that can be found in the **src** folder. It uses the registered `diabetes-data` data asset as the training data.
#
# - `code`: specifies the folder that includes the script to run.
# - `command`: specifies what to run exactly.
# - `environment`: specifies the necessary packages to be installed on the compute before running the command.
# - `compute`: specifies the compute to use to run the command.
# - `display_name`: the name of the individual job.
# - `experiment_name`: the name of the experiment the job belongs to.
#
# Note that the command job only runs the training script once, with a regularization rate of `0.1`. Before you run a sweep job to tune hyperparameters, it's a best practice to test whether your script works as expected with a command job.

# %%
from azure.ai.ml import command, Input
from azure.ai.ml.constants import AssetTypes

# configure job for training

job = command(
    code="./src",
    command="python train.py --training_data ${{inputs.diabetes_data}} --reg_rate ${{inputs.reg_rate}}",
    inputs={
        "diabetes_data": Input(
            type=AssetTypes.URI_FILE,
            path="azureml:diabetes-data:1"
            ),
        "reg_rate": 0.01,
    },
    environment="AzureML-sklearn-1.5@latest",
    compute="aml-cluster",
    display_name="diabetes-train-mlflow",
    experiment_name="diabetes-training",
    tags={"model_type": "LogisticRegression"}
    )

# submit job
returned_job = ml_client.create_or_update(job)
aml_url = returned_job.studio_url
print("Monitor your job at", aml_url)

# %% [markdown]
# ## Define the search space
#
# When your command job has completed successfully, you can configure and run a sweep job.
#
# First, you'll need to specify the search space for your hyperparameter. To train three models, each with a different regularization rate (`0.01`, `0.1`, or `1`), you can define the search space with a `Choice` hyperparameter.

# %%
from azure.ai.ml.sweep import Choice

command_job_for_sweep = job(
    reg_rate=Choice(values=[0.01, 0.1, 1]),
)

# %% [markdown]
# ## Configure and submit the sweep job
#
# You'll use the sweep function to do hyperparameter tuning on your training script. To configure a sweep job, you'll need to configure the following:
#
# - `compute`: Name of the compute target to execute the job on.
# - `sampling_algorithm`: The hyperparameter sampling algorithm to use over the search space. Allowed values are `random`, `grid` and `bayesian`.
# - `primary_metric`: The name of the primary metric reported by each trial job. The metric must be logged in the user's training script using `mlflow.log_metric()` with the same corresponding metric name.
# - `goal`: The optimization goal of the `primary_metric`. The allowed values are `maximize` and `minimize`.
# - `limits`: Limits for the sweep job. For example, the maximum amount of trials or models you want to train.
#
# Note that the command job is used as the base for the sweep job. The configuration for the command job will be reused by the sweep job.

# %%
# apply the sweep parameter to obtain the job
sweep_job = command_job_for_sweep.sweep(
    compute="aml-cluster",
    sampling_algorithm="grid",
    primary_metric="training_accuracy_score",
    goal="Maximize",
)

# set the name of the sweep job experiment
sweep_job.experiment_name="sweep-diabetes"

# define the limits for this sweep job
sweep_job.set_limits(max_total_trials=4, max_concurrent_trials=2, timeout=7200)

# %% [markdown]
# Run the following cell to submit the sweep job.

# %%
returned_sweep_job = ml_client.create_or_update(sweep_job)
aml_url = returned_sweep_job.studio_url
print("Monitor your job at", aml_url)

# %% [markdown]
# When the job is completed, navigate to the job overview. The **Trials** tab will show all models that have been trained and how the `Accuracy` score differs for each regularization rate value you tried.

```
