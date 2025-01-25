#!/usr/bin/env bash

function installPackage {
    url=$1
    name=$2

    folder=./packages/$name

    # Download if file is not already downloaded
    if [ ! -d $folder ]; then
        wget --quiet $url -P $folder
        echo "External package '$name' downloaded."
    else
        echo "External package '$name' already exists."
    fi
}

installPackage $1 $2 $3