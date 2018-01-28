#!/bin/bash
# More advanced searching with find

echo making directories..
mkdir -p playground/dir-{00{1..9},0{10..99},100}

echo making files..
touch playground/dir-{00{1..9},0{10..99},100}/file-{A..Z}
sleep 2
echo

echo searching for instances of file-A..
sleep 3
find playground -type f -name 'file-A'
echo

echo total instances of file-A:
find playground -type f -name 'file-A' | wc -l
echo
sleep 3

echo creating timestamp file..
touch playground/timestamp
stat playground/timestamp
echo
sleep 3

echo updating instances of file-B..
sleep 2
find playground -type f -name 'file-B' -exec touch '{}' ';'
sleep 1

echo finding instances of file-B that have been updated..
sleep 2
find playground -type f -newer playground/timestamp
echo
sleep 1

echo finding files and directories with bad permissions..
sleep 2
find playground \( -type f -not -perm 0600 \) -or \( -type d -not -perm 0700 \)
echo

echo updating permissions on these files..
find playground \( -type f -not -perm 0600 -exec chmod 0600 '{}' ';' \) -or \( -type d -not -perm 0700 -exec chmod 0700 '{}' ';' \)
echo
sleep 2

echo all done...goodbye!
