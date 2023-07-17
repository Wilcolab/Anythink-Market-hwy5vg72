#!/usr/bin/env bash
set -x
set -e

# Input CSV file provided as the first argument
input_csv_file="$1"


# Output file to store the results
output_txt_file="output_names.txt"

# Extract the first name and last name from the CSV file using awk and sed
awk -F',' 'NR > 1 {print $3 " " $2}' "$input_csv_file" > "$output_txt_file"

# Display a success message and the contents of the output file
echo "Extraction completed. Results stored in $output_txt_file."
cat backend/scripts/output_names.txt

exit 0