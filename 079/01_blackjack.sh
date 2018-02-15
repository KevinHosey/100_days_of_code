#!/bin/bash
# Blackjack

echo "-----Welcome to Black-Jack!-----"
echo

dealer=()

function shuffle
{
   local i j temp
   for (( i=${#shoe[@]}; i ; --i ))
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
