cd `pwd`
cf parse
for f in in*.txt; do cp "$f" "$(echo "$f" | sed s/in/a.0/ | sed s/txt/inp/)"; done
for f in ans*.txt; do cp "$f" "$(echo "$f" | sed s/ans/a.0/ | sed s/txt/oac/)"; done
