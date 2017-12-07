#!/bin/bash

# Create a script which will print a random word. 
# There is a file containing a list of words on your 
# system (usually /usr/share/dict/words or /usr/dict/words).

WORDFILE=/usr/share/dict/words
RANDOM=$$

lines=$(cat $WORDFILE | wc -l) 
rnum=$((RANDOM*RANDOM%$lines+1))
sed -n "$rnum p" $WORDFILE
