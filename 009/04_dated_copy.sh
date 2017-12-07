#!/bin/bash

# Create a script which will take a 
# filename as its first argument and 
# create a dated copy of the file. 
# eg. if our file was named file1.txt 
# it would create a copy such as 
# 2017-12-07_file1.txt. 

DATE=$(date +%F)

COPY=$( cp $1 {$DATE}_$1 )
echo File successfully copied