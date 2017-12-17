#!/bin/bash

# Choosing random elements of an array.

Suites="Clubs
Diamonds
Hearts
Spades"

Denominations="2
3
4
5
6
7
8
9
10
Jack
Queen
King
Ace"

suite=($Suites)               
denomination=($Denominations)

num_suites=${#suite[*]}       
num_denominations=${#denomination[*]}

echo -n "${denomination[$((RANDOM%num_denominations))]} of "
echo ${suite[$((RANDOM%num_suites))]}

