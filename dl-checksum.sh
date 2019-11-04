#!/usr/bin/env sh
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
    printf "      %s: sha256:%s\n" $arch `sha256sum $lfile | awk '{print $1}'`
}

dl_ver() {
    local app=$1
    local ver=$2
    printf "    %s:\n" $ver
    dl $app $ver amd64
    dl $app $ver arm64
}

VERS=${1:-v0.5.0 v0.5.1 v0.5.2 v0.5.3 v0.5.4 v0.5.5 v0.6.0 v0.6.1 v0.6.2}
printf "weaveworks_ignite_checksums:\n"
printf "  ignite:\n"
for ver in $VERS; do
    dl_ver ignite $ver
done
printf "  ignited:\n"
for ver in $VERS; do
    dl_ver ignited $ver
done
