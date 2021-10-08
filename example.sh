#!/bin/bash

PATH=".:$PATH"

if ! getans.sh 'Shall we proceed?' y ; then
    echo "User said “NO”"
    exit 1
fi

echo "User said “YES”"
# do something usefull
exit 0
