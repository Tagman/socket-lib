#!/bin/bash

if [[ $# -ne 4 ]]
then
    echo "Usage: -s path/to/search/start/ -d /path/to/deploy/"
else
    PWD=$(pwd)
    SCRIPT_DIR=$(dirname $0)
    echo "Script_dir: ${SCRIPT_DIR}"
    echo "PWD: ${PWD}"
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
    mkdir -p "${DEPLOY}"/binaries
    mkdir -p "${DEPLOY}"/results

    find "${SEARCH}" -iname '*socket.a' -type f -exec cp {} "${DEPLOY}"/binaries \;
    find "${SEARCH}" -iname 'unit_*' -executable -type f -exec cp {} "${DEPLOY}"/binaries \;

    find "${SEARCH}" -iname 'result_*.xml' -type f -exec cp {} "${DEPLOY}"/results \;
    find "${SEARCH}" -iname 'result_*' ! -iname '*.dir' -type d -exec cp -r {} "${DEPLOY}"/results/ \;


fi