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
python -m pip install --upgrade pip
python -m pip install --upgrade ansible
## Upgrade a package as user
python -m pip install --user --upgrade pip
## List installed packages
python -m pip list

## Install applications with pipx command
pipx install ansible
## or
python -m pipx install ansible
## Upgrade all pipx packages
pipx upgrade-all

# See Docstrings of module using pydoc
python -m pydoc math
# See as HTML
python -m pydoc -w math

```

## Python Language Snippets

### Basics

``` python

############################
# Comments and Doc Strings #
############################

# This sentence is a comment
"""
This sentance is a
multi line
comment
"""

# Multiline strings with ''' or """
multiline_string = '''This is a
multiline
string.'''
print(multiline_string)

# Simple Docstring, can be for modules, classes, functions
def determine_magic_level(magic_number):
    """
    Multiply a wizard's favorite number by 3 to reveal their magic level.
    """
    return magic_number * 3

def picking_hat():
    """Return a random house name."""
    houses = ["Gryffindor", "Hufflepuff", "Ravenclaw", "Slytherin"]
    return random.choice(houses)

# See Docstring of a module, function
import math
print(math.__doc__)
print(math.acos.__doc__)
help(math)

# Docstring example using reStructuredText (PEP 287 defaut)
# Other Docstring types are available like NumPy style common
# for data science, Google-style, and doctest that combines
# tests with documetation
def cast_spell(wand, incantation, target=None):
    """
    Cast a magical spell using a wand and incantation.
    This function simulates casting a spell. With no
    target specified, it is cast into the void.

    :param wand: The wand used to do the spell-casting deed.
    :type wand: str
    :param incantation: The words said to activate the magic.
    :type incantation: str
    :param target: The object or person the spell is directed at (optional).
    :return: A string describing the result of the spell.
    :rtype: str

    :raises ValueError: If the incantation is unknown or the wand fails to work.
    """
    valid_incantations = ["Lumos", "Alohomora", "Expelliarmus"]
    if not wand:
        raise ValueError("You can't cast spells without a wand!")
    if incantation not in valid_incantations:
        raise ValueError("Incantation not recognized.")
    if target:
        return f"{incantation} hits {target} with magic speed!"
    return f"{incantation} is cast into the void...sparkles shimmer faintly"

##############
# Data Types #
##############

# String
"string3"
print("string1")

# Numbers as:
## Float
3.5
## Integers
2

############################
# Print and with f strings #
############################

# String concatenation, adding strings together using +
## Convert a float number to string using str()
print("20 days are " + str(28800) + " minutes")

# Print a string with format f string for variables
print (f"20 days are {28800} minutes")

# Print a value
print(f"value={value}")
# Print a value concisely
print(f"{value=}")

######################################
# Run operating system shell command #
######################################

import os
# Call command
os.system('echo "hello world"')

#################################
# Functions, Built-in Functions #
#################################

# Show Pythong executable being used
import sys
print(sys.executable)

# Print a calculation
# Define a new function called days_to_units
# function parameter is num_of_days, a local scope variable
def days_to_units_20():
    print(f"20 days are {20 * calculation_to_units} {name_of_unit}")

# Get user input
# Ask users for input and store user's input in a variable
# The input function always returns a string variable
user_input = input("Input a number of days and I will convert it to seconds\n")
print(user_input)

# Create a set from a list
set(my_list)

# Convert to integer
int("20")

# Call built-in function on data type
## String split function
"2, 3".split()
## List count
[1, 2, 3].count()

########################
# Conditionals, Errors #
########################

# Conditional checking, Function
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

# Exception handling with try except, like catching exceptions
try:
    # logic
except ValueError:
    print("Error: Your input is not a valid number.")

# Check string is not None to validate it has a value
if cog_endpoint is not None and cog_key is not None:
    # Use strings

##############
# While Loop #
##############

# While loop
while user_input != "exit":
    user_input = input("Enter number of days that this program will convert to hours or type exit to stop\n")
    validate_and_execute_try_except()

#########
# Lists #
#########

# List: Create
list_of_months = ["January", "February", "March"]

# List: access specific value in list, in this case first element
list_of_months[0]

# List: Add items
list_of_months.append("April")

# List: Remove items
list_of_months.remove("January")

# List: Change items
list_of_months[0] = "New January"

# String split on a comma to a list
my_list = my_string.split(",")

# Get data type, for example class type
type(my_variable)

############
# For loop #
############

# Allow user to provide a list of values
# Validate all values and return calculation
for num_of_days_elements in user_input.split(", ")
  validate_and_execute

########
# Sets #
########

# Set: Apply set to a given list
list_of_months = ["January", "February", "March", "January"]
# Set will only contain first 3 months, duplicate January is removed
set(list_of_months)

# Set: Create set
my_months_set = {"January", "February", "March"}

# Set: Add element
my_months_set.add("April")

# Set: Remove element
my_months_set.remove("April")

# Opening a file
with open(file_path, "r" encoding="utf-8") as file:
    # do stuff with text file
# Open file and print content
# Supports read, append, write, create and opening text or binary files
f = open("demofile.txt", "r")
print(f.read()

#############################################
# Switch / Case statement with match, case  #
#############################################

match term:
    case pattern-1:
         action-1
    case pattern-2:
         action-2
    case "pattern-3":
         print("action-3")
    case _:
        action-default


```

Sources:

- [How to Write Docstrings - Real
  Python](https://realpython.com/how-to-write-docstrings-in-python/)
- [DevOps Bootcamp - Python
  Basics](../005-computer-tech-devops-bootcamp-twn-python-basics) -
  [DevOps Bootcamp - Python
  Basics](id:a5dd45be-10bf-4ab6-8c8f-cb4719c74f1c)

\-[ DevOps Bootcamp - Python
Automation](../005-computer-tech-devops-bootcamp-twn-python-automation) -
[DevOps Bootcamp - Python
Automation](id:c3dc1f6f-d9c4-4d86-88bc-488e42698f7d)

## Other Packages

### Jupyter notebooks

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

For Jupyter and notebook use in Emacs org-mode, see [Emacs Org Mode
Snippets](../005-computer-snippets-emacs-org-mode) - [Emacs Org Mode
Snippets](id:4a735bbe-5abd-434a-8387-df414685c341)

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

### String Operations

``` python

# Regular expressions replacements
import re
def remove_year(text):
    # This regex matches any year in parentheses, e.g., (2003), (1999), etc.
    return re.sub(r"\s*\(\d{4}\)", "", text)

# String replace in loop or alone
def clean_string(string_to_clean):

    string_cleaned = string_to_clean.trim()
    # Set of things to replace
    replacements = {
        "   4.00": "",
        "   4.50": "",
        "   3.13": "",
        "   4.25": "",
        "   2.50": "",
        "   4.75": "",
    }
    for original, replacement in replacements.items():
        string_cleaned = string_cleaned.replace(original, replacement)

    # Replace newlines with two empty spaces
    return string_cleaned.replace("\n", "  ")

```

### HTTP Requests

1.  REST API Endpoint operations GET, POST, PUT, PATCH, DELETE

    ``` python

    # Make a get to an API, retrieve data
    import requests
    api_url = "https://jsonplaceholder.typicode.com/todos/1"
    response = requests.get(api_url)
    response.json()
    # {'userId': 1, 'id': 1, 'title': 'delectus aut autem', 'completed': False}
    ## Check status code and content type
    response.status_code
    response.headers["Content-Type"]

    # Make a post, use json input and set headers, set data
    import requests
    api_url = "https://jsonplaceholder.typicode.com/todos"
    todo = {"userId": 1, "title": "Buy milk", "completed": False}
    headers =  {"Content-Type":"application/json"}
    # Serialize the todo json with json.dumps()
    response = requests.post(api_url, data=json.dumps(todo), headers=headers)

    # Make a put, update data
    import requests
    api_url = "https://jsonplaceholder.typicode.com/todos/10"
    response = requests.get(api_url)
    response.json()

    todo = {"userId": 1, "title": "Wash car", "completed": True}
    response = requests.put(api_url, json=todo)
    response.json()

    # Do a delete
    import requests
    # Include ID of item being deleted
    api_url = "https://jsonplaceholder.typicode.com/todos/10"
    response = requests.delete(api_url)
    response.json()
    response.status_code

    ```

    Sources: [API Integration in Python - Real
    Python](https://realpython.com/api-integration-in-python/)

## See Also

- [Technology](../600-technology) -
  [Technology](id:9092eabf-f6f5-4775-b8aa-6e78e74880c3)
- [Python PyDay 2023](../005-1-tech-python-pyday2023) - [Python PyDay
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
