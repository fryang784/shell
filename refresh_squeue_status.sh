#!/bin/bash
# syntax: . scriptname [-u]
# -u: optional; displays squeue for user
# 03Oct23  Richard Yang
nap=1
ACCOUNT=yzhan567
RunNum=`squeue -rA $ACCOUNT -ho %i -t RUNNING | wc -l`
PendingNum=`squeue -rA $ACCOUNT -ho %i -t PENDING | wc -l`
TotNum=`squeue -rA $ACCOUNT -ho %i | wc -l`
while [ $RunNum -gt 0 ]; do 
	clear
	squeue -A $ACCOUNT 
	echo $RunNum jobs currently running, $PendingNum jobs pending, $TotNum total.
	if [ $# -gt 0 ] && [ $1 = '-u' ]; then
		echo 
		echo Displaying squeue for user:
		squeue -u $USER
	fi 
	echo refresh in $nap s
	sleep $nap
	RunNum=`squeue -rA $ACCOUNT -ho %i -t RUNNING | wc -l`
	PendingNum=`squeue -rA $ACCOUNT -ho %i -t PENDING | wc -l`
	TotNum=`squeue -rA $ACCOUNT -ho %i | wc -l`
    	echo refreshing...
done
echo "No job in queue!"
