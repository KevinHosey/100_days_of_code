#!/bin/bash

# Expand the previous activity so that 
# if a number is supplied as the first 
# command line argument then it will 
# select from only words with that many 
# characters. Hint: Grep may be useful here.

WORDFILE=/usr/share/dict/words
RANDOM=$$
CH=$1

TOTW=$(grep -Ec "^.{$CH}$" $WORDFILE)

RWORD=$((RANDOM%$TOTW+1))
grep -E "^.{$CH}$" $WORDFILE | sed -n "$RWORD p"
