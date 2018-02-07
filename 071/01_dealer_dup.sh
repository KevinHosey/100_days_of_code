#!/bin/bash
# dealer duplication game

clear
echo
echo
echo ::::::::::::::::::::: Dealer Duplication Game :::::::::::::::::::::::
echo
echo ---- The dealer will deal out 16 random numbers between 0 and 99 ----
echo -------- If any of the numbers are duplicates, you win --------------
echo

len=16
ARRAY=()

for (( i=0;i<$len;i++ )); do 
    ARRAY[${i}]=$((1 + RANDOM % 100))
done

for element in ${ARRAY[@]}; do
    echo $element 
    #sleep 1
done
echo

for (( i=0;i<$len;i++ )); do 
    j=$((i+1))
    while [ $j -le 16 ]
    do
    	if (( ARRAY[${i}] == ARRAY[${j}] )); then	
    		match=ARRAY[${i}]
    	fi
    	j=$((j+1))
    done
done

if [ match != -1 ]; then
	echo A wild duplicate appears...you win!!
else
	echo No duplicate!	
fi

echo
