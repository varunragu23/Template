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
echo "Running brute to generate tests in [$fileName] files "
for((i = 1; i <= $tCount; ++i)); do
    name=`printf "%02d" $i`
    echo "==== test $fName.$name ===="
    gtime -f "$fileName.$name gen %e sec, %M KB" ./gen $i > data/$fName.$name.inp
    echo "$fileName.$name data `head -1 data/$fName.$name.inp` "
    #gtime -f "$fileName.$name brute %e sec, %M KB" ./brute < data/$fName.$name.inp > data/$fName.$name.oac &
done
for((i = 1; i <= $tCount; ++i)); do
    name=`printf "%02d" $i`
    gtime -f "$fileName.$name brute %e sec, %M KB" ./brute < data/$fName.$name.inp > data/$fName.$name.oac &
    sleep 0.1
    if (( i % 8 == 0 )); then
        echo "spawned. waiting for completion"
        wait
    fi
done
echo "spawned. waiting for completion"
wait
echo "completed"
