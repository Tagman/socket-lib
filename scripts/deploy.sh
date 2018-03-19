#!/bin/bash
set -e
if [ $# -ne 1 ]; then
    echo "Usage: deploy.sh <Commit Message>"
else
    SCRIPT_DIR=$(dirname $0)
    ARTIFACT_DIR=${SCRIPT_DIR}/../artifacts
    PROJECT_ROOT=${SCRIPT_DIR}/..
    cp ${SCRIPT_DIR}/index.html ${ARTIFACT_DIR}/results/index.html

    cd ${PROJECT_ROOT}
    git clone https://$GITHUB_TOKEN:x-oauth-basic@github.com/tagman/socket-lib.git tmp &2>/dev/null
    cd tmp
    git fetch
    git checkout gh-pages
    git pull
    git rm -r *
    echo ${PWD}
    cp -Rf ${PWD}/../artifacts/results/* .

    git add .
    git commit -m $1
    git push &2>/dev/null

    #cd ${SCRIPT_DIR}/..

   # git subtree push --prefix=artifacts/results origin gh-pages
fi
