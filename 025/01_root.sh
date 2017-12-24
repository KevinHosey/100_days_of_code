#!/bin/bash
# Check for root

ROOT_UID=0   

if [ "$UID" -eq "$ROOT_UID" ]  
then
  echo "You are root."
else
  echo "You are just an ordinary user."
fi
