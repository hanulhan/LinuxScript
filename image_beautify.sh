#!/bin/bash
# Param 1 Datei0x400
FILE=$1
for FILE in "$@";
do
  EXT=${FILE##*.}
  NAME=${FILE%.*}
  NEWFILE=${NAME}-beauty.${EXT}
  convert $FILE -normalize -gamma 0.8,0.8,0.8 \
             -colorspace HSL \
             -channel saturation -fx 'min(1.0,max(0.0,3*u.g-1))' \
             -colorspace RGB \
             +dither \
             -posterize 3  \
             $NEWFILE
done
           
           
           
