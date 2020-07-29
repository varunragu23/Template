#!/bin/bash

SUBJECT="Run against usaco inputfiles"
USAGE="usacotests.sh [url]"
# --- Options processing -------------------------------------------

url=$1
mkdir -p data
cd data

if [ $# -eq 1 ]
then
  rm *.zip
  wget -O a.zip $url
  unzip -o a.zip
fi

rm -rf failed.*

progName=../a
failed=0
tCount=20
for((i = 1; i <= $tCount; ++i)); do
    if [ ! -f "$i.in" ]; then
      break;
    fi

    name=`echo "$i" | cut -d'.' -f1`
    echo "==== test $name ===="
    gtime -f "$progName %e sec, %M KB" $progName < $name.in > $name.realout
    diff -w $name.realout $name.out
    if [ "$?" != "0" ]
    then
        ((failed = failed + 1))
        cp $name.in failed.$i.in
        cp $name.out failed.$i.out
        cp $name.realout failed.$i.realout
    fi
done

if [ "$failed" != "0" ]
then
    echo "Failed $failed Tests"
    exit 1
fi
