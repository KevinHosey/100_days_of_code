#!/bin/bash
# Blackjack

echo "-----Welcome to BlackJack!-----"
echo

dealer=()

function shuffle
{
   local i j temp
   for (( i=${#dealer[@]}; i ; --i ))
   do
      j=$(( $RANDOM % i ))
      temp=${dealer[i]}
      dealer[i]=${dealer[j]}
      dealer[j]=$temp
   done
}

function deal
{
   if [ ${#dealer[@]} -eq 0 ]
   then
     dealer=(`seq 0 51`)
     shuffle
   fi

   local card=${dealer[0]}
   unset dealer[0]
   dealer=(${dealer[@]})
   return $card
}

function value
{
   local value=0 has_ace=0
   for card
   do
      let 'card = card % 13 + 1'
      [ $card = 1 ] && has_ace=1
      [ $card -gt 10 ] && card=10
      let 'value += card'
   done
   if [ $value -lt 12 -a $has_ace -eq 1 ]
   then
      let 'value += 10'
   fi
   return $value
}

function score
{
  if [ "$userScore" -gt 21 ]
  then
    echo $userName "is out!"
    userOut='out'
  else
    userOut='under'
  fi

  if [ "$systemScore" -gt 21 ]
  then
    echo $systemName "is out!"
    systemOut='out'
  else
    systemOut='under'
  fi      
}
