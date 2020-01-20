#!/bin/bash
SUBJECT="Run a program with inputs and time it"
USAGE="Usage: ./run.sh <program> <fileprefix>"

progName=$1
fileName=$2

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
echo "Running [$progName] against [$fileName] tests"
fName=$fileName
for((i = 1; ; ++i)); do
    name=`printf "%02d" $i`
    if [[ ! -f "$fName.$name.inp" ]] ; then
	exit 0
    fi 
    echo "==== test $fName.$name ===="
    head -1 $fName.$name.inp
    gtime -f "$progName %e sec, %M KB" ./$progName < $fName.$name.inp > $fName.$name.out
    diff -w $fName.$name.out $fName.$name.oac || break
done
exit 1
