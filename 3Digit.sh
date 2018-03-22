#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rNum1;
$rOSD;
sleep 5;
read -p "Enter TV channel : " channel
sleep 3;
$r3Digit;
for i in $(seq 0 2)
do
    eval \$rNum${channel:$i:1};
done
sleep 5;
for i in $(seq 0 2) 
do
    $rOSD;
done
#Test finish