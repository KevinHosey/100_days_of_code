#!/bin/bash
# data extraction 

echo `sed 's/[^0-9]//g' test.txt` | sed 's/ / /g'
