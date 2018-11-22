#!/bin/bash
#


for file in $@; do
  echo File: $file
  FILENAME=${file%%.*}
  EXT=${file##*.}
  sudo avconv -i ${file} ${FILENAME}.mp3
done


