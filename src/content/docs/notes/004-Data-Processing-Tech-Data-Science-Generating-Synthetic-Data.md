---
date: 2025-09-29
filetags: ":data-science:data-management:generation:synthetic-data:data:epubnote:"
id: 7afc2137-0042-42d8-8fce-2c07ba852c76
title: Generating Synthetic Data
---

Source: 2025 Hackathon training session at work 2025-09-29 following
[fake-tutorial-2025-Summer - Nicholas Chin on
GitHub](https://github.com/nicholas-chin/faker-tutorial-2025-Summer/)

## Use Case

Need random synthetic data for testing and use in data projects. Data
must not contain real data or personal information like for privacy
reasons or testing in unsecured environments.

Synthetic data can be applied to proofs of concept, data anonymization,
and test data analysis.

## Technology Overview

Compute and file management will be provided by Databricks based on
Apache Spark which can be used in a free trial or with a Databricks
account.

Other options is code can be run on your computer with Python and
[Jupyter](https://pypi.org/project/jupyter/) or other Python notebook
services like Google Colab (see [Google
Colaboratory](/garden/notes/005-tech-google-colab) - [Google
Colaboratory](id:30915df2-3cb0-4109-9151-816d6638065f))

Data creation uses the Python [Faker](https://pypi.org/project/Faker/)
library to generate randomized data in the method described at
[fake-tutorial-2025-Summer - Nicholas Chin on
GitHub](https://github.com/nicholas-chin/faker-tutorial-2025-Summer/).
In the repository, see the README for instructions on use and use the
notebook or script file as they are the same.

## Demonstration

Log into Databricks. Follow instructions in the repository to use
Generate Test Data Tutorial Python script. Upload the script to
Databricks.

View the Python notebook in the repository and its instructions. Run the
notebook in the repository using Databricks compute which will set up
the Python environment. Data created will be stored in memory and can be
downloaded in Excel and CSV.

### Generating Data

Once the environment is setup and Faker library is installed, Faker
takes in a seed, language to use (locale), and number of rows (amount of
data) to generate. After running, synthetic data is created.

Using the notebook, you can set alternative settings for Faker to
customize the data creation.

### Customized Data generation

Columns in the data can be assigned possible values and percentage
change and/or randomized data based on standard fields like name and
address.

Example creation of data for a use case of create members of a music
company in Canada. After creation, data will be printed. Code is adapted
from [Python notebook in the
repository](https://github.com/nicholas-chin/faker-tutorial-2025-Summer/blob/main/Generate%20Test%20Data%20Tutorial%202025%20Summer.ipynb)

``` python

from faker import Faker
from collections import OrderedDict

NUMBER_OF_ROWS = 10

# Seed produces the same result when the 
# same methods with the same version of faker are called
Faker.seed(0)
# locale
fake = Faker("en_CA")

schema=[
    "Member_ID",
    "Role",
    "User_Name",
    "First_Name",
    "Last_Name",
    "Birth_Date",
    "SIN",
    "Pronounce",
    "Dream_Job",
    "Start_Date",
    "Phone_Number",
    "Mailing_Address",
    "Office_Address",
]

prefix_mID = 'MID'
pronouce_choices = [("He/Him"), ("She/Her"), ("They/Them")]
# roles and their percentages during data generation
role_choices = OrderedDict([
    ("Director", 0.05), 
    ("Music Composer", 0.15), 
    ("Background Artist", 0.20), 
    ("Character Design", 0.30), 
    ("Voice Acting", 0.30)
])
office_choices = OrderedDict([
    ("Toronto", 0.60), 
    ("North Bay", 0.30), 
    ("Kingston", 0.10), 
])
data = []
for row in range(NUMBER_OF_ROWS):
    data.append(
        (
            prefix_mID + str(fake.unique.random_int(min=111111, max=999999)),
            fake.random_element(role_choices),
            fake.user_name(),
            fake.first_name(),
            fake.last_name(),
            fake.date_of_birth(minimum_age=18, maximum_age=65),
            fake.ssn(),
            fake.random_element(pronouce_choices),
            fake.job(),
            fake.date_between(start_date='-10y',end_date='-1d'),
            fake.phone_number(),
            fake.address(), 
            "{}, {} ON {}".format(
                fake.street_address(), 
                fake.random_element(office_choices), 
                fake.postcode(),         
            ),
        )
    )
df = spark.createDataFrame(schema=schema,data=data)
display(df)

```

### Other Options for Creating Synthetic Data

The Python library [dbldatagen](https://pypi.org/project/dbldatagen/)
from Databricks labs can also generate data and it works with a Spark
dataframe and good for streaming data.

[Synethic Data Vault (SDV)](https://sdv.dev/) can look at existing real
data, its patterns, and data quality to create synthetic data from the
patterns.

## Viewing Data

The Databricks visualization editor can be used to view data fields or
use Python to query the dataframes.

## See Also

### Resources

- [Databricks Academy -
  Training](https://www.databricks.com/learn/training/login)
