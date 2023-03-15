#!/bin/bash
#
# generates names.csv

#preston track "http://ipt.calacademy.org:8080/archive.do?r=type"

preston cat hash://sha256/fd4193a633826e584205d6c190cf4314b707937f6072515edc0d69a61737e5d5\
 | preston dwc-stream\
 | jq --raw-output '.["http://rs.tdwg.org/dwc/terms/scientificName"]'\
 | sort\
 | uniq\
 | sed 's/^/\t/g'\
 | nomer replace gbif-parse\
 | nomer append discoverlife\
 | grep -v NONE\
 | cut -f2

 



