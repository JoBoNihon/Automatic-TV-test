#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rNum1;
$rOSD;
sleep 5;
mode="Up"
#Test all channels increasing and decreasing
for i in 0 1
do
    #Test all channels
    for i in $(seq 0 11)
    do 
        eval \$rChannel$mode;    
        sleep 5;       
    done
    mode="Down"
done
#Test finish
for i in $(seq 0 2) 
do
    $rOSD;
done