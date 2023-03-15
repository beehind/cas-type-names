#!/bin/bash
#
# generates names.csv

#preston track "http://ipt.calacademy.org:8080/archive.do?r=type"

preston ls\
 | preston dwc-stream\
 | jq --raw-output '.["http://rs.tdwg.org/dwc/terms/scientificName"]'\
 | sort\
 | uniq\
 | sed 's/^/\t/g'\
 | nomer replace gbif-parse\
 | nomer append discoverlife\
 | grep -v NONE\
 | cut -f2

 



