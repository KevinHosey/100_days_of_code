#!/bin/bash
# creating tar archive

echo making playground directory and files..
sleep 2
mkdir -p playground/dir-{00{1..9},0{10..99},100}
touch playground/dir-{00{1..9},0{10..99},100}/fileA

echo making tar archive of playground directory..
sleep 2
tar cf playground.tar playground

echo listing contents of archive:
sleep 2
tar tf playground.tar
echo

echo more detail? Sure..
sleep 2
tar tvf playground.tar
echo

