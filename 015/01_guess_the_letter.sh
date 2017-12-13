#!/bin/sh

echo Guess the letter
read LETTER

while [ $LETTER != "y" ]
do
	echo "Try again.."
	read LETTER
done

echo
echo "You got it!!!"