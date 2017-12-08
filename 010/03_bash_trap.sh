#!/bin/bash

# Bash trap command

trap bashtrap INT

clear;

bashtrap() {
	echo "  CRTL+C Detected !...executed bash trap !"
}

for a in {10..1} 
do
	echo "$a seconds to Exit"
	sleep 1;
done

echo "Exit bash trap example!"