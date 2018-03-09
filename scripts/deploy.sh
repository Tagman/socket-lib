#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: deploy.sh <Commit Message>"
else
    SCRIPT_DIR=$(dirname $0)
    ARTIFACT_DIR=${SCRIPT_DIR}/../artifacts
    cp ${SCRIPT_DIR}/index.html ${ARTIFACT_DIR}/results/index.html

    git add ${ARTIFACT_DIR}/results/
    git commit -m $1

    cd ${SCRIPT_DIR}/..

    git subtree push --prefix=${ARTIFACT_DIR}/results origin gh-pages
fi