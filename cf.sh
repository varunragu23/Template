#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------

VERSION=3.0
SUBJECT=Create-CF-Projects
USAGE="Usage: cf.sh <contestid> <problemid>"
LANG=cpp
CONTEST=$1
PROBLEM=$2

echo "working on `pwd`"
cf parse $1 $2

if [ -z "$CONTEST" ]
then
 echo "Using defaults"
else
	cd $CONTEST;
fi

for TASK in $(ls)
do
PROJECT_NAME=$TASK

# --- Body --------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
cp -Rf $HOME/Code/Template/$LANG/* ./$PROJECT_NAME/
cp -Rf $HOME/Code/Template/$LANG/.vscode ./$PROJECT_NAME/
cp -Rf $HOME/Code/Template/$LANG/.vscode ./
mv ./$PROJECT_NAME/task.in ./$PROJECT_NAME/${PROJECT_NAME}.in
cp ./$PROJECT_NAME/in1.txt ./$PROJECT_NAME/${PROJECT_NAME}.in
if [ -f "${PROJECT_NAME}/a.cpp" ]; then
  sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.cpp"
fi
if [ -f "${PROJECT_NAME}/b.cpp" ]; then
  sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/b.cpp"
fi
if [ -f "${PROJECT_NAME}/a.java" ]; then
  sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.java"
fi

cd $PROJECT_NAME
for f in in*.txt; do cp "$f" "$(echo "$f" | sed s/in/a.0/ | sed s/txt/inp/)"; done
for f in ans*.txt; do cp "$f" "$(echo "$f" | sed s/ans/a.0/ | sed s/txt/oac/)"; done
git init -q
git add .
git commit -a -m "v0" -q
cd ..

done

code .
code --add ~/SNIPPETS/Selected
