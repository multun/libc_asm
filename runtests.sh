#!/bin/bash

GRN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m' # No Color

for i in *.test.c; do
    if [ -f "./${i%.*.*}.tbin" ]; then
	printf "Testing %10s " "${i%.*.*}"
        ./${i%.*.*}.tbin
	status=$?
	if [ $status -ne 0 ]; then
	    echo -e "${RED}[KO]${NC}"
	else
	    echo -e "${GRN}[OK]${NC}"
	fi
    fi
done
echo
for i in *.S; do
    if [ ! -f "./${i%.*}.test.c" ]; then
	echo "missing test file for $i"
    fi
done
