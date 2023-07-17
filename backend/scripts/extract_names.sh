#!/bin/bash
#
# Usage: scripts
set -x

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"
output_file="/path/to/output_names.txt"  # Replace "/path/to" with the actual path to the desired output file location.

# Function to extract names in the format "first name last name" from the input file
extract_names() {
  awk 'NR > 1 { print $3, $2 }' "$input_file" > "$output_file"
}

# Execute the extraction function
extract_names

echo "Names extracted from '$input_file' and saved to '$output_file'."
