#!/bin/bash
#

CRF=$1
echo "CRF= ${CRF}"
shift

for file in $@; do
  echo File: $file
  FILENAME=${file%%.*}
  EXT=${file##*.}

  echo "avconv -i ${file} -c:a:2 copy -c:v libx264 -map 0:a -map 0:v -crf ${CRF} ${FILENAME}-x264-${CRF}.mp4 > ${FILENAME}-x264-${CRF}.mp4.log"

  avconv -i ${file} -c:a copy -c:v libx264 -map 0:a -map 0:v -crf ${CRF} ${FILENAME}-x264-${CRF}.mp4 > ${FILENAME}-x264-${CRF}.mp4.log

done


