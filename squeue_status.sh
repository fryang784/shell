#/bin/bash

ACCOUNT=yzhan567
RunNum=`squeue -rA $ACCOUNT -ho %i -t RUNNING | wc -l`
PendingNum=`squeue -rA $ACCOUNT -ho %i -t PENDING | wc -l`
TotNum=`squeue -rA $ACCOUNT -ho %i | wc -l`
echo $RunNum jobs currently running, $PendingNum jobs pending, $TotNum total.
