#!/bin/bash
set -e
if [ $# -ne 1 ]; then
    echo "Usage: deploy.sh <Commit Message>"
else
    SCRIPT_DIR=$(dirname $0)
    echo "Script_dir: $SCRIPT_DIR"
    ARTIFACT_DIR=${SCRIPT_DIR}/../artifacts
    PROJECT_ROOT=${SCRIPT_DIR}/..

    #controlling
    echo "Script_dir: $SCRIPT_DIR"
    echo "Artifact_dir: $ARTIFACT_DIR"
    echo "PROJECT_ROOT $PROJECT_ROOT"
    cp ${SCRIPT_DIR}/index.html ${ARTIFACT_DIR}/results/index.html

    cd ${PROJECT_ROOT}
    #mkdir tmp && cd tmp
    git clone https://$GITHUB_TOKEN:x-oauth-basic@github.com/tagman/socket-lib.git tmp > /dev/null 2>&1
    cd tmp/
    git fetch
    git checkout gh-pages
    git pull
    #maybe only delete the files in the folder thats gonna be copied, so we get an complete deploy of all results
    #try: find -type d in artifacts/results/* and delete these folders from the gh-branches, before copying them over again
    #these are all ways for trying to avoid merge conflicts
    #git rm -r *
    for FILE in $(ls ../artifacts/results/); do [ -d $FILE ] && rm -rf ./$FILE; done 
    echo ${PWD}
    cp -Rf ${PWD}/../artifacts/results/* .

    git add .
    git commit -m $1
    git push > /dev/null 2>&1

    #cd ${SCRIPT_DIR}/..

   # git subtree push --prefix=artifacts/results origin gh-pages
fi
