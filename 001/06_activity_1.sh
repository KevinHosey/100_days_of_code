#!/bin/bash

# Create a simple script which will accept 
# some command line arguments and echo out 
# some details about them (eg, how many are 
# there, what is the secone one etc).

variables=$@

echo There were $# arguments supplied
echo The second argument is: $2
echo The script completed with process ID: $$
echo The exit status is $?
