#!/bin/bash
# rsync

echo making playground directory and files..
sleep 2
mkdir -p playground/dir-{00{1..9},0{10..99},100}
touch playground/dir-{00{1..9},0{10..99},100}/file{1..9}

echo making empty foo directory..
sleep 2
mkdir foo

echo synchronizing foo with playground..
sleep 1
rsync -av playground foo 
echo

echo modyfying playground..
sleep 2
touch playground/dir-099/fileZ

echo sync again..
sleep 1
rsync -av playground foo
echo


echo making imaginary external hd..
sleep 2
mkdir backup

echo synchronizing some directories with hd..
sleep 1
rsync -av --delete /etc /home /usr/local backup

echo
