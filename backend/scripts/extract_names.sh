#!/usr/bin/env bash

if [ $# -eq 0 ]; then
  echo "Error: No file provided. Please provide a file as an argument."
  exit 1
fi

input_file="$1"

if [ ! -f "$input_file" ]; then
  echo "Error: File not found: $input_file"
  exit 1
fi

output_file="output_file.txt"

grep -oE '\b[A-Z][a-z]+\b' "$input_file" > "$output_file"

echo "Names extracted from $input_file and saved to $output_file."
