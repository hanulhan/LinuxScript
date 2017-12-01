#!/bin/bash
# Param 1 Datei oder ./scan/*.png
# Bei schlecher Qualität -posterize erhöhen
FILE=$1

CURRENT_DIR=$(readlink -f .)

echo "CurrentDir: ${CURRENT_DIR}"

if [ ! -d "gif" ]; then
  mkdir gif
fi


if [ ! -d "pdf" ]; then
  mkdir pdf
fi

rm *.txt
BASENAME_HELP1=${1%.*}
BASENAME_HELP2=${BASENAME_HELP1%%-Seite*}
BASENAME=$(basename ${BASENAME_HELP2})
echo "Basename: ${BASENAME}"
for FILE in "$@";
do

  EXT=${FILE##*.}
  NAME=${FILE%.*}
 
 
  NAME_PART1_HELP=${NAME%%-Seite*}
  NAME_PART1=$(basename ${NAME_PART1_HELP})
  NAME_PART2_HELP=${NAME##*${NAME_PART1_HELP}}
  NAME_PART2=${NAME_PART2_HELP##*-}
  SEITE=${NAME_PART2##*Seite}

  echo "NAME: ${NAME}"
  echo "NAME_PART1_HELP: ${NAME_PART1_HELP}"
  echo "NAME_PART2_HELP: ${NAME_PART2_HELP}"
  echo -e "Part1: ${NAME_PART1} \nPart2: ${NAME_PART2} \nSeite: ${SEITE}"

  BEAUTY_FILE=${NAME_PART1}-${EXT}-beauty-${NAME_PART2}

  PARAM="$FILE -normalize -gamma 0.8,0.8,0.8 -colorspace HSL -channel saturation -fx 'min(1.0,max(0.0,3-1))' -colorspace RGB +dither -posterize 4 ${BEAUTY_FILE}.${EXT}"
  echo "convert ${PARAM}" > ${NAME_PART1}-${EXT}-beauty-${NAME_PART2}.param
  convert ${PARAM}

  TIFF_FILE=${NAME_PART1}-${EXT}-beauty-${NAME_PART2}
  echo "convert ${BEAUTY_FILE}.${EXT} ${TIFF_FILE}.tiff"
  convert ${BEAUTY_FILE}.${EXT} ${TIFF_FILE}.tiff

  GIF_FILE=${NAME_PART1}-${EXT}-beauty-tiff-${NAME_PART2}
  echo "convert ${TIFF_FILE}.tiff ./gif/${GIF_FILE}.gif"
  convert ${TIFF_FILE}.tiff ./gif/${GIF_FILE}.gif

  
  PDF_FILE=${NAME_PART1}-${EXT}-beauty-tiff-gif-${NAME_PART2}
  echo "convert ./gif/${GIF_FILE}.gif ./pdf/${PDF_FILE}.pdf"
  convert ./gif/${GIF_FILE}.gif ./pdf/${PDF_FILE}.pdf

  rm ${BEAUTY_FILE}.${EXT}
  rm ${TIFF_FILE}.tiff


  if [ -f ${NAME_PART1}.txt ]; then
    echo "Datei existiert"
    echo "${CURRENT_DIR}/gif/${GIF_FILE}.gif" >> ${NAME_PART1}.txt
  else 
    echo "Datei existiert noch nicht"
    echo -e "\n${CURRENT_DIR}/gif/${GIF_FILE}.gif" > ${NAME_PART1}.txt
  fi
done
echo "Finished document-beautify2"

if [ ${SEITE} -gt 1 ]; then
  echo "Start pdf-conversion"
  rm ./pdf/*.pdf
  convert @${BASENAME}.txt ./pdf/${BASENAME}.pdf
fi

         
