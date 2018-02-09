#!/bin/bash
# Find the Ace

clear
echo
echo
echo ------------- Find the Ace ------------------------
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
echo Three cards will be dealt out
echo You pick which card you think will be the Ace
echo After the first card has been revealed,  
echo you have the option of changing your mind.
echo If you guess which number card will be the Ace, you win
echo If your guess is incorrect, you will die..
echo And if no Ace appears, we go again.
echo

echo "Are you read to play?? (y/n): "
read ready
echo

if [ $ready == "n" ]; then
	exit 
fi

echo "Which number card do you think will be the Ace?? [1, 2, 3]:"
read choice
echo

echo "So you think the Ace is behind card $choice....we shall see.."
sleep 3
echo

Suites="Clubs
Diamonds
Hearts
Spades"

Denominations="2
3
4
5
6
7
8
9
10
Jack
Queen
King
Ace"

suite=($Suites)               
denomination=($Denominations)

num_suites=${#suite[*]}       
num_denominations=${#denomination[*]}


echo Card 1:
echo -n "${denomination[$((RANDOM%num_denominations))]} of "
echo ${suite[$((RANDOM%num_suites))]}
echo
sleep 2

echo Do you wish to change your mind?
read choice
echo 

if [ $choice == "y" ]; then
	echo "Which number card do you think will be the Ace?? [2, 3]:"
	read choice
	echo
fi

for (( i=2; i<4; i++ )); do 
	echo Card $i:
	echo -n "${denomination[$((RANDOM%num_denominations))]} of "
	echo ${suite[$((RANDOM%num_suites))]}
	echo
	sleep 3
done
echo
