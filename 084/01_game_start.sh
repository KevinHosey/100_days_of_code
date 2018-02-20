#!/bin/bash
# user registration and menu functions

function user_registration
{
	clear
	echo "---==={ New User Registration }===---"
	echo Enter your name:
	read name
	echo

	echo Welcome to the Game of Life $name
	echo $name >> users.txt 
	echo

	echo You have joined a courageous team of individuals, including:
	cat users.txt
	echo
	echo Gods speed to each and every one of you.
	echo
}

function menu
{
	echo Welcome to the Game of Life
	echo
	echo Select a number from the menu below
	echo
	choice=0

	while [ $choice -ne 7  ]
	do
		echo "Game of Life menu:"
		echo "1 - Play Guess the Number"
		echo "2 - Play Dealer Duplication"
		echo "3 - Play Find the Ace"
		echo "4 - Play BlackJack"
		echo "5 - Change your username"
		echo "6 - View high scores"
		echo "7 - Exit"
		echo
		echo Choice: 
		read choice

		if [ $choice -eq 1 ]; then
			# call guess the number function
			echo one
		elif [ $choice -eq 2 ]; then
			# call dealer duplication function
			echo two
		elif [ $choice -eq 3 ]; then
			# call find the ace function
			echo three
		elif [ $choice -eq 4 ]; then
			# call blackjack function
			echo four
		elif [ $choice -eq 5 ]; then
			# call username function
			echo five
		elif [ $choice -eq 6 ]; then
			# call high scores function
			echo six
		fi
	done

	echo
	echo "Goodbye :)"
	echo
}

user_registration
echo Game is loading....
echo
sleep 3
menu
