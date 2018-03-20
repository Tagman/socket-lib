#!/bin/bash

## Setup
PWD=$(pwd)
SCRIPT_DIR=$(dirname $0)
echo "Script_dir: ${SCRIPT_DIR}"
echo "PWD: ${PWD}"
SCAN=""
COMPILER=""
COVERAGE="OFF"

## Argument parsing
while [[ $# -gt 0 ]]
do
    key="$1"

    case $key in
        -c|--coverage)
        COVERAGE="ON"
        shift #shift past argument
        ;;
        -s|--static)
        if [ "$CXX" = "clang++" ]; then
            echo "clang detected from build script"
            COMPILER="--use-c++=clang++ --use-cc=clang"
        fi
        SCAN="scan-build ${COMPILER} -o result_scan"
        shift
        ;;
        *) # unknown option
        echo "Usage:" 
        echo "-c | --coverage --> coverage on"
        echo "-s | --static --> clang static analyzer on"
        shift
        ;;
    esac
done

## Checking
echo "SCAN: ${SCAN}"
echo "COV: ${COVERAGE}"

## Configure build
${SCAN} cmake -DCMAKE_BUILD_TYPE=UnitTest -DCOVERAGE="${COVERAGE}" -DCOV_OUTPUT="${COVERAGE}" ../..

## Build    
if [ "$COVERAGE" == "ON" ]
then
    ${SCAN} make result_coverage
else
    ${SCAN} make unit_TCP
    ./unit_TCP --gtest_output="xml:result_unit.xml"
fi

## stage scan results better
if [ -n "$SCAN" ]
then
    cd result_scan/*
    OUTPUT=$(pwd)
    mv * ..
    cd -
    rmdir ${OUTPUT}
    
fi

make stage


