#!/bin/bash
userid='fyang52'
echo $USER
nap=1
n=`squeue -hu $USER | wc -l`
while [ $n -gt 0 ]; do 
	clear
	squeue -u $USER
	echo $n jobs running... refresh in $nap s
	sleep $nap
    	echo refreshing...
	n=`squeue -hu $USER | wc -l`
done
echo "job done!"
