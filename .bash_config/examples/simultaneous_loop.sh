#!/bin/bash

LIST_1=(Canada Venezuela Germany)
LIST_2=("North America" "South America" Europe)
LIST_3=(English Spanish Deutsch)

# The ! exclamation infront of the array name !LIST_1 
# Causes the lists to synrchonize
echo -e "\nExclamation before !array"
for i in "${!LIST_1[@]}"; do
	echo "${LIST_1[i]} is in ${LIST_2[i]} and speaks ${LIST_3[i]}"
done


# Example without !exclamation before array
echo -e "\nNo exclamation before array"
for i in "${!LIST_1[@]}"; do
	echo "${LIST_1[i]} is in ${LIST_2[i]} and speaks ${LIST_3[i]}"
done
