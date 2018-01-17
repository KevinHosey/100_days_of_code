#!/bin/bash
# Unsetting a variable.

variable=hello_bitcoin                       
echo "variable = $variable"

unset variable                      
                                                           
echo "(unset) variable = $variable"  

if [ -z "$variable" ]                
then
  echo "\$variable has length ${#variable}"
fi
