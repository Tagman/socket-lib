#!/bin/bash

if [[ $# -ne 4 ]]
then
    echo "Usage: -s path/to/search/start/ -d /path/to/deploy/"
else
    echo "Dirname :`dirname $0`"
    echo "PWD: `pwd`"
    SEARCH=""
    DEPLOY=""

while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        -s|--searchPath)
        SEARCH="$2"
        shift #shift past argument
        shift #shift past value
        ;;
        -d|--deployPath)
        DEPLOY="$2"
        shift
        shift
        ;;
    esac
    done
    echo ${SEARCH}
    echo ${DEPLOY}
    find ${SEARCH} -iname '*.a' -exec cp {} ${DEPLOY} \;
fi