#!/bin/bash
# Usage: scripts
set -x
set -e

if [ $# -eq 0 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

input_file="$1"
output_file="output_names.txt"  

# Function to extract names in the format "first name last name" from the spreadsheet input file
extract_names() {
 awk -F ',' 'NR > 1 { gsub(/^[[:space:]]+|[[:space:]]+$/, "", $2); gsub(/^[[:space:]]+|[[:space:]]+$/, "", $3); print $3, $2; }' "$input_file" | tee "$output_file"
}

# Execute the extraction function
extract_names

echo "Names extracted from '$input_file' and saved to '$output_file'."
