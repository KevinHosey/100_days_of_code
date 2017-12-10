#!/bin/bash

# Passing arguments

echo $1 $2 $3 ' -> echo $1 $2 $3'

args=("$@")

echo ${args[0]} ${args[1]} ${args[2]} ' -> args=("$@"); echo ${args[0]} ${args[1]} ${args[2]}'

echo $@ ' -> echo $@'

echo Number of arguments passed: $# ' -> echo Number of arguments passed: $#' 