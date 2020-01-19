progName=a
for((i = 2; i < 4; ++i)); do
    name=`printf "%02d" $i`
    echo "==== test $name ===="
    ./gen $i > $progName.$name.inp
    head -1 $progName.$name.inp
    ./brute < $progName.$name.inp > $progName.$name.oac
done
