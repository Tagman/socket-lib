#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: deploy.sh <Commit Message>"
else
    SCRIPT_DIR=$(dirname $0)
    cp ${SCRIPT_DIR}/index.html ${SCRIPT_DIR}/../artifacts/results/index.html

    git add artifacts/results/
    git commit -m $1

    git subtree push --prefix=${SCRIPT_DIR}/../artifacts/results origin gh-pages
fi