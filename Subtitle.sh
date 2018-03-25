#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rDigital;
sleep 3;
$rNum1;
sleep 3;
$rSubtitle;
sleep 3;
#Test all the sizes
for i in 0 1
do
    $rSubtitleSize;
    sleep 2;
    #Test all positions with both sizes
    for i in 0 1
    do 
        $rSubtitlePosition;    
        sleep 2;
    done
done
#Test finish
$rSubtitle;