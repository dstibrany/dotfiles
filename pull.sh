#!/bin/bash

if [ -n "$(git status --porcelain)" ]; then
    echo "You have uncommited changes, please commit your changes first"
else
    echo clean
    # git pull
    # git submodule update --recursive
fi