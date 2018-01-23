#!/bin/bash
# Extract email address from website

wget -q -l 5 -O - https://mimi.io/en/home/ | grep -E -o "\b[a-zA-Z0-9.-]+@[a-zA-Z0-9.-]+\.[a-zA-Z0-9.-]+\b" &> output.txt
