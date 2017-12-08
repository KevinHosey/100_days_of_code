#!/bin/bash

# User selection

PS3='Chose a number: '

select word in "linux" "bash" "scripting" "tutorial"

do
	echo "The word you have selected is: $word"
	break
done

