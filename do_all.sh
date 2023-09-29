#!/bin/bash

# do_all.sh
# 			apply $1 to all rest of the command line argument 
# 17Sep23  Richard Yang

# Check if at least one argument is provided
if [ $# -lt 2 ]; then
    echo "Usage: $0 python_script.py arg2 [arg3 ...]"
    exit 1
fi

for i in ${@:2}
do 
	echo doing action: $1 $i
	$1 $i
	echo
done
