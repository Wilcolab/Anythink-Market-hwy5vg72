#!/bin/bash

# Check if the correct number of arguments is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <input_csv_file>"
  exit 1
fi

# Input CSV file provided as an argument
input_csv_file=$1

# Check if the input file exists
if [ ! -f "$input_csv_file" ]; then
  echo "Error: Input file not found!"
  exit 1
fi

# Output file to store the extracted names
output_txt_file="output_names.txt"

# Extract first and last names from the CSV file and log to console
awk -F',' '{print $3, $2}' "$input_csv_file" | tee "$output_txt_file"

echo "Names extracted and stored in $output_txt_file."