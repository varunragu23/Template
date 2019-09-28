#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------

VERSION=1.0
SUBJECT=Create-USACO-Projects
USAGE="Usage: usaco.sh cpp|java projectName"

# --- Options processing -------------------------------------------
if [ $# -le 1 ] ; then
    echo $USAGE
    exit 1;
fi
LANG=cpp

#shift $(($OPTIND - 1))

LANG=$1
PROJECT_NAME=$2

# --- Body --------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
echo "Creating $LANG project in $PROJECT_NAME directory"

rm -rf ./$PROJECT_NAME

cp -Rf $HOME/Code/Template/$LANG ./$PROJECT_NAME
mv ./$PROJECT_NAME/task.in ./$PROJECT_NAME/${PROJECT_NAME}.in
if [ -f "${PROJECT_NAME}/a.cpp" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.cpp"
fi
if [ -f "${PROJECT_NAME}/Task.java" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/Task.java"
fi

cd $PROJECT_NAME
git init
git add .
git commit -a -m "v0"

code $PROJECT_NAME
# -----------------------------------------------------------------
