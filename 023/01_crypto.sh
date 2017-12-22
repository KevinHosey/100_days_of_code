#!/bin/bash
# Encrypt quotes

key=ETAOINSHRDLUBCFGJMQPVWZYXK

cat "$@" | tr "a-z" "A-Z" | tr "A-Z" "$key"
#        |  to uppercase  |     encrypt       
# Will work on lowercase, uppercase, or mixed-case quotes.
# Passes non-alphabetic characters through unchanged.

# To reverse the encryption:
# cat "$@" | tr "$key" "A-Z"

echo
