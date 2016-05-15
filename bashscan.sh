#!/bin/bash

for i in `seq 1 1025`; do
	nc -v -w1 -z $1 $i 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "FOUND PORT $i OPEN ON $i" | tee -a found.txt
	fi
done