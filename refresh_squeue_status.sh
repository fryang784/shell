#!/bin/bash
# syntax: . scriptname [-u]
# -u: optional; displays squeue for user
# 03Oct23  Richard Yang
nap=1
ACCOUNT=yzhan567
Run=`squeue -rA $ACCOUNT -ho %i -t RUNNING | wc -l`
Pend=`squeue -rA $ACCOUNT -ho %i -t PENDING | wc -l`
Tot=`squeue -rA $ACCOUNT -ho %i | wc -l`

u_flag=false

# Check through command-line arguments
for arg in $@; do
	if [ $arg = '-u' ]; then
		u_flag=true
	fi
done

while [ $Tot -gt 0 ]; do 
	clear
	squeue -A $ACCOUNT 
	echo $Run jobs currently running, $Pend jobs pending, $Tot total.
	if $u_flag ; then
		echo 
		echo Displaying squeue for user:
		squeue -u $USER
	fi 
	echo refresh in $nap s
	sleep $nap
	Run=`squeue -rA $ACCOUNT -ho %i -t RUNNING | wc -l`
	Pend=`squeue -rA $ACCOUNT -ho %i -t PENDING | wc -l`
	Tot=`squeue -rA $ACCOUNT -ho %i | wc -l`
    	echo refreshing...
done
echo "No job in queue!"
