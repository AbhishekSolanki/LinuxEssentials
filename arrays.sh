#!/bin/bash

# arrays

# associative array
declare -a numbers 
numbers=( ["1"]="one" ["2"]="two" ["3"]=three )
# value of 1
echo "${numbers[1]}"
# all Keys
echo "${!numbers[@]}"
# all values
echo "${numbers[@]}"
# set the value
numbers['2']='TWO'
echo "${numbers[2]}"