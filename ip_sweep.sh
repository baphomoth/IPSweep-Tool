#!/bin/bash

# Objective:
# This script sweeps a specified range of IP addresses and saves the results to a file.

# Function to check if an IP address is reachable
is_reachable() {
  ping -c 1 -W 1 "$1" > /dev/null
  if [ $? -eq 0 ]; then
    echo "$1" >> reachable_ips.txt
  fi
}

# Check if the user provided an IP range
if [ $# -eq 0 ]; then
  echo "Usage: $0 <start-ip> <end-ip>"
  exit 1
fi

# Extract the start and end IP addresses from the command line arguments
start_ip=$1
end_ip=$2

# Convert the IP addresses to integers for comparison
start_ip_int=$(echo $start_ip | awk -F'.' '{print ($1 * 256 * 256 * 256) + ($2 * 256 * 256) + ($3 * 256) + $4}')
end_ip_int=$(echo $end_ip | awk -F'.' '{print ($1 * 256 * 256 * 256) + ($2 * 256 * 256) + ($3 * 256) + $4}')

# Check if the start IP is less than or equal to the end IP
if [ $start_ip_int -gt $end_ip_int ]; then
  echo "Start IP must be less than or equal to the end IP"
  exit 1
fi

# Clear the previous results
> reachable_ips.txt

# Sweep the IP range
for (( ip=$start_ip_int; ip<=$end_ip_int; ip++ )); do
  # Convert the IP integer back to an IP address
  current_ip=$(printf "%d.%d.%d.%d" $((ip>>24)) $((ip>>16&255)) $((ip>>8&255)) $((ip&255)))
  is_reachable $current_ip
done

# Notify the user that the sweep is complete
echo "IP sweep completed. Reachable IPs saved to reachable_ips.txt"