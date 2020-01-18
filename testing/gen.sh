for((i = 2; i < 4; ++i)); do
    name=`printf "%02d" $i`
    echo $name
    ./gen $i > b.$name.inp
    ./brute < b.$name.inp > b.$name.oac
done
