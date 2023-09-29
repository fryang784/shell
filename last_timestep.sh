#!/bin/bash
# last_timestep.sh 		print last timestep of dump files supplied by
# 				command line
# syntax: last_timestep.sh path/to/dump
# 11Sep23  Richard Yang
for i in $*
do
	echo $i
	grep -A 1 "ITEM: TIMESTEP" $i | tail -2
done
