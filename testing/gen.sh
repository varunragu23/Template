#!/bin/bash
SUBJECT="Generate Test Cases."
USAGE="Usage: ./run.sh TestCount fileName"

tCount=$1
fileName=$2

if [ -z "$tCount" ]
then
	tCount=5
fi
if [ -z "$fileName" ]
then
	fileName=b
fi
fName=$fileName
for((i = 1; i <= $tCount; ++i)); do
    name=`printf "%02d" $i`
    echo "==== test $fName.$name ===="
    gtime -f "gen %e sec, %M KB" ./gen $i > $fName.$name.inp
    head -1 $fName.$name.inp
    gtime -f "brute %e sec, %M KB" ./brute < $fName.$name.inp > $fName.$name.oac
done
