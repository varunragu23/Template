#!/bin/bash
SUBJECT="Gen tests, find output using brute and check against progName"
USAGE="Usage: ./tests.sh TestCount progName parallelCount"
# --- Options processing -------------------------------------------
if [ $# -le 1 ] ; then
    echo $USAGE
    exit 1;
fi

tCount=$1
progName=$2
parallelCount=$3
mkdir -p data

if [ -z "$tCount" ]
then
	tCount=99
fi
if [ -z "$progName" ]
then
	progName=a
fi
if [ -z "$parallelCount" ]
then
	parallelCount=6
fi
rm -rf data/failed.*
rm -rf data/inp*
rm -rf data/oac*
rm -rf data/out*
failed=0
for((i = 1; i <= $tCount; ++i)); do
    name=`printf "%02d" $i`
    echo "==== test $name ===="
    for((j = 1; j <= $parallelCount; ++j)); do
        gtime -f "$i.$j gen %e sec, %M KB" ./gen > data/inp$j
        echo "$i.$j `head -1 data/inp$j`"
        gtime -f "$i.$j brute %e sec, %M KB" ./brute < data/inp$j > data/oac$j &
        sleep 0.1
    done
    echo "spawned brute. waiting for completion"
    wait
    for((j = 1; j <= $parallelCount; ++j)); do
        gtime -f "$i.$j $progName %e sec, %M KB" ./$progName < data/inp$j > data/out$j
        diff -w data/out$j data/oac$j
        if [ "$?" != "0" ]
        then
            ((failed = failed + 1))
            say failed $i.$j
            cp data/inp$j data/failed.$i.inp$j
            cp data/oac$j data/failed.$i.oac$j
            cp data/out$j data/failed.$i.out$j
        fi
    done
done
rm -rf data/inp*
rm -rf data/oac*
rm -rf data/out*
if [ "$failed" != "0" ]
then
    echo "Failed $failed Tests"
    exit 1
fi
exit 0
