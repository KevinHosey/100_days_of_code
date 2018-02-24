#!/bin/bash
# Blackjack

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

initializeDeck
shuffleDeck

echo -n "  Player's hand: "
  showCard ${newdeck[1]} ; echo -n "$cardname, "
  showCard ${newdeck[3]} ; echo "$cardname"

echo -n "  Dealer's hand: "
  showCard ${newdeck[2]} ; echo -n "$cardname, "
  showCard ${newdeck[4]} ; echo "$cardname"
echo
