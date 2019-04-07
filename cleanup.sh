find . -type f -name 'a.out' -delete
find . -type f -name 'a' -delete
find . -type f -name '*.exe' -delete
find . -type f -name '*.class' -delete
find . -type f -name 'a1' -delete
find . -type f -name 'a2' -delete
find . -type d -name '*.dSYM' | xargs rm -r
find . -type d -name 'ipch' | xargs rm -r

