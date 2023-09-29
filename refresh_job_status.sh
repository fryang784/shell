#!/bin/bash
userid='fyang52'
nap=1
n=`squeue -hu $userid | wc -l`
while [ $n -gt 0 ]; do 
	clear
	squeue -u $userid
	echo $n jobs running... refresh in $nap s
	sleep $nap
    	echo refreshing...
	n=`squeue -hu $userid | wc -l`
done
echo "job done!"
