#!/bin/bash

if [ "$1" = "" ]; then
    echo -n "Input your target:"
    read TARGET
else
    TARGET="$1"
fi

case $TARGET in
    13U02-REL)
        wget http://git.tp-link.net/jenkins/view/Linux/job/MR12U_V2.0/lastSuccessfulBuild/artifact/proprietary.tar.gz
        ;;
    12U02-REL)
        wget http://git.tp-link.net/jenkins/view/Linux/job/MR12U_V2.0/lastSuccessfulBuild/artifact/proprietary.tar.gz
        ;;
    *)
        echo "unknow target:$TARGET"
        exit 1
        ;;
esac

tar -xvzf proprietary.tar.gz
