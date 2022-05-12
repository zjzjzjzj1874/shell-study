#!/bin/bash -e

MAX_VERSION=999
STEP=1

major=$(cat .version | awk -F "." '{printf$1}')
minor=$(cat .version | awk -F "." '{printf$2}')
patch=$(cat .version | awk -F "." '{printf$3}')

patch=$(expr $patch + $STEP)

if [ ${patch} -gt ${MAX_VERSION} ]; then
  patch=0
  minor=$(expr $minor + $STEP)
fi

if [ ${minor} -gt ${MAX_VERSION} ]; then
  minor=0
  major=$(expr $major + $STEP)
fi

echo "$major.$minor.$patch" >.version
