#!/bin/bash
# Creating, moving, copying files & directories

echo making playground..
mkdir playground
sleep 2

cd playground
echo making dir1 and dir2..
mkdir dir1 dir2
sleep 2

echo copying etc directory to current directory..
cp -v /etc/passwd .
sleep 2

echo priting current directory:
ls -l
sleep 3

echo moving passwd to fun..
mv passwd fun
sleep 2

echo making some symbolic links..
ln -s fun fun-sys
ln -s ../fun dir1/fun-sym
ln -s ../fun dir2/fun-sym
sleep 2

echo priting dir1:
ls -l dir1

echo another symbolic link..
ln -s dir1 dir1-sym
sleep 2

ls -l 
