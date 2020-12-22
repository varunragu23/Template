#!/bin/bash
SUBJECT="Run a program with inputs and time it"
USAGE="Usage: ./run.sh <program> <fileprefix>"
# --- Options processing -------------------------------------------
if [ $# -le 1 ] ; then
    echo $USAGE
    exit 1;
fi

progName=$1
fileName=$2
mkdir -p data
#timer in sec
timer=2
#memory in KB
memory=250000

if [ -z "$progName" ]
then
	progName=a
fi
if [ -z "$fileName" ]
then
	fileName=b
fi

rm -rf data/failed.*
failed=0

echo "Running [$progName] against [$fileName] tests"
fName=$fileName
for((i = 1; ; ++i)); do
    name=`printf "%02d" $i`
    if [[ ! -f "data/$fName.$name.inp" ]] ; then
	exit 0
    fi
    echo "==== test $fName.$name ===="
    head -1 data/$fName.$name.inp
    gtime -f "$progName %e sec, %M KB" ./$progName < data/$fName.$name.inp > data/$fName.$name.out
    diff -w data/$fName.$name.out data/$fName.$name.oac
    if [ "$?" != "0" ]
    then
        ((failed = failed + 1))
        say failed $i.$j
        cp data/$fName.$name.inp data/failed.$i.inp
        cp data/$fName.$name.oac data/failed.$i.oac
        cp data/$fName.$name.out data/failed.$i.out
        # break
    fi
done
if [ "$failed" != "0" ]
then
    echo "Failed $failed Tests"
    exit 1
fi
