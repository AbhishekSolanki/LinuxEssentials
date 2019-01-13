#!/bin/bash

# array
alphabets=(a b c d)
# array size
echo ${#alphabets[@]}
# values
echo ${alphabets[@]}
# access by index and change value
alphabets[0]="A"
echo ${alphabets[0]}

# associative array
# this can be used as key value pairs
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