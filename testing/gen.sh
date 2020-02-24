#!/bin/bash
SUBJECT="Generate Test Cases."
USAGE="Usage: ./run.sh TestCount fileName"
# --- Options processing -------------------------------------------
if [ $# -le 1 ] ; then
    echo $USAGE
    exit 1;
fi

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
mkdir -p data
fName=$fileName
for((i = 1; i <= $tCount; ++i)); do
    name=`printf "%02d" $i`
    echo "==== test $fName.$name ===="
    gtime -f "gen %e sec, %M KB" ./gen $i > data/$fName.$name.inp
    head -1 data/$fName.$name.inp
    gtime -f "brute %e sec, %M KB" ./brute < data/$fName.$name.inp > data/$fName.$name.oac
done
