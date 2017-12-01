#!/bin/bash
#

RF=$1
shift

for file in $@; do
  #echo File: $file
  FILENAME=${file%%.*}
  echo "FILENAME: ${FILENAME}"
  HandBrakeCLI -i ${FILENAME}.dv -o ${FILENAME}-RF${RF}.mkv -f mkv -e x264 -q $2 -E faac -vfr --x264-preset veryfast --audio-copy-mask aac,ac3,mp3 -audio-  fallback ffac3 --x264-profile main --h264-level 4.0 -E faac --loose-anamorphic -v > ${FILENAME}-RF${RF}.mkv.txt
done 
