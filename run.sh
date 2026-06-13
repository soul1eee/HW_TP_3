#!/bin/bash

if [ "$1" == "build_generator" ]; then
    docker build -t data-generator ./generate

elif [ "$1" == "run_generator" ]; then
    mkdir -p data
    docker run --rm -v "$(pwd)/data:/data" data-generator

elif [ "$1" == "create_local_data" ]; then
    mkdir -p local_data
    python3 generate/generate.py local_data

elif [ "$1" == "build_reporter" ]; then
    docker build -t data-reporter ./reporter

elif [ "$1" == "run_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" data-reporter

elif [ "$1" == "structure" ]; then
    ls -R

elif [ "$1" == "clear_data" ]; then
    rm -f data/*.csv data/*.html
    echo "Папка data очищена от файлов."

elif [ "$1" == "inside_generator" ]; then
    docker run --rm -v "$(pwd)/data:/data" data-generator ls -la /data

elif [ "$1" == "inside_reporter" ]; then
    docker run --rm -v "$(pwd)/data:/data" data-reporter ls -la /data
fi