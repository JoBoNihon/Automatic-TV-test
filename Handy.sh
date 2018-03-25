#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rHandy;
sleep 3;
#Test all the sizes
for i in 0 1
do
    $rHandySize;
    sleep 2;
    #Test all positions with both sizes
    for i in $(seq 0 3)
    do 
        $rHandyPosition;    
        sleep 2;
    done
done
#Test finish
$rHandy;
