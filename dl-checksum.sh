#!/usr/bin/env bash
set -e
DIR=~/Downloads
MIRROR=https://github.com/weaveworks/ignite/releases/download

dl()
{
    local app=$1
    local ver=$2
    local arch=$3
    local rfile=$app-$arch
    local url=$MIRROR/$ver/$rfile
    local lfile=$DIR/$rfile-$ver

    if [ ! -e $lfile ];
    then
        wget -q -O $lfile $url
    fi

    printf "      # %s\n" $url
    printf "      %s: sha256:%s\n" $arch $(sha256sum $lfile | awk '{print $1}')
}

dl_ver() {
    local app=$1
    local ver=$2
    printf "    %s:\n" $ver
    dl $app $ver amd64
    dl $app $ver arm64
}

dl_checksums() {
    local vers=$1
    printf "weaveworks_ignite_checksums:\n"
    printf "  ignite:\n"
    for ver in $vers; do
        dl_ver ignite $ver
    done
    printf "  ignited:\n"
    for ver in $vers; do
        dl_ver ignited $ver
    done
}

dl_checksums ${1:-v0.10.0}
