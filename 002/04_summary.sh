#!/bin/bash

# Sales report with piping

echo Here is a summary of the sales data:
echo ====================================
echo

cat /dev/stdin | cut -d' ' -f 2,3 | sort