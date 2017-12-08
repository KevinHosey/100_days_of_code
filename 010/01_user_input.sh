#!/bin/bash

# Reading user input

echo -e "Hi, please enter a word: \c "
read word
echo -e "The word you entered is: $word"

echo -e "Now enter two words: "
read word1 word2
echo "Here is your input: \"$word1\" \"$word2\""

echo -e "How do you feel about bash scripting?"
read
echo "You said \"$REPLY\", I'm glad to hear that!"

echo -e "What are your favourite colours? "
read -a colours
echo "My favourite colours are also ${colours[0]}, ${colours[1]}, and ${colours[2]}"