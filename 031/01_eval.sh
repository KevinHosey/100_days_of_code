#!/bin/bash
# Exercising "eval" ...

y=`eval ls -l`  
echo $y        
echo
echo "$y"      

echo; echo

y=`eval df`     
echo $y        

echo
echo "==========================================================="
echo

eval "`seq 3 | sed -e 's/.*/echo var&=ABCDEFGHIJ/'`"
# var1=ABCDEFGHIJ
# var2=ABCDEFGHIJ
# var3=ABCDEFGHIJ

echo
echo "==========================================================="
echo