#!/usr/bin/env bash
set -x
set -e

# Input CSV file provided as the first argument
input_csv_file="$1"


# Output file to store the results
output_txt_file="output_names.txt"

# Filter lines with email ending in 'amazon.com' (case-insensitive) and extract first name and last name
awk -F',' 'NR > 1 && tolower($4) ~ /@amazon\.com$/ {print $3 " " $2}' "$input_csv_file" > "$output_txt_file"

# Display a success message and the contents of the output file
echo "Extraction completed. Results stored in $output_txt_file."
cat "$output_txt_file"
exit 0