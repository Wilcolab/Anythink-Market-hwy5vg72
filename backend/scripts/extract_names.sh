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

# Get the absolute path to the input CSV file
input_csv_file="$(realpath "$input_csv_file")"

# Output file to store the results
output_txt_file="$(dirname "$input_csv_file")/output_names.txt"

# Remove output file if it already exists
if [ -f "$output_txt_file" ]; then
    rm "$output_txt_file"
fi

# Skip the header line in the CSV file
tail -n +2 "$input_csv_file" | while IFS=',' read -r id last_name first_name email _ _; do
    full_name="$first_name $last_name"
    echo "$full_name"
    echo "$full_name" >> "$output_txt_file"
done

# Check if the output file was successfully created
if [ ! -f "$output_txt_file" ]; then
    echo "Error: Failed to create the output file: $output_txt_file"
    exit 1
fi

# Display a success message and the contents of the output file
echo "Extraction completed. Results stored in $output_txt_file."
cat "$output_txt_file"
