#! /bin/bash -x

set -e

gitdir=$(dirname "$0")
cd "$gitdir"

for i in bin libexec share share/eimg
do
    target="$i" build-aux/gen-makefile-am > "$i/Makefile.inc"
done

autoreconf -vfi
./configure "--prefix=$(pwd)"
make
