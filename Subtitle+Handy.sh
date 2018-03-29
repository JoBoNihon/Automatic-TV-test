#!/bin/bash
#Import remote controller keys
. ./RemoteController.sh

$rDigital;
sleep 3;
$rNum1;
sleep 3;
$rSubtitle;
sleep 3;
$rHandy;
sleep 3;
#Test all subtitles the sizes
for i in 0 1
do
    $rSubtitleSize;
    sleep 2;
    #Test all subtitles positions with both sizes
    for i in 0 1
    do 
        #Test all the handy sizes
        for i in 0 1
        do
            $rHandySize;
            sleep 2;
            #Test all handy positions with both sizes
            for i in $(seq 0 3)
            do 
                $rHandyPosition;  
                sleep 2;
            done
        done
        $rSubtitlePosition;    
        sleep 2;
    done
done
#Test finish
$rHandy;