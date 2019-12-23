#!/bin/bash
# ------------------------------------------------------------------
# [Author] Title
#          Description
# ------------------------------------------------------------------

VERSION=1.0
SUBJECT=Create-USACO-Projects
USAGE="Usage: usaco.sh cpp|java projectName [git]"

# --- Options processing -------------------------------------------
if [ $# -le 1 ] ; then
    echo $USAGE
    exit 1;
fi
LANG=cpp

#shift $(($OPTIND - 1))

LANG=$1
PROJECT_NAME=$2
GIT=$3

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
if [ -f "${PROJECT_NAME}/b.cpp" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/b.cpp"
fi
if [ -f "${PROJECT_NAME}/a.java" ]; then
  sed -i "s/task/${PROJECT_NAME}/g" "$PROJECT_NAME/a.java"
fi
;;
	*)        echo "unknown: $OSTYPE" ;;
esac

cd $PROJECT_NAME
if [[ ! -z "$GIT" ]]; then
	git init
	git add .
	git commit -a -m "v0"
fi

code .
#code --add ~/SNIPPETS/Selected
# -----------------------------------------------------------------
