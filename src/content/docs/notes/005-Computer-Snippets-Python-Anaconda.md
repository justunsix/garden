---
filetags: ":snippets:python:tech:epubnote:"
header-includes:
- <link rel="stylesheet" type="text/css" href="basic-org.css"/>
id: 09101af3-7da0-4433-b8b4-c1df997fcd91
title: Python and Anaconda Snippets
---

<link rel="stylesheet" type="text/css" href="basic-org.css"/>

## Conda Package Management

``` bash

# Management Environments
## Create a new environment using requirements.txt file with packages
## where "data-science" is the name of the environment
## --yes : agree to confirmations
### For other packages like pyperclip
conda config --append channels conda-forge
conda create --name "data-science" --file requirements.txt --yes
## Create the environment from the environment.yml file
conda env create -f environment.yml
## Export the environment to a file for sharing / creation later
conda env export > environment.yml
## List all environments
conda env list
## Delete an environment
conda env remove -n "ext" --all

# Install a package
conda install PyYAML

## Install a new package in an environment
conda install -n "data-science" <package-names> --yes

## Activate the environment
conda activate "data-science"
## Deactivate the environment
conda deactivate "data-science"

## Delete an environment and its packages
conda remove -n ENVNAME --all

# Channel: Add conda-forge
# Add the 'conda-forge' channel as a backup to 'defaults'
conda config --append channels conda-forge
# Add other channels
conda config --add channels conda-forge
conda config --add channels microsoft

# Manage packages
## Update and clean all packages in current environment
conda update --all --yes; conda clean --all --yes

## Update all packages in the current environment
conda update --all --yes
## List packages in the current environment
conda list
## Clean up unused packages
conda clean --all --yes

# Upgrade conda itself
conda update -n base conda -c anaconda --yes

# Upgrade Python
## See available Python versions with
conda search --full-name python
## Install a specific version, recommended approach is through a new environment and not the current environment
conda create -n py3d9 python=3.9 anaconda
conda create -n py311 python=3.11
## Update to the latest python in the current branch (e.g. 3.x)
conda update python

## Install a specific version.
## It is not recommended, due to resolver has to work very hard to determine exactly which packages to upgrade
## but command is below
conda install python=3.9

```

## Makefile and Conda activate

``` makefile

PYTHON := python3
CONDA_ACTIVATE = . "/home/justin/miniconda3/etc/profile.d/conda.sh" && conda activate ext
PYTHON_WINDOWS := python
CONDA_ACTIVATE_WINDOWS = /c/Users/justi/scoop/apps/miniconda3/current/condabin/activate.bat ext

```

## Set Conda Proxy

- Create .condarc file and put in \$HOME
- Note there is no http inside the variable values

``` txt

proxy_servers:
    http: 1.1.1.1:3128
    https: 1.1.1.1:3128

```

## See Also

- [Technology](../600-technology) -
  [Technology](id:9092eabf-f6f5-4775-b8aa-6e78e74880c3)
- [Python PyDay ../2023](005-1-tech-python-pyday2023) - [Python PyDay
  2023](id:f8bc9ba2-948f-4b44-92f8-37bcea837b6e)
- [Python Snippets](../005-computer-snippets-python) - [Python
  Snippets](id:b775ff13-9b5b-4af4-9c2b-e98be0af5fdc)
