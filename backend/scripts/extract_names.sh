#!/usr/bin/env bash
set -x
set -e
# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <input_csv_file>"
    exit 1
fi

# Input CSV file provided as the first argument
input_csv_file="$1"

# Check if the input file exists
if [ ! -f "$input_csv_file" ]; then
    echo "Error: Input file not found: $input_csv_file"
    exit 1
fi

# Output file to store the results
output_txt_file="output_names.txt"

# Extract the first name and last name from the CSV file using awk and sed
awk -F',' 'NR > 1 {print $3 " " $2}' "$input_csv_file" > "$output_txt_file"

# Display a success message and the contents of the output file
echo "Extraction completed. Results stored in $output_txt_file."
cat backend/scripts/output_names.txt

