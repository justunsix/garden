---
filetags: ":bash:snippets:epubnote:"
id: 157bbbb3-97c0-45b4-8f72-bbf0d1e3a934
title: Bash Snippets
---

``` shell

# Indicate use of bash in shell script
#!/usr/bin/env bash

# Variables

# Set environment variable
export EDITOR="nvim"

# Set variable
video_files_dir="/home/user/my-videos"

# Reuse last argument with $_
mkdir mydir && cd $_
# Will create a directory and then change to it

# Execute last command with !!
apt install vim
sudo !!

# Conditionals

# Or
if [ condition1 ] || [ condition2 ]; then
  #Code to execute if either condition1 or condition2 is true
fi

# And
if [ condition1 ] && [ condition2 ]; then
  #Code to execute if both condition1 and condition2 are true
fi

# Not
if ! [ condition ]; then
  #Code to execute if the condition is false
fi

# Check if a file exists before doing something
if [ -f ~/.bash_aliases ]; then
  . ~/.bash_aliases
fi
# -f - check for file
# -d - check for directory

# Check if a command exists before using it
if command -v carapace &>/dev/null; then
  export CARAPACE_BRIDGES='zsh,fish,bash,inshellisense' # optional
  # source a script
  source <(carapace _carapace)
fi

# Parse arguments
if [ "$1" = "--help" ] || [ "$1" = "-h" ]; then

  echo "My help text"
  echo "--all: my flag text"
  exit

elif [ "$1" = "--all" ]; then
  # do --all stuff
fi

# Functions

# Create a function and set local to function variables
jt-up() {
  # local variables
  # Go up a number of directories in the function argument
  local d=""
  local limit="$1"

  # Default to limit of 1
  if [ -z "$limit" ] || [ "$limit" -le 0 ]; then
    limit=1
  fi

  for ((i = 1; i <= limit; i++)); do
    d="../$d"
  done

  # perform cd. Show error if cd fails
  if ! cd "$d"; then
    echo "Couldn't go up $limit dirs."
  fi
}

# Check arguments passed to a function or script
download_yt_dlp() {
  local to_download="downloads.txt"
  # Case statement on different arguments
  case "$1" in
  "720")
    yt-dlp -S "res:720" -a "$to_download"
    ;;
  "480")
    yt-dlp -s "res:480" -a "$to_download"
    ;;
  "--check-link")
    # Change directory or exit or there is a problem going to directory
    cd "/path/to/my-videos" || exit
    echo "Retrieving link from first clipboard item"
    # -o output
    # Set a variable from output of a command
    link=$(xsel -ob)
    yt-dlp -F "$link"
    ;;
  *)
    yt-dlp -a "$to_download"
    ;;
  esac
}

# Read user input
read -r -p "Enter input: " input
# Use input
echo $input

# Read secret user input
read -rs -p "Enter password: " PASSWORD
# -r do not allow backslashes to escape any characters
# -s hide input
# -p print the prompt

# Commands

# Create directory and any parent folders needed, do not give error if directories exist
mkdir -p /path/to/new-dir

# Use output of command
vim $(fzf)

# Job, Bring background job back up
fg

# Job, move application to background
# Press Ctrl + z

# Formatting printing, like with new lines
printf "\nCopied data to $folder"

```
