#!/bin/bash

# and example

if [ $USER == 'bob' ] || [ $USER == 'andy' ]
then
	ls -alh
else 
	ls
fi