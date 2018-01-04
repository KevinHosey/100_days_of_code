#!/bin/bash
# site checker

if curl -s --head  --request GET https://github.com | grep "200 OK" > /dev/null; then 
   echo "Site is UP"
else
   echo "Site is DOWN"
fi

