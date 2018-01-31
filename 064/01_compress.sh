#!/bin/bash
# Compressing and uncompressing files

echo creating foo.txt..
sleep 2
ls -l /etc > foo.txt
ls -l foo.*

echo compressing foo.txt..
sleep 2
gzip foo.txt
ls -l foo.*

echo unzipping foo.txt..
sleep 2
gunzip foo.txt
ls -l foo.*
echo

echo aaand lets do it again...
sleep 4

echo compress again..
sleep 2
gzip foo.txt
ls -l foo.*

echo unzip again..
sleep 2
gzip -tv foo.txt.gz

rm foo.txt.gz

