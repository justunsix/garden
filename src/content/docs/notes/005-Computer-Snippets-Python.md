---
filetags: ":snippets:python:tech:epubnote:"
id: b775ff13-9b5b-4af4-9c2b-e98be0af5fdc
title: Python Snippets
---

## Command Line Snippets

``` shell

# Active an environment
## Linux Ubuntu
bash
python3 -m virtualenv ./venv
source ./venv/bin/activate
pip install -r requirements.txt
python3 mypythonprogram.py
## or use conda instead

## Windows (PowerShell)
python -m venv ./venv
./venv/Scripts/Activate
pip install -r .\requirements.txt
python mypythonprogram.py

## Upgrade a package
python3 -m pip install --upgrade pip
python3 -m pip install --upgrade ansible
## Upgrade a package as user
python3 -m pip install --user --upgrade pip
## List installed packages
python3 -m pip list

## Install applications with pipx
pipx install ansible
## or
python3 -m pipx install ansible
## Upgrade all pipx packages
pipx upgrade-all

```

## Jupyter notebooks

``` shell

# Start Jupyter Notebook in current directory
jupyter notebook

# Jupyter Notebook - org conversions
## https://michaelneuper.com/posts/replace-jupyter-notebook-with-emacs-org-mode/
## Importing existing Jupyter Notebooks into Org Mode
## Use jupytext (python package) to convert Jupyter Notebooks to Org Mode files:
## Convert your Jupyter Notebook (.ipynb) to an Org Mode file (.org) using the following command:
jupytext --to org my_notebook.ipynb
## Exporting Org files to Jupyter Notebook format
jupytext --to ipynb my_org_file.org

```

## Python Language Snippets

### Basics

``` python

# String
"string3"
print("string1")

# Numbers as:
## Float
3.5
## Integers
2

# String concatenation, adding strings together using +
## Convert a float number to string using str()
print("20 days are " + str(28800) + " minutes")

# Print with f strings
print (f"20 days are {28800} minutes")

# Run operating system shell command
import os
# Call command
os.system('echo "hello world"')

# Define a new function called days_to_units
# function parameter is num_of_days, a local scope variable
def days_to_units_20():
    print(f"20 days are {20 * calculation_to_units} {name_of_unit}")

# Ask users for input and store user's input in a variable
# The input function always returns a string variable
user_input = input("Input a number of days and I will convert it to seconds\n")
print(user_input)

# Conditional checking
# Return number of units in days as string
# Validate input is a positive number
def days_to_units_text_checked(num_of_days):
    # Check if parameter is a positive number
    condition_check = num_of_days > 0
    # Print the data type of the condition_check variable
    print(type(condition_check))
    # Conditional to check if parameter is a positive number and evaluates to a boolean
    # true: parameter is a positive number
    # false: parameter is not a positive number
    if num_of_days > 0:
        return f"{num_of_days} days are {num_of_days * calculation_to_units} {name_of_unit}"
    else:
        return "Enter a positive number, other values or data types are not allowed"

# Exception handling
try:
    # logic
except ValueError:
    print("Error: Your input is not a valid number.")

# While loop
while user_input != "exit":
    user_input = input("Enter number of days that this program will convert to hours or type exit to stop\n")
    validate_and_execute_try_except()

# Create List
list_of_months = ["January", "February", "March"]


# List: Add items
list_of_months.append("April")

# List: Remove items
list_of_months.remove("January")

# List: Change items
list_of_months[0] = "New January"

```

### CSV file operations

``` python

# Read CSV file with pandas
import pandas as pd

csv_file_path = 'your_file.csv'

# Specify the columns you want to read
columns_to_read = ['Column1', 'Column2', 'Column3']  # Replace with your actual column names

# Read the specified columns from the CSV file
data = pd.read_csv(csv_file_path, usecols=columns_to_read)

# Display the data
print(data)

```

## See Also

- [Technology](../600-technology) -
  [Technology](id:9092eabf-f6f5-4775-b8aa-6e78e74880c3)
- [Python PyDay ../2023](005-1-tech-python-pyday2023) - [Python PyDay
  2023](id:f8bc9ba2-948f-4b44-92f8-37bcea837b6e)
- [Python Anaconda and Conda
  Snippets](../005-computer-snippets-python-anaconda) - [Python and
  Anaconda Snippets](id:09101af3-7da0-4433-b8b4-c1df997fcd91)
- [DevOps Bootcamp - Python
  Basics](../005-computer-tech-devops-bootcamp-twn-python-basics) -
  [DevOps Bootcamp - Python
  Basics](id:a5dd45be-10bf-4ab6-8c8f-cb4719c74f1c)
- [DevOps Bootcamp - Python
  Automation](../005-computer-tech-devops-bootcamp-twn-python-automation) -
  [DevOps Bootcamp - Python
  Automation](id:c3dc1f6f-d9c4-4d86-88bc-488e42698f7d)
