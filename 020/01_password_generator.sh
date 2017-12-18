#!/bin/bash

# Easy password generator

CHARS=abcd1234ABCD

echo How many characters do you want your password to have?
read LENGTH
i=0

while [[ i -le LENGTH-1 ]] 
do
    echo -n ${CHARS:RANDOM%${#CHARS}:1}
    ((i++))
done
echo
