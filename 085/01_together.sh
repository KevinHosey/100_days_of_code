#!/bin/bash
# starting to put bits together

function user_registration
{
	clear
	echo
	echo
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
	echo
}

function menu
{
	echo Welcome to the Game of Life
	echo
	echo Select a number from the menu below
	echo
	choice=0

	while [ $choice -ne 7 ]
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
			number
		elif [ $choice -eq 2 ]; then
			dealer
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

function number
{
	check=0
	count=0
	random=$((1 + RANDOM % 100))

	clear
	echo
	echo
	echo ======= Number Guessing Game ========
	echo
	echo   --- Guess the number to win ---
	echo

	echo "How many attempts do you want?"
	read credits

	if [ $credits -le 0 ]; then
	echo "You entered an invalid number, tschüs!"
	sleep 1
	exit
	fi

	while [ $check -ne 1  ] && [ $credits -ne 0 ]
	do
	echo "Guess a number:"
	read usernum
	        if [ $usernum -eq $random ]; then
	        echo "Congratulations!!"
	        echo "You found it!!"
	        check=1
	        fi

	        if [ $usernum -lt $random ]; then
	        echo "Too low..."
	        fi

	        if [ $usernum -gt $random ]; then
	        echo "Too high..."
	        fi

	        credits=$((credits-1))
	done

	echo
	echo "You're out of luck!"
	echo
	echo "Returning to main menu..."
	sleep 3
	clear
}

function dealer
{
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
}

clear
echo "-   _______  _______  __   __  _______          -"
echo "-  |       ||   _   ||  |  | ||       |         -"
echo "-  |    ___||  |_|  ||  |_ | ||    ___|         -"
echo "-  |   | __ |       ||       ||   |___          -"
echo "-  |   ||  ||   _   ||       ||    ___|         -"
echo "-  |   |_| ||  | |  || ||_|| ||   |___          -"
echo "-  |_______||__| |__||_|   |_||_______|         -"
echo "-            _______   _______                  -"
echo "-           |       | |       |                 -"
echo "-           |   _   | |    ___|                 -"
echo "-           |  |_|  | |   |___                  -"
echo "-           |       | |    ___|                 -"
echo "-           |       | |   |                     -"
echo "-           |_______| |___|                     -"
echo "-     ____     ___   _______  _______           -"
echo "-    |   |    |  |  |       ||       |          -"
echo "-    |   |    |  |  |    ___||    ___|          -"
echo "-    |   |    |  |  |   |___ |   |___           -"
echo "-    |   |    |  |  |    ___||    ___|          -"
echo "-    |   |__  |  |  |   |    |   |___           -"
echo "-    |______| |__|  |___|    |_______|          -"
echo
echo
echo -e "              \033[5m Loading.."
sleep 5
echo -e "              \033[0m Lets go!"


user_registration
echo Powering up the flux capacitor....
echo
sleep 5
clear
menu
