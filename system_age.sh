#!/bin/bash

# Get the current date
current_date=$(date +%Y-%m-%d)

# Get the modification date of /root directory
# The output of stat is formatted as YYYY-MM-DD
root_mod_date=$(stat -c %y /root | cut -d' ' -f1)

# Calculate the difference in seconds
difference_in_seconds=$(( $(date -d "$current_date" +%s) - $(date -d "$root_mod_date" +%s) ))

# Calculate the total days and hours
total_days=$(( difference_in_seconds / 86400 ))

# Print the result
echo "$total_days days"
