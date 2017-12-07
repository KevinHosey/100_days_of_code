#!/bin/bash

# A review of variables and command substitution 

myvariable="Hello World"
anothervar=2017
myvar=$( ls ~ | wc -l )
myvar2=$( ls )
thisdir=$( ls ./ | wc -l )

echo
echo $myvariable $anothervar
echo
echo There are $thisdir entries in this directory:
echo $myvar2
echo
echo There are $myvar entries in the home directory:

samppledir=~
ls $samppledir
