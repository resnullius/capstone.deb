#!/bin/sh

set -e

VERSION=$2
FILE=$3

NEWVERSION=${VERSION}+dfsg
NEWFILE=../capstone_${NEWVERSION}.orig.tar.xz

echo "Generating ${NEWFILE} ..."
zcat $FILE \
    | tar --wildcards --delete -f - '*/osxkernel_inttypes.h' \
    | xz -c > ${NEWFILE}.t

mv ${NEWFILE}.t ${NEWFILE}
