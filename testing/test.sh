progName=a
for((i = 1; ; ++i)); do
    echo "==== random test $i ===="
    ./gen $i > int
    # head -1 int
    time ./$progName < int > out1
    ./brute < int > out2
    diff -w out1 out2 || break
    #diff -w <(./a < int) <(./brute < int) || break
done
