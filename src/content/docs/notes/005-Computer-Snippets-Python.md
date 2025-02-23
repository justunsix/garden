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

### Jupyter

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
