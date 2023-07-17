#!/usr/bin/env bash
#
# Usage: scripts
set -x
if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"
output_file="output_names.txt"

# Check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Error: Input file '$input_file' not found."
  exit 1
fi

# Function to extract names in the format "first name last name" from the input file
extract_names() {
  awk 'NR > 2 { print $3, $2 }' "$input_file" > "$output_file"
}

# Execute the extraction function
extract_names

echo "Names extracted from '$input_file' and saved to '$output_file'."