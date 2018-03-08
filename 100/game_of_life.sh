#!/bin/bash
# Game of Life

function userRegistration
{
	clear
	echo
	echo
	echo "---==={ New User Registration }===---"
	echo "Enter your name:"
	read name
	echo
	echo "Welcome to the Game of Life $name"
	echo "You begin with" $score "credits"
	sleep 1
	echo $name >> users.txt 
	echo
	echo "You have joined a courageous team of individuals, including:"
	cat users.txt
	echo
}

function menu
{
	echo "Welcome to the Game of Life"
	echo
	echo "Select a number from the menu below"
	echo
	choice=0

	while [ $choice -ne 7 ] 
	do
		echo
		echo "Game of Life menu:"
		echo "1 - Play Guess the Number"
		echo "2 - Play Dealer Duplication"
		echo "3 - Play Find the Ace"
		echo "4 - Play BlackJack"
		echo "5 - Change your username"
		echo "6 - View high score"
		echo "7 - Exit"
		echo
		echo "Your current score is" $score
		echo
		echo "Choice:"
		read choice

		if [[ -n ${choice//[0-9]/} ]]; then
    		echo "Hmm, that's not a number!"
    		break
		fi

		if [ $choice -eq 1 ]; then
			number
		elif [ $choice -eq 2 ]; then
			dealer
		elif [ $choice -eq 3 ]; then
			ace
		elif [ $choice -eq 4 ]; then
			blackjack
		elif [ $choice -eq 5 ]; then
			userRegistration
		elif [ $choice -eq 6 ]; then
			highScore
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
	echo "------------- Guess the Number --------------------"
	echo "-   _______  _______  __   __  _______            -"
	echo "-  |       ||   _   ||  |  | ||       |           -"
	echo "-  |    ___||  |_|  ||  |_ | ||    ___|           -"
	echo "-  |   | __ |       ||       ||   |___            -"
	echo "-  |   ||  ||   _   ||       ||    ___|           -"
	echo "-  |   |_| ||  | |  || ||_|| ||   |___            -"
	echo "-  |_______||__| |__||_|   |_||_______|           -"
	echo "---------------------------------------------------"
	echo
	echo "INSTRUCTIONS:"
	echo
	echo "Guess the correct number to win."
	echo "You have 3 attempts so choose wisely.."
	echo

	credits=3 

	if [ $credits -le 0 ]; then
	echo "You entered an invalid number, tschüs!"
	sleep 1
	exit
	fi

	while [ $check -ne 1  ] && [ $credits -ne 0 ]
	do
		echo "Guess a number:"
		read usernum
		if [[ -n ${usernum//[0-9]/} ]]; then
			echo
    		echo "Hmm, that's not a number!"
    		break
		fi

	    if [ $usernum -eq $random ]; then
	    	echo
	    	echo "Congratulations!!"
	        echo "You found it!!"
	        check=1
	        sleep 1
	        echo
	        echo "You have earned 50 credits!"
	        score=$((score+50))
	        sleep 2
	        echo
			echo "Returning to main menu..."
			sleep 3
			clear
	        return 1
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
	echo "You have lost 20 credits"
	echo
	score=$((score-20))
	echo "Returning to main menu..."
	sleep 3
	clear
}

function dealer
{
	clear
	echo
	echo
	echo "------------- Dealer Duplication ------------------"
	echo "-   _______  _______  __   __  _______            -"
	echo "-  |       ||   _   ||  |  | ||       |           -"
	echo "-  |    ___||  |_|  ||  |_ | ||    ___|           -"
	echo "-  |   | __ |       ||       ||   |___            -"
	echo "-  |   ||  ||   _   ||       ||    ___|           -"
	echo "-  |   |_| ||  | |  || ||_|| ||   |___            -"
	echo "-  |_______||__| |__||_|   |_||_______|           -"
	echo "---------------------------------------------------"
	echo
	echo "INSTRUCTIONS:"
	echo
	echo "The dealer will deal out 16 random numbers between 0 and 99."
	echo "If any of the numbers are duplicates, you win!"
	echo 
	echo

	echo "Are you ready?? (y/n): "
	read ready
	echo

	while [ $ready != "n" ]; do 
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
	        echo "No duplicate...you lose!"
	        echo
	     	echo "You have lost 20 credits"
	     	echo
	     	score=$((score-20))
	    else
	        echo "A wild $match appears twice...you win!"
	        echo
	        echo "You have won 20 credits!"
	        echo
	        score=$((score+20))
	    fi

	    echo
	    echo "Do you want to play again? (y/n): "
	    read ready
	    echo
	done
	clear
}

function ace
{
	clear
	echo
	echo
	echo "------------- Find the Ace ------------------------"
	echo "-   _______  _______  __   __  _______            -"
	echo "-  |       ||   _   ||  |  | ||       |           -"
	echo "-  |    ___||  |_|  ||  |_ | ||    ___|           -"
	echo "-  |   | __ |       ||       ||   |___            -"
	echo "-  |   ||  ||   _   ||       ||    ___|           -"
	echo "-  |   |_| ||  | |  || ||_|| ||   |___            -"
	echo "-  |_______||__| |__||_|   |_||_______|           -"
	echo "---------------------------------------------------"
	echo
	echo "INSTRUCTIONS:"
	echo
	echo "You must pick which number card you think will be the Ace."
	echo "The dealer will then begin to deal out three cards."
	echo "After the first card has been revealed,"
	echo "you have the option of changing your mind."
	echo
	echo "If your guess is correct, you win!"
	echo "If your guess is incorrect, you will die.."
	echo "And finally, if no Ace appears, we go again."
	echo

	echo "Are you read to play?? (y/n): "
	read ready
	echo

	if [ $ready == "n" ]; then
		return 1
	fi

	echo "Which number card do you think will be the Ace?? [1, 2, 3]:"
	read choice
	echo

	if [[ -n ${choice//[0-9]/} ]]; then
		echo
    	echo "Hmm, that's not a number!"
    	break
	fi

	echo "So you think the Ace is behind card $choice....we shall see.."
	sleep 3
	echo

	Denominations="Jack
	Queen
	King
	Ace"

	denomination=($Denominations)
	num_denominations=${#denomination[*]}

	while [[ $a != "Ace" || $b != "Ace" || $c != "Ace" ]]
	do
		echo "Card 1:"
		a=${denomination[$((RANDOM%num_denominations))]}
		echo $a
		sleep 2
		echo

		echo "Do you wish to change your mind?"
		read change
		echo

		if [ $change == "y" ]; then
			echo "Which number card do you think will be the Ace?? [2, 3]:"
			read choice
			echo
		fi

		echo "Card 2:"
		b=${denomination[$((RANDOM%num_denominations))]}
		echo $b
		sleep 2
		echo

		echo "Card 3:"
		c=${denomination[$((RANDOM%num_denominations))]}
		echo $c
		sleep 2
		echo

		if [[ $a == "Ace" && $choice == 1 ]]; then
			echo "You win!!"
			sleep 1
	        echo "You have earned 50 credits!"
	        score=$((score+50))
		break
		elif [[ $b == "Ace" && $choice == 2 ]]; then
			echo "You win!!"
			sleep 1
	        echo "You have earned 50 credits!"
	        score=$((score+50))
		break
		elif [[ $c == "Ace" && $choice == 3 ]]; then
			echo "You win!!"
			sleep 1
	        echo "You have earned 50 credits!"
	        score=$((score+50))
		break
		elif [[ $a == "Ace" || $b == "Ace" || $c == "Ace" ]]; then
			echo "You lose"
			sleep 1
			echo "You have lost 20 credits"
	     	echo
	     	score=$((score-20))
		break
		else
			echo "You were not correct.."
			echo
			sleep 2
		fi

		echo "However...there was no Ace. Lets go again..."
		echo
		sleep 2
		echo "Your current choice is card" $choice
		echo
		sleep 2
	done
	echo
	echo "Returning to main menu..."
	sleep 3
	clear
}

function blackjack
{
	clear
	echo
	echo "----- Welcome to Blackjack! -----"
	echo

	function initializeDeck
	{
		card=1
		while [ $card -lt 53 ]
		do
		  deck[$card]=$card
		  card=$(( $card + 1 ))
		done
	}

	function pickCard
	{
	    local errcount randomcard
	    threshold=10	
	    errcount=0

	    while [ $errcount -lt $threshold ]
	    do
	      randomcard=$(( ( $RANDOM % 52 ) + 1 ))
	      errcount=$(( $errcount + 1 ))

	    if [ ${deck[$randomcard]} -ne 0 ] ; then
		    picked=${deck[$randomcard]}
		    deck[$picked]=0		
	        return $picked 
	    fi
	    done

	    randomcard=1

	    while [ ${deck[$randomcard]} -eq 0 ]
	    do
	       randomcard=$(( $randomcard + 1 ))
	    done

	    picked=$randomcard
	    deck[$picked]=0
	    return $picked
	}

	function shuffleDeck
	{
	   count=1

	   while [ $count -le 52 ]
	   do
	      pickCard
	      newdeck[$count]=$picked
	      count=$(( $count + 1 ))
	   done
	}

	function showCard
	{
	   card=$1

	   if [ $card -lt 1 -o $card -gt 52 ] ; then
	   	echo "Bad card value: $card"
	   	exit 1
	   fi

	   suite="$(( ( ( $card - 1) / 13 ) + 1))"
	   rank="$(( $card % 13))"

	   case $suite in
	     1 ) suite="Hearts"	  ;;
	     2 ) suite="Clubs"    ;;
	     3 ) suite="Spades"   ;;
	     4 ) suite="Diamonds" ;;
	     * ) echo "Bad suite value: $suite"; exit 1
	   esac 
	    
	   case $rank in 
	     0 ) rank="King" 	;;
	     1 ) rank="Ace"	;;
	     11) rank="Jack"    ;;
	     12) rank="Queen"   ;;
	   esac

	   cardname="$rank of $suite"
	}

	function handValue
	{
	   handvalue=0
	   seenAce=0
	   for cardvalue
	   do
	      rankvalue=$(( $cardvalue % 13 ))
	      case $rankvalue in
	        0|11|12 ) rankvalue=10   ;;
	        1 ) if [ $seenAce -eq 1 ] ; then
	              rankvalue=1
	            else  
	              rankvalue=11 ; seenAce=1
	            fi ;;
	      esac

	      handvalue=$(( $handvalue + $rankvalue ))
	   done

	   if [ $handvalue -gt 21 -a $seenAce -eq 1 ] ; then
	        handvalue=$(( $handvalue - 10 ))
	    fi
	}

	initializeDeck
	shuffleDeck

	player[1]=${newdeck[1]}
	player[2]=${newdeck[3]}
	nextplayercard=3

	dealer[1]=${newdeck[2]}
	dealer[2]=${newdeck[4]}
	nextdealercard=3

	nextcard=5

	echo ""
	echo -n "** You've been dealt: "
	showCard ${player[1]} ; echo -n "$cardname, "
	showCard ${player[2]} ; echo "$cardname"
	echo ""

	handValue ${newdeck[1]} ${newdeck[3]}

	handValue ${player[1]} ${player[2]}
	playerhandvalue=$handvalue
	handValue ${dealer[1]} ${dealer[2]}
	dealerhandvalue=$handvalue
	echo ""

	if [ $playerhandvalue -eq 21 -a $dealerhandvalue -eq 21 ] ; then
	  echo "I don't believe it! Both the dealer and player were dealt a blackjack!"
	  echo "Unfortunately, this means you didn't win: it's a tie."
	  echo ""
	  return 1
	fi

	if [ $dealerhandvalue -eq 21 ] ; then
	  echo "Oh no! Dealer pulled a blackjack out of his hat. You lose."
	  echo ""
	  echo
	  echo "You have lost 20 credits"
	  echo
	  score=$((score-20))
	  sleep 1
	  return 1
	elif [ $playerhandvalue -eq 21 ] ; then
	  echo "NICE! You got a blackjack and won the game!"
	  echo ""
	  echo
	  echo "You have earned 100 credits!"
	  score=$((score+100))
	  sleep 1
	  return 1
	fi

	echo -n "** Dealer's hand: "
	showCard ${dealer[1]} ; echo -n "$cardname, "
	echo "(card face down)"
	echo ""

	while [ $handvalue -lt 22 ]
	do

	  if [ $handvalue -lt 16 ] ; then
	    echo -n "H)it or S)tand? (recommended: hit) "
	    echo
	  else
	    echo -n "H)it or S)tand? (recommended: stand) "
	    echo
	  fi

	  read answer
	  if [ $answer = "stand" -o $answer = "s" ] ; then 
	     break
	  fi

	  player[$nextplayercard]=${newdeck[$nextcard]}
	  showCard ${player[$nextplayercard]}

	  echo "** You've been dealt: $cardname"

	  handValue ${player[1]} ${player[2]} ${player[3]} ${player[4]} ${player[5]}

	  nextcard=$(( $nextcard + 1 ))
	  nextplayercard=$(( $nextplayercard + 1 ))
	done

	if [ $handvalue -gt 21 ] ; then
	  echo ""
	  echo "*** Busted!  Your hand is worth $handvalue **"
	  echo ""
	  sleep 1
	else
	  echo "You stand with a hand value of $handvalue"
	  echo
	  sleep 1
	fi

	echo -n "** Dealer's hand: "
	showCard ${dealer[1]} ; echo -n "$cardname, "
	showCard ${dealer[2]} ; echo "$cardname"
	echo
	sleep 1

	handValue ${dealer[1]} ${dealer[2]}

	while [ $handvalue -lt 17 ]
	do
	  dealer[$nextdealercard]=${newdeck[$nextcard]}
	  showCard ${dealer[$nextdealercard]}
	  nextcard=$(( $nextcard + 1 ))
	  nextdealercard=$(( $nextdealercard + 1 ))

	  echo "" ; echo "** Dealer takes: $cardname"
	  echo
	  handValue ${dealer[1]} ${dealer[2]} ${dealer[3]} ${dealer[4]} ${dealer[5]}
	  sleep 1
	done

	if [ $handvalue -gt 21 ]
	then
	  echo "**** Dealer busted!  Player wins with $playerhandvalue!"
	  echo
	  playerwin=$(( $playerwin + 1 ))
	  sleep 1
	  echo "You have earned 100 credits!"
	  score=$((score+100))
	  sleep 1
	elif [ $handvalue -eq $playerhandvalue ]
	then
	  echo "**** Dealer and player tie with $handvalue points."
	  echo
	  sleep 1
	elif [ $handvalue -lt $playerhandvalue ]
	then
	  echo "**** Player wins with $playerhandvalue"
	  echo
	  playerwin=$(( $playerwin + 1 ))
	  sleep 1
	  echo "You have earned 100 credits!"
	  score=$((score+100))
	  sleep 1
	else
	  echo "**** Dealer wins with $handvalue"
	  echo
	  dealerwin=$(( $dealerwin + 1 ))
	  sleep 1
	  echo "You have lost 20 credits"
	  echo
	  score=$((score-20))
	  sleep 1
	fi
	echo
	echo Returning to main menu..
	sleep 5
	clear
}

function highScore
{
	echo
	echo "The current high score is:"
	echo $score >> scores.txt 
	sort -n scores.txt | tail -1
	echo
	echo "Your current score is" $score
	echo
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
sleep 4
echo -e "              \033[0m Lets go!"

score=100
userRegistration
echo "Los geht's!"
echo
sleep 5
clear
menu
