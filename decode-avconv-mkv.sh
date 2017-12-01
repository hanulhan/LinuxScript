#!/bin/bash
#

CRF=$1
echo "CRF= ${CRF}"
shift

for file in $@; do
  echo File: $file
  FILENAME=${file%%.*}
  EXT=${file##*.}

  echo "avconv -i ${file} -c:a copy -c:v libx264 -crf ${CRF} ${FILENAME}-x264-${CRF}.mkv > ${FILENAME}-x264-${CRF}.mkv.log"

  avconv -i ${file} -c:a copy -c:v libx264 -crf ${CRF} ${FILENAME}-x264-${CRF}.mkv > ${FILENAME}-x264-${CRF}.mkv.log

done


