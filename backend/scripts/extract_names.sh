#!/bin/bash

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

# Remove output file if it already exists
if [ -f "$output_txt_file" ]; then
    rm "$output_txt_file"
fi

# Loop through the CSV file and extract first name + last name
while IFS=',' read -r id last_name first_name email; do
    full_name="$first_name $last_name"
    echo "$full_name"
    echo "$full_name" >> "$output_txt_file"
done < "$input_csv_file"

echo "Extraction completed. Results stored in $output_txt_file."
