#!/bin/bash
# Guess the number game

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
echo "You're out of luck, Goodbye :)"
echo
