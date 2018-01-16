#!/bin/bash
# A review of awk

echo one two | awk '{print $1}'
echo one two | awk '{print $2}'
echo one two | awk '{print $0}'
echo

awk '{print}' mimi.txt
echo

awk '/iOS HT/' mimi.txt
echo

awk '{print $2, $5;}' mimi.txt
echo

awk 'BEGIN {print "Number\tProduct\t\tRating\tDownloads";} 
	{print $1,"\t",$2,"\t",$3,"\t",$4;}
 	END{print "Report Generated\n--------------";
 	}' mimi.txt
echo

awk '$4 > 10000' mimi.txt
echo

awk '$2 ~/Android/' mimi.txt
echo
