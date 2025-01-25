#!/usr/bin/env bash

function installPackage {
    url=$1
    name=$2

    prefix=./packages/$name
    folder=$prefix
    flag="-f"

    # Download if file is not already downloaded
    if [ ! -d $folder ]; then
        wget --quiet $url -P $prefix
        echo "External package '$name' downloaded."
    else
        echo "External package '$name' already exists."
    fi
}

installPackage $1 $2 $3