#!/bin/bash

if [ -z $1 ]; then
	echo "Usage: ./bashscan.sh 127.0.0.1"
	exit 1
fi

echo "Starting TCP portscan of $1"

for i in `seq 1 1025`; do
	nc -v -w1 -z $1 $i 2>/dev/null
	if [ $? -eq 0 ]; then
		echo "FOUND PORT $i OPEN ON $i" | tee -a found.txt
	fi
done
