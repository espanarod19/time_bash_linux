#!/bin/bash

date_string="2023-08-29 23:03:08"

# Extract date and time components
#date_part="${date_string%%_*}"
#time_part="${date_string#*_}"

# Replace underscores with spaces and colons
#formatted_date="${date_part}"
#formatted_time="${time_part//-/:}"

# Combine the formatted date and time
#formatted_datetime="$formatted_date $formatted_time"

#start_timestamp="$formatted_datetime"
start_timestamp="$date_string"
end_timestamp=$(date)

# Convert timestamps to epoch time
start_epoch=$(date -d "$start_timestamp" +%s)
end_epoch=$(date -d "$end_timestamp" +%s)

# Calculate time difference
time_difference=$((end_epoch - start_epoch))

# Calculate hours, minutes, and seconds
hours=$((time_difference / 3600))
minutes=$(( (time_difference % 3600) / 60 ))
seconds=$((time_difference % 60))

echo "Time Difference: $hours hours, $minutes minutes, $seconds seconds"





time_value="49:33:58"
threshold_hours=28
threshold_seconds=$((threshold_hours * 3600))  # Convert hours to seconds

IFS=":" read -r hours minutes seconds <<< "$time_value"
total_seconds=$((hours * 3600 + minutes * 60 + seconds))

if [ "$total_seconds" -gt "$threshold_seconds" ]; then
    echo "Overload time exceeds $threshold_hours hours."
else
    echo "Overload time does not exceed $threshold_hours hours."
fi

