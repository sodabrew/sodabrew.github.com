#!/bin/sh

wget --spider --recursive --no-verbose --output-file=$1-wgetlog.txt $1
perl -ne '/^.+ URL: ?([^ ]+).+$/; print $1, "\n";' $1-wgetlog.txt | sort | uniq > $1-sitemap.txt
