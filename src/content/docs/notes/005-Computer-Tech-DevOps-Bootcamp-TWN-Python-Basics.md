---
filetags: ":python:devops:nana:epubnote:"
id: a5dd45be-10bf-4ab6-8c8f-cb4719c74f1c
title: DevOps Bootcamp - Python Basics
---

Source: My personal notes from DevOps course by TechWorld with Nana

## Overview

- Programming basics

  - Data types
  - Lists
  - Variables and functions
  - Accept user input
  - Input validation, conditionals
  - Error handling
  - Loops
  - Modules using and creating
    - Date time
    - Packages
  - Project
  - Object oriented programming, classes
  - API requests to GitLab

- Automation

- Why learn programming?

- As of 2023, Python is the most popular language. For web development,
  data science, machine learning, and automation.

## Introduction to Python

Python is a programming language. Its advantages are:

- Simple syntax
- Easy to set up
- Large ecosystem: many libraries and users
- Flexible: not limited to language specifics, can be used many purposes

### What is Python used for?

Use cases:

- Web development
- Data science
- Machine learning
- Artificial intelligence (AI)
  - e.g. voice, face recognitions
- Web scraping
- Automation
  - Modules for CI/CD, cloud, monitoring
  - Automate general tasks
    - Working with Excel sheets
- Mobile, game and desktop development (though less common)

### Why Python as a DevOps engineer?

- It is common requirements for DevOps jobs
- DevOps works with many tools and combine them
  - Examples:
    - Update Jira ticket after Jenkins build
    - Trigger Jenkins jobs on events
    - Send notifications to people on events
    - Monitoring
    - Scheduled tasks
    - Data visualizations
    - Custom Ansible modules
    - Backups
    - Clean up old docker images
  - Any repetitive tasks - more automations and less manual
  - Automation scripts and programs for your teams

## Installation and Local Setup

- Example install
  - Download from
    [https://www.python.org/downloads/](https://www.python.md/downloads/)
    for your operating system
  - Add python to your path
  - Make sure you use Python version 3+

### PyCharm

- Install PyCharm IDE: <https://www.jetbrains.com/pycharm/download/>

- Start Pycharm

- Create new project

  - Select appropriate location or use default
  - Note use of python interpreter - it knows the python code and
    translates to computer instructions
  - One `main.py`

## Our first Python Program

- Print commands

## Python IDE vs Simple File Editor

- Integrated Development Environment (IDE) helps with writing code and
  output
  - Write and run right away
    - Syntax highlights
    - Autocompletion
  - Common interface: Navigation, write code, execution context
- Simple file editor
  - Edit code in file in editor
  - Run code like `python main.py`

## Strings and Number Data Types

- Strings can be surrounded by single or double quotes. They are the
  same
- Numbers can be integers (numbers with decimal places) and floats
  - Numbers can be used in calculations
- Strings can be combined (called concatenation) and using for output

``` python

#"string2"
#'string3'
print("string1")

# Numbers as:
## Float
3.5
## Integers
2
print(2)

# Print number of minutes in 20 days
print(20 * 24 * 60)

# String concatenation, adding strings together using +
## Convert a float number to string using str()
print("20 days are " + str(28800) + " minutes")

# f strings (Python 3 only, does not work in python 2)
## Better string formatting is using f strings and { }
## Brackets show where to insert the value
## Note the f before the string
print (f"20 days are {28800} minutes")
## Do calculation with string
print (f"20 days are {20 * 24 * 60} minutes")

```

## Variables

- Variables are containers to store values
- Python is dynamically typed vs statically typed where variables' type
  is defined and fixed
- Python naming convention is to use lowercase and underscore to
  separate words like `my_variable`
  - Variables must avoid reserved words in Python
  - Use descriptive names, like type of value, what it is used for

``` python

# Using example from above, let's use
# variables to store values and
# easily change the values throughout a program

# Number of units in a day
## Integer variable
calculation_to_units = 24 * 60 * 60
## String variable
name_of_unit = "seconds"

print (f"35 days are {35 * calculation_to_units} {name_of_unit}")

```

## Functions

- Functions are blocks of code that can be reused

  - Look at duplicated variable usage and statements
  - Avoid repeating the same logic
  - Only runs when called
  - Functions can take in parameters
    - Parameters are variables inside the function
    - If a parameter is not given, but one a function needs one, the
      python interpreter will tell us a argument (parameter) is missing
    - There can be as many parameters as needed 0 to more
  - Function body is the code inside the function
    - Variables created in the function body are local scoped and can be
      used in the function

- Define function with `def` keyword like `def days_to_units():`

- Variables can be scoped - where is the variable defined and can be
  used

  - Global scope = variables available from anywhere like in main
    program and functions
  - Local scope = variables only available in a function

``` python

##############################################################
# String/number data types, variables, functions, parameters #
##############################################################

# Number of units in a day
# Integer variable, global scope variable
calculation_to_units = 24 * 60 * 60
# String variable
name_of_unit = "seconds"


def days_to_units_20():
    print(f"20 days are {20 * calculation_to_units} {name_of_unit}")


# Define a new function called days_to_units
# function parameter is num_of_days, a local scope variable
def days_to_units(num_of_days: object, custom_message: object) -> object:
    print(f"{num_of_days} days are {num_of_days * calculation_to_units} {name_of_unit}")
    print(custom_message)


def scope_check(number_of_days):
    my_local_variable = "variable inside function"
    print(my_local_variable)
    print(calculation_to_units)
    print(number_of_days)

# Call functions to see number of seconds in days
days_to_units_20()
days_to_units(20, "Awesome!")
days_to_units(110, "Nice!")

scope_check(54)

```

## Accepting User Input

- Have a program accept user input and use it
- Ask user for input using `input()` built in function
- An expression is a combination of values, variables, operators, and
  calls to functions that evaluates to a value
- Casting: convert one data type to another
  - `int()` converts to integer
  - `float()` converts to float
  - `str()` converts to string

``` python

#########
# Input #
#########


# Return number of units in days as string
def days_to_units_text(num_of_days):
    return f"{num_of_days} days are {num_of_days * calculation_to_units} {name_of_unit}"

# Ask users for input and store user's input in a variable
# The input function always returns a string variable
user_input = input("Input a number of days and I will convert it to seconds\n")
print(user_input)

# To use the user_input as a number
# use casting, call the int function to convert the string to an integer
user_input_number = int(user_input)

calculated_value = days_to_units_text(user_input_number)
print(calculated_value)

```

## Conditionals (if / else) and Boolean Data Type

- When users input values, programs must validate input is valid and
  will not crash or cause problems in the program

- Validate user input for:

  - It makes sense
  - Will not cause errors or crash program
  - It is secure

- Conditionals evaluate to true or false on statements

  - They use comparison operators in Python:
    - != not equal
    - == equal
    - =\< less than or equal
    - =\> greater than or equal
    - \< less than
    - \> greater than

- Conditionals evaluate to a boolean that is `True` or `False`

  - Use `if` , `else =, =elif` keywords

- Use `type()` function to check the data type of a variable

- Functions can be nested meaning a function can call another function

  ``` python

  ###################################################
  # Conditionals (if / else) and Boolean Data Type  #
  # Input validation                                #
  ###################################################


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


  checked_calculated_value = days_to_units_text_checked(user_input_number)
  print(checked_calculated_value)


  # Additional checking
  # Return number of units in days as string
  # Validate input is a positive number
  def days_to_units_text_checked(num_of_days):
    # Check if parameter is a positive number
    # assumes num_of_days is an integer data type
    condition_check = num_of_days > 0

    # Print the data type of the condition_check variable
    print(type(condition_check))
    # Conditional to check if parameter is a positive number and evaluates to a boolean
    # true: parameter is a positive number
    # false: parameter is not a positive number
    if num_of_days > 0:
        return f"{num_of_days} days are {num_of_days * calculation_to_units} {name_of_unit}"
    elif num_of_days == 0:
        return "You entered a 0. Enter a positive number"
    else:
        return "You entered a negative or other data type. Enter a positive number."


  # Validate input is an integer
  # isdigit() method returns True if all characters in a string are digits
  if user_input.isdigit():
      user_input_number = int(user_input)
      checked_calculated_value = days_to_units_text_checked(user_input_number)
      print(checked_calculated_value)
  else:
      print("Your input is not a valid number. Enter a positive number.")

  ##################
  # Cleaned up Code


  def validate_and_execute():
      if user_input.isdigit():
          user_input_number = int(user_input)
          if user_input_number > 0:
              checked_calculated_value = days_to_units_text_validated(user_input_number)
              print(checked_calculated_value)
          elif user_input_number == 0:
              return "You entered a 0. Enter a positive number"
      else:
          print("Your input is not a valid number. Enter a positive number.")


  # Return number of units in days as string
  # Parameter num_of_days must be a postive integer
  def days_to_units_text_validated(num_of_days):
      return f"{num_of_days} days are {num_of_days * calculation_to_units} {name_of_unit}"


  validate_and_execute()

  ```

## Error Handling with Try-Except

- Error handling prevents programs from crashing

- Try-Except catches any failures, capture the error and handle it in
  the program

- Allows program to catch all possible errors

- Use `try` and `except` keywords in a block. Other languages use
  try-catch block

- Error type can be specified for all types (type is not specified)

  ``` python

      ##################################
      # Error Handling with Try-Except #
      ##################################

  def validate_and_execute_try_except():
      try:
          user_input_number = int(user_input)
          if user_input_number > 0:
              calculated_value = days_to_units_text_validated(user_input_number)
              print(calculated_value)
          elif user_input_number == 0:
              print("You entered a 0. Enter a positive number")
          else:
              print("You entered a negative number. Enter a positive number.")
      except ValueError:
          print("Error: Your input is not a valid number.")


  validate_and_execute_try_except()

  ```

## While Loops

- Loops do the same thing (programming logic) multiple times
- Python has 2 loop commands: `while` and `for`
  - Loops use conditions which evaluate to `True` or `False`. Note
    Python capitalizes the booleans.
  - Loops check the condition to determine whether to do the logic

``` python

###############
# While Loops #
###############

# Prepare user's input variable
# for while loop evaluation
user_input = ""
# Run continously until user inputs exit
while user_input != "exit":
    user_input = input("Enter number of days that this program will convert to hours or type exit to stop\n")
    validate_and_execute_try_except()

```

## Lists and For Loops

- Lists are a collection of things like values
- Lists store multiple items in a single variable
- Lists are a Python data type and can store different data types like:
  - Strings
  - Integers
  - Float
  - Boolean (True or False)
- Example list of integers: `list_of_random_integers = [1, 3, 4, 5, 6]`

``` python

# Basic list operations:
# Create
list_of_months = ["January", "February", "March"]

# Access items of list, Get first item (January)
# with index 0
# when accesing index out of range, you will get an
# index out of range error
print(list_of_months[0])

# Add items
list_of_months.append("April")

# Remove items
list_of_months.remove("January")

# Change items
list_of_months[0] = "New January"

print(list_of_months)

```

- `For` loop is used to go over a number of items
  - It can be each to go over each item in a list

``` python

#######################
# Lists and For Loops #
#######################

# Allow user to provide a list of values
# Validate all values and return calculation


```

## Comments

- Comments give yourself and people looking at it notes about the code:
  - Help explain code
  - Comment out code that is not needed or should not be executed and
    may have been used for testing, debugging, and exploring options
- Single line comments in Python start with `#`
- Multiline comments in Python start and end with `"""`
- Good practice is to minimize comments and write code that can explain
  itself

## Sets

## Built-In Functions

## Dictionary Data Type

The final project file can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/13-programming-with-python/days-to-units>

## Modules

The project files used in this lecture can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/13-programming-with-python/modules>

## Project: Countdown App

The project files for this lecture can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/13-programming-with-python/countdown-project>

## Packages, PyPI and pip

## Project: Automation with Python (Spreadsheet)

The project files used in this lecture can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/13-programming-with-python/automation-inventory-project>

## OOP: Classes and Objects

The project files can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/13-programming-with-python/classes-and-objects>

## Project: API Request to GitLab

The files used in this project can be found here:
<https://gitlab.com/twn-devops-bootcamp/latest/13-programming-with-python/gitlab-api-request>

## See Also

- [Python](../005-1-tech-python) -
  [Python](id:60afaf50-cb45-44be-b9f3-2e7c951ebc5a)
- [Python Snippets](../005-computer-snippets-python) - [Python
  Snippets](id:b775ff13-9b5b-4af4-9c2b-e98be0af5fdc)
