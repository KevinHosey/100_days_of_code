#!/bin/bash

# Demonstrate variable scope 1

var1=blah
var2=foo

echo $0 :: var1 : $var1, var2 : $var2

export var1
./05_script_2.sh

echo $0 :: var 1 : $var1. var 2 : $var2