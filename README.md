# IP Sweep Tool in Bash

## Objective

The objective of this project is to create a Bash script that performs an IP address sweep. The script will take a range of IP addresses as input, scan each IP address to determine if it is reachable, and save the results to a file. This can be useful for network security tasks such as identifying live hosts or vulnerability scanning.

### Explanation

- The script starts with a shebang (`#!/bin/bash`) to specify the interpreter.
- The `is_reachable` function uses the `ping` command to check if an IP address is reachable. If the ping succeeds, the IP address is appended to the `reachable_ips.txt` file.
- The script checks if the user provided an IP range as command-line arguments. If not, it prints usage information and exits.
- The start and end IP addresses are extracted from the command-line arguments.
- The IP addresses are converted to integers for easier comparison.
- The script checks if the start IP is less than or equal to the end IP. If not, it exits with an error message.
- The `reachable_ips.txt` file is cleared to ensure a fresh start.
- The script sweeps the IP range by iterating over all the integers in the specified range.
- For each integer, the script converts it back to an IP address and calls the `is_reachable` function to check if the IP is reachable.
- After the sweep is complete, the script notifies the user that the results are saved to `reachable_ips.txt`.

### Notes

Save this script to a file, for example ip_sweep.sh, and make it executable with chmod +x ip_sweep.sh.

To use the script, run it with the start and end IP addresses as arguments:

bash

./ip_sweep.sh 192.168.1.1 192.168.1.254

This will sweep the IP range 192.168.1.1 to 192.168.1.254 and save the reachable IP addresses to reachable_ips.txt.
