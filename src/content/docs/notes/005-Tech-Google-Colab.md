---
filetags: ":google:colab:epubnote:"
id: 30915df2-3cb0-4109-9151-816d6638065f
title: Google Colaboratory
---

## Overview and Use Case

Google Colab or "Colaboratory" is good for students, data scientists,
and AI researchers and also for running Python programs in a cloud
environment which can be shared with others allowing collaboration.
Machines are automatically setup and provide different CPU, memory,
graphicals processing unit (GPU) features. Machines also include common
Python data science libraries.

## Example Getting Started

``` python

import pandas as pd

last_names = ['Connor', 'Connor', 'Reese']
first_names = ['Sarah', 'John', 'Kyle']
df = pd.DataFrame({
  'first_name': first_names,
  'last_name': last_names,
})
df

```

first<sub>name</sub> last<sub>name</sub> 0 Sarah Connor 1 John Connor 2
Kyle Reese

## Running commands and installing programs

Google Collab support running shell commands for example to install
modules, install programs. Example is from [Free Ollama GPU -
Reddit](https://www.reddit.com/r/ollama/comments/1k674xf/free_ollama_gpu/)

If using a GPU, change the runtime type to include a GPU/TPU

``` shell

# Run in Google Colab
!curl -fsSL https://molodetz.nl/retoor/uberlama/raw/branch/main/ollama-colab-v2.sh | sh

# It will execute this script on the machine
# Install Ollama.
curl -fsSL https://ollama.com/install.sh | sh

# Start Ollama on the background.
nohup ollama serve > ollama.log 2>&1 &

# Wait a second.
sleep 2

# Your model.
ollama pull qwen2.5-coder:14b

# ... other shell commands like pip installs, uv tool
pip install polars
uv --help

```
