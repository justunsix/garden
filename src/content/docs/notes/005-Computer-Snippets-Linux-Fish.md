---
filetags: ":snippets:fish:epubnote:"
id: b8c0b8a1-f1ed-4f17-bf4b-8c03498760ff
title: Fish Shell Snippets
---

[Source: Fish
Tutorial](https://fishshell.com/docs/current/tutorial.html)

``` bash

# Open Help
help

# Open fish shell configuration web interface
fish_config

# Set a prompt
fish_config prompt choose informative_vcs

# Find value of variable
echo My home directory is $HOME

# Set value of variable, the quotes ensure the variable name is one string
set name 'John Doe'
echo $name

# Remove variable
set -e name

# Export variable to be used by external commands
set -x MyVariable SomeValue
env | grep MyVariable
# Note if fish is started by something else, it inherits the environment variables from the parent's exposed variables (e.g. bash)

# Unexport variable
set -u MyVariable

# View PATH which can have multiple values and are a list
echo $PATH
# Get length of a list with the name PATH
count $PATH
# Append to a list by setting the list to itself
set PATH $PATH ~/bin
# Access individual elements for the list
echo $PATH[1]

# Separate commands with ; or new lines
sudo apt upgrade; sudo apt update

sudo apt upgrade
sudo apt update

# Search history
history search [SEARCH_STRING ...]

# Delete a history containing a specific 'substring'
history delete --contains substring
# also
history delete -c substring

# Print Working Directory
pwd

# Navigate to recent directories
cdh

# Move backward in directory history
prevd

# Move forward in directory history
nextd

# Combine commands with &&
./configure && make && sudo make install
# fish also support and, or, and not
cp file1 file1_bak && cp file2 file2_bak; and echo "Backup successful"; or echo "Backup failed"

```

## See Also

### Resources

[Tutorial](https://fishshell.com/docs/current/tutorial.html) and
[interactive
use](https://fishshell.com/docs/current/interactive.html#interactive-use)
for more:

- if else
- Functions
- while true loops
- fish configuration
  - autoloading functions
- Interactive
  - Autosuggestions and completions
  - Writing your own completions
  - Syntax highlighting
  - Abbreviations = aliases
  - Key bindings and custom keybindings
