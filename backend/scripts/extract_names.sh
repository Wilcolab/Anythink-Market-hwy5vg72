#!/bin/bash
#
# Usage: scripts
set -x

input_file="$1"
output_file="output_names.txt"  
# Function to extract names in the format "first name last name" from the input file
extract_names() {
  awk 'NR > 1 { print $3, $2 }' "$input_file" > "$output_file"
}

# Execute the extraction function
extract_names

echo "Names extracted from '$input_file' and saved to '$output_file'."
