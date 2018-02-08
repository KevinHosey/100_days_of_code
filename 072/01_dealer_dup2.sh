#!/bin/bash
# dealer duplication game pt.2

clear
echo
echo
echo ------------- Dealer Duplication ------------------
echo "-   _______  _______  __   __  _______            -"
echo "-  |       ||   _   ||  |  | ||       |           -"
echo "-  |    ___||  |_|  ||  |_ | ||    ___|           -"
echo "-  |   | __ |       ||       ||   |___            -"
echo "-  |   ||  ||   _   ||       ||    ___|           -"
echo "-  |   |_| ||  | |  || ||_|| ||   |___            -"
echo "-  |_______||__| |__||_|   |_||_______|           -"
echo "---------------------------------------------------"
echo
echo INSTRUCTIONS:
echo
echo The dealer will deal out 16 random numbers between 0 and 99.
echo If any of the numbers are duplicates, you win!
echo 
echo

echo "Are you ready?? (y/n): "
read choice
echo

while [ $choice != "n" ]; do 
    len=16
    ARRAY=()
    match=()

    for (( i=0; i<$len; i++ )); do 
        ARRAY[${i}]=$((1 + RANDOM % 100))
    done

    for element in ${ARRAY[@]}; do
        echo $element 
        sleep 1
    done
    echo

    for (( i=0; i<${#ARRAY[@]}; ++i )); do
        for (( j=i+1; j<${#ARRAY[@]}; ++j )); do
            if [ ${ARRAY[i]} -eq ${ARRAY[j]}  ]; then
                match+=( ${ARRAY[i]} )
                break
            fi
        done
    done

    if [ ${#match[@]} -eq 0 ]; then
        echo No duplicate...you lose!
    else
        echo A wild $match appears twice...you win!
    fi

    echo
    echo "Do you want to play again? (y/n): "
    read choice
    echo
done
