#!/bin/bash
SUBJECT="Gen tests, find output using brute and check against progName"
USAGE="Usage: ./tests.sh TestCount progName"

tCount=$1
progName=$2

if [ -z "$tCount" ]
then
	tCount=99
fi
if [ -z "$progName" ]
then
	progName=a
fi

for((i = 1; i <= $tCount; ++i)); do
    name=`printf "%02d" $i`
    echo "==== test $name ===="
    gtime -f "gen %e sec, %M KB" ./gen $i > inp
    head -1 inp
    gtime -f "brute %e sec, %M KB" ./brute < inp > oac
    gtime -f "$progName %e sec, %M KB" ./$progName < inp > out
    diff -w out oac || break
done
