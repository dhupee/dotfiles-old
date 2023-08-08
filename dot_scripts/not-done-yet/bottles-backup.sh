#!/bin/bash

# Set the path string
path="${HOME}/.var/app/com.usebottles.bottles/data/bottles/bottles/UbiLembut/bottle.yml"

# Extract the last part of the path using 'basename'
filename=$(basename "$path")

# Extract the part before the last slash (/) to get the desired string
directory=$(dirname "$path")

# Extract the part after the last slash (/) to get the 'UbiLembut' part
desired_string=${directory##*/}

echo "Desired string: $desired_string"
