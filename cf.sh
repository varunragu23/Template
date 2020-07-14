#!/bin/bash

VERSION=3.0
SUBJECT=Create-CF-Projects
USAGE="Usage: cf.sh <contestid> <problemid>"
LANG=cpp
CONTEST=$1
PROBLEM=$2

prepareProblem() {
  PROJECT_NAME=$TASK
  # --- Body --------------------------------------------------------
  #  SCRIPT LOGIC GOES HERE
  if [ -f "${PROJECT_NAME}/a.cpp" ]; then
    return
  fi
  cp -Rf $HOME/SNIPPETS/Template/$LANG/* ./$PROJECT_NAME/
  cp -Rf $HOME/SNIPPETS/Template/$LANG/.vscode ./$PROJECT_NAME/
  cp -Rf $HOME/SNIPPETS/Template/$LANG/.vscode ./
  mv ./$PROJECT_NAME/task.in ./$PROJECT_NAME/${PROJECT_NAME}.in
  cp ./$PROJECT_NAME/in1.txt ./$PROJECT_NAME/${PROJECT_NAME}.in
  if [ -f "${PROJECT_NAME}/a.cpp" ]; then
    sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.cpp"
  fi
  if [ -f "${PROJECT_NAME}/a.py" ]; then
    sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.py"
  fi
  if [ -f "${PROJECT_NAME}/b.cpp" ]; then
    sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/b.cpp"
  fi
  if [ -f "${PROJECT_NAME}/a.java" ]; then
    sed -i '' "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.java"
  fi
  cd $PROJECT_NAME
  if [ ! -d "./lib" ]; then
    mkdir lib
    cp $HOME/SNIPPETS/Template/files/debug.h lib/
    mv b.cpp utils.cpp lib/
  fi
  for f in in*.txt; do mv "$f" "$(echo "$f" | sed s/in/a.0/ | sed s/txt/inp/)"; done
  for f in ans*.txt; do mv "$f" "$(echo "$f" | sed s/ans/a.0/ | sed s/txt/oac/)"; done
  #git init -q
  #git add .
  #git commit -a -m "v0" -q
  cd ..
}

mkdir -p cf/contest

if [ -z "$PROBLEM" ]
then
  cf race $CONTEST
  cd cf/contest
  PROBLEMS=$(ls $CONTEST | tr '\n' ' ')
  cd $CONTEST
  for TASK in $(ls)
  do
    prepareProblem
  done
else
  cd cf/contest
  cf parse $1 $2
  cd $CONTEST
  PROBLEMS="$PROBLEM"
  for TASK in $PROBLEMS
  do
    prepareProblem
  done
fi

#if [ -z "$CONTEST" ]
#then
# echo "Using defaults"
#else
#	cd $CONTEST;
#fi

#echo "working on `pwd`, $CONTEST, $PROBLEM, $PROBLEMS"

if [ ! -z "$PROBLEM" ]
then
  cd $PROBLEM
fi

code .
#code --add ~/SNIPPETS/Selected
