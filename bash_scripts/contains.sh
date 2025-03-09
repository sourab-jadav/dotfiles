#!/bin/bash


read what
echo "you printed "${what}""
string_var="Apple is a good"

if echo "$string_var" | grep -q "fruit"; then 
    echo "contains fruit"
else 
    echo "no fruit"
fi


