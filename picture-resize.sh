#!/bin/bash
# Param 1 resolution, z.B. 400x400
# Param 2 Dateitype,  z.B. jpg
RESOLUTION=$1
TYPE=$2
echo "Resolution: $RESOLUTION"
echo "Type      : $TYPE"
shift
shift

for FILE in *.$TYPE
do
  EXT=${FILE##*.}
  NAME=${FILE%.*}
  NEWFILE=${NAME}_${RESOLUTION}.${EXT}
  
  convert $FILE -resize $RESOLUTION $NEWFILE;  
done
