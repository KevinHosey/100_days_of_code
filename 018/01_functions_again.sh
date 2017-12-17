#!/bin/bash

# Functions fun

WAIT=1.5

funky ()
{ 
  echo "This is a function."
  echo "Now exiting funky function."
}


fun ()
{ 
  i=0
  REPEATS=30

  echo
  echo "And now the next function."
  echo

  sleep $WAIT    
  while [ $i -lt $REPEATS ]
  do
    echo "----------FUNCTIONS---------->"
    echo "<------------ARE-------------"
    echo "<------------FUN------------>"
    echo
    let "i+=1"
  done
}

funky
fun
