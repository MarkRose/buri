#!/bin/sh

if [ -f "/bin/gzip.orig" ]; then
    echo Already run, skipping.
    exit 0
fi

if [ ! -f "/usr/bin/pigz" ]; then
    echo Can not find pigz, aborting.
    exit 1
fi

mv /bin/gzip /bin/gzip.orig     && ln -s /usr/bin/pigz /bin/gzip

# older distros dont have this
if [ -f "/usr/bin/unpigz" ]; then
    mv /bin/gunzip /bin/gunzip.orig && ln -s /usr/bin/unpigz /bin/gunzip
fi

exit 0
