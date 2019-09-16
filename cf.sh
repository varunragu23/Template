#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------

VERSION=1.0
SUBJECT=Create-CF-Projects
USAGE="Usage: cf.sh <contestid> <problemid>"
LANG=cpp
CONTEST=$1
PROBLEM=$2

if [ -z "$CONTEST" ]
then
 echo "Using defaults"
else
	mkdir $CONTEST;
	cd $CONTEST;
fi

echo "working on `pwd`"
cfp.sh $1 $2

for TASK in $(ls)
do
PROJECT_NAME=$TASK

# --- Body --------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
echo "Creating $LANG project in $PROJECT_NAME directory"

cp -Rf $HOME/Code/Template/$LANG/* ./$PROJECT_NAME/
mv ./$PROJECT_NAME/task.in ./$PROJECT_NAME/${PROJECT_NAME}.in
if [ -f "${PROJECT_NAME}/a.cpp" ]; then
  sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.cpp"
fi
if [ -f "${PROJECT_NAME}/Task.java" ]; then
  sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/Task.java"
fi

cd $PROJECT_NAME
git init
git add .
git commit -a -m "v0"
cd ..

done

code .
