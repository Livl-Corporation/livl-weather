#!/bin/bash

# Check if file argument is provided
if [ $# -ne 1 ]; then
  echo "Usage: $0 <file>"
  exit 1
fi

# File argument
file=$1

# Extract columns from file using cut command and override the original file, excluding the first line
tail -n +2 $file | cut -d';' -f6 | sort | uniq > regions.csv

echo "Regions extracted and saved to regions.csv"
