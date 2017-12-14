#!/bin/bash

# Detect arrow keys

UPARROW=$'\x1b[A'
DOWNARROW=$'\x1b[B'
RIGHTARROW=$'\x1b[C'
LEFTARROW=$'\x1b[D'
ESCAPE=$'\x1b[^'

read -s -n3 -p "Hit an arrow key (To exit press Enter): " x

while true
do
	case "$x" in
		$UPARROW)
			echo "You pressed up-arrow"
			read -s -n3 -p "Hit an arrow key: " x
			;;
		$DOWNARROW)
			echo "You pressed down-arrow"
			read -s -n3 -p "Hit an arrow key: " x
			;;
		$RIGHTARROW)
			echo "You pressed right-arrow"
			read -s -n3 -p "Hit an arrow key: " x
			;;
		$LEFTARROW)
			echo "You pressed left-arrow"
			read -s -n3 -p "Hit an arrow key: " x
			;;
		*)
			echo "Goodbye!"
			break
			;;
		esac
done
