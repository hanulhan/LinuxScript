#!/bin/sh
echo "Anzahl Parameter: $#"
if [ $# -gt 0 ]; then
   File=/home/uli/Logging/${1}-format.log
else
   File=/home/uli/Logging/Philips_format.log
fi
echo "Analyze file: $File"

cat $File | grep -i --colour -e "WIXP TV --> JS" -e "WIXP JS --> TV" -e "Javascript Alert" -e "NEW SESSION" -e "Uncaught exception"  -e "OnKeyReceiveHandler" -e "Injecting keyCode"

