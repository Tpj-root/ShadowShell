#!/bin/bash

# Define the software list file
software_list_file="software_list.txt"

# Function to check and install software
install_software() {
    # Read the software list file line by line
    while IFS= read -r software; do
        # Skip empty lines or lines that start with '#'
        if [[ -z "$software" || "$software" =~ ^# ]]; then
            continue
        fi

        # Check if software is installed
        if ! command -v "$software" &>/dev/null; then
            echo "$software is not installed. Installing..."
            sudo apt-get update && sudo apt-get install -y "$software"
        else
            echo "$software is already installed."
        fi
    done < "$software_list_file"
}

# Call the function to check and install software
install_software

