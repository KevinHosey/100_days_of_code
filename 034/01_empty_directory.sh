#!/bin/bash
# test for empty directoy

if [ -z "$(ls -A /Users/kevin/code)" ]; then
   echo "Empty"
else
   echo "Not Empty"
fi
