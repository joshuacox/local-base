#!/bin/sh
TMP=$(mktemp -d -t tmp.XXXXXXXXXX)

CD $TMP
echo local-base|tee $TMP/helloworld
wget -c https://github.com/joshuacox/local-base/archive/master.zip 
unzip master.zip
cd local-base-master
echo "$TMP">GIT_HOME
make fresh
rm -Rf $TMP
