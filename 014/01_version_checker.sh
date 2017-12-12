#!/bin/bash

# Version checker

items='Homebrew Git Python npm Quit'

PS3='Select the program version to display: '

select item in $items
do
	if [ $item == 'Homebrew' ]
	then
		brew --version
	elif [ $item == 'Git' ]
	then
		git --version
	elif [ $item == 'Python' ]
	then
		python --version
	elif [ $item == 'npm' ]
	then
		npm --version  
	else
		break
	fi
done

