#!/bin/bash
SUBJECT="Gen tests, find output using brute and check against progName"
USAGE="Usage: ./tests.sh TestCount progName"
# --- Options processing -------------------------------------------
if [ $# -le 1 ] ; then
    echo $USAGE
    exit 1;
fi

tCount=$1
progName=$2
mkdir -p data

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
    gtime -f "gen %e sec, %M KB" ./gen $i > data/inp
    head -1 data/inp
    gtime -f "brute %e sec, %M KB" ./brute < data/inp > data/oac
    gtime -f "$progName %e sec, %M KB" ./$progName < data/inp > data/out
    diff -w data/out data/oac || break
done
