#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------

SWAP=""
VERSION=1.0
SUBJECT=Create-USACO-Projects
USAGE="Usage: usaco.sh cpp|java projectName [vishal] [git]"

# --- Options processing -------------------------------------------
if [ $# -le 1 ] ; then
    echo $USAGE
    exit 1;
fi
LANG=cpp

#shift $(($OPTIND - 1))

LANG=$1
PROJECT_NAME=$2
SWAP=$3
GIT=$4

# --- Body --------------------------------------------------------
#  SCRIPT LOGIC GOES HERE
echo "Creating $LANG project in $PROJECT_NAME directory"

rm -rf ./$PROJECT_NAME

cp -Rf $HOME/SNIPPETS/Template/$LANG ./$PROJECT_NAME
mv ./$PROJECT_NAME/task.in ./$PROJECT_NAME/${PROJECT_NAME}.in
case "$OSTYPE" in
	darwin*)  

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
;;
	linux*)  
if [ -f "${PROJECT_NAME}/a.cpp" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.cpp"
fi
if [ -f "${PROJECT_NAME}/a.py" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.py"
fi
if [ -f "${PROJECT_NAME}/b.cpp" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/b.cpp"
fi
if [ -f "${PROJECT_NAME}/a.java" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.java"
fi
;;
	*)        echo "unknown: $OSTYPE" ;;
esac

if [[ ! -z "$SWAP" ]]; then
mv $PROJECT_NAME/a.cpp $PROJECT_NAME/b1.cpp
mv $PROJECT_NAME/b.cpp $PROJECT_NAME/a.cpp
mv $PROJECT_NAME/b1.cpp $PROJECT_NAME/b.cpp
fi

cd $PROJECT_NAME
mkdir lib
cp $HOME/SNIPPETS/Template/files/debug.h lib/
mv b.cpp utils.cpp lib/
if [[ ! -z "$GIT" ]]; then
	git init
	git add .
	git commit -a -m "v0"
fi


code .
#code --add ~/SNIPPETS/Selected
# -----------------------------------------------------------------
