#!/usr/bin/env sh
VER=v0.4.1
DIR=~/Downloads
MIRROR=https://github.com/weaveworks/ignite/releases/download/$VER

dl()
{
    APP=$1
    RFILE=$APP$SUFFIX
    URL=$MIRROR/$RFILE
    LFILE=$DIR/$RFILE-$VER

    if [ ! -e $LFILE ];
    then
        wget -q -O $LFILE $URL
    fi

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $VER `sha256sum $LFILE | awk '{print $1}'`
}

dl ignite
