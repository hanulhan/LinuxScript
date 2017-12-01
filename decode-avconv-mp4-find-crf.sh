#!/bin/bash
#

CRF=17
File=$1
echo "Test CRF von 17 .. 23"
FILENAME=${File%%.*}
EXT=${File##*.}


while [ $CRF -le 24 ]; do
  echo "CRF= ${CRF}"

  echo "avconv -i ${File} -c:a copy -c:v libx264 -crf ${CRF} ${FILENAME}-x264-${CRF}.mp4 > ${FILENAME}-x264-${CRF}.mp4.log"
  avconv -i ${File} -c:a copy -c:v libx264 -crf ${CRF} ${FILENAME}-x264-${CRF}.mp4 > ${FILENAME}-x264-${CRF}.mp4.log
  CRF=`expr $CRF + 1`

done


