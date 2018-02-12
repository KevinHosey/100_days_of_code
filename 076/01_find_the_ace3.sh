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
echo Three cards will be dealt out.
echo You pick which card you think will be the Ace.
echo After the first card has been revealed,
echo you have the option of changing your mind.
echo If you guess which number card will be the Ace, you win!
echo If your guess is incorrect, you will die..
echo And finally, if no Ace appears, we go again.
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

Denominations="Jack
Queen
King
Ace"

suite=($Suites)
denomination=($Denominations)

num_suites=${#suite[*]}
num_denominations=${#denomination[*]}

while [[ $a != "Ace" || $b != "Ace" || $c != "Ace" ]]
do
	echo Card 1:
	a=${denomination[$((RANDOM%num_denominations))]}
	echo $a
	sleep 2
	echo

	echo Do you wish to change your mind?
	read change
	echo

	if [ $change == "y" ]; then
		echo "Which number card do you think will be the Ace?? [2, 3]:"
		read choice
		echo
	fi

	echo Card 2:
	b=${denomination[$((RANDOM%num_denominations))]}
	echo $b
	sleep 2
	echo

	echo Card 3:
	c=${denomination[$((RANDOM%num_denominations))]}
	echo $c
	sleep 2
	echo

	if [[ $a == "Ace" && $choice == 1 ]]; then
		echo You win!!
	break
	elif [[ $b == "Ace" && $choice == 2 ]]; then
		echo You win!!
	break
	elif [[ $c == "Ace" && $choice == 3 ]]; then
		echo You win!!
	break
	elif [[ $a == "Ace" || $b == "Ace" || $c == "Ace" ]]; then
		echo You lose
	break
	else
		echo You were not correct..
		echo
		sleep 2
	fi

	echo However...there was no Ace. Lets go again...
	echo
	sleep 2
	echo Your current choice is card $choice
	echo
	sleep 2
done
