#!/bin/bash
# A review of basic sed operations

sed -n '3'p stuff.txt
echo

sed -n '4,8'p stuff.txt
echo

sed -n '$'p stuff.txt
echo

sed -n /Music/p stuff.txt
echo

sed -n '/Reading/,9p' stuff.txt
echo

sed -n '/Coding/,$p' stuff.txt
echo

sed -n -e '/Sleeping/p' -e '/Döners/p' stuff.txt
echo
