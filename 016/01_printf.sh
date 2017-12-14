#!/bin/bash

# printf example

declare -r PI=3.14159
declare -r CONSTANT=31343

MESSAGE1="Hallo"
MESSAGE2="Welt"

echo

printf "Pi to 2 decimal places = %1.2f" $PI
echo
printf "Pi to 5 decimal places = %1.5f" $PI

printf "\n"

printf "Constant = %d\n" $CONSTANT
printf "%s %s \n" $MESSAGE1 $MESSAGE2

echo