#!/bin/bash

HOST=$1
OUTFILE=$2

D=$(mkdir -d)
cd $D
openssl s_client -showcerts -verify 5 -connect $HOST:443 </dev/null | awk '/BEGIN/,/END/{ if(/BEGIN/){a++}; out="cert"a".pem"; print >out}'

cat cert*.pem >$OUTFILE
cd -

rm -rf $D
