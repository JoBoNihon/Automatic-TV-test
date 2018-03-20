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
Aux=1;
    case ${channel:$i:1} in
        1)  eval "rNum${channel:$i:1}";
            echo "$rNum";;
        2)  $rNum2;;
        3)  $rNum3;;
        4)  $rNum4;;
        5)  $rNum5;;
        6)  $rNum6;;
        7)  $rNum7;;
        8)  $rNum8;;
        9)  $rNum9;;
        0)  $rNum10;;
    esac
done
sleep 5;
for i in $(seq 0 2) 
do
    $rOSD;
done
#Test finish