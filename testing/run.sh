progName=a
for((i = 1; ; ++i)); do
    name=`printf "%02d" $i`
    if [[ ! -f "$progName.$name.inp" ]] ; then
	exit 0
    fi 
    echo "==== test $name ===="
    head -1 $progName.$name.inp
    time ./a < $progName.$name.inp > $progName.$name.out
    diff -w $progName.$name.out $progName.$name.oac || break
done
exit 1
