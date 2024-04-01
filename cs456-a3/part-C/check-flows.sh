#!/bin/bash

# Check if the script received an argument
if [ $# -eq 0 ]
then
  echo "Please provide an argument (either 'before' or 'after')."
  exit 1
fi

# Loop over the switch names from s1 to s7
for i in {1..7}
do
  echo "Running commands for switch s$i"
  
  # Run the ovs-ofctl show command and save the output to a file
  sudo ovs-ofctl show s$i > "s${i}_show_$1.txt"
  
  # Run the ovs-ofctl dump-flows command and save the output to a file
  sudo ovs-ofctl dump-flows s$i > "s${i}_dump-flows_$1.txt"
done