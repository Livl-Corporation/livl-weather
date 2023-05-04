#!/bin/bash

# Check if file argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# File argument
file=$1

# Extract columns from file using cut command and override the original file
cut -d';' -f1,2,3,7,8,10,11,12,21,22,26,28,36,43 $file > temp_file.csv
mv temp_file.csv $file

echo "Columns extracted and saved to $file"
