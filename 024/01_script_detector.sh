#!/bin/bash
# Script detector  - tests whether all the files
# in the current directroy are scripts or not.

TESTCHARS=2    
SHABANG='#!'  

for file in *  
do
  if [[ `head -c$TESTCHARS "$file"` = "$SHABANG" ]]
  then
    echo "File \"$file\" is a script."
  else
    echo "File \"$file\" is not a script."
  fi
done
  
