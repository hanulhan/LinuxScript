#!/bin/bash
CONFIG_FILE="/home/uli/Logging/Philips_putty_pid"

#Read LogFileName
#read -p "Filename: " LogFileName

#Read the config file
echo "Reading config..." >&2
if [ ! -f $CONFIG_FILE ]; then
    echo "File $CONFIG_FILE not found!"
fi
source $CONFIG_FILE &>/dev/null
#echo $?
echo "Config for pidPutty: $pidPutty" >&2
echo "Config for pidXterm: $pidXterm" >&2
echo "Config for pidFormat: $pidFormat" >&2

#Stop putty
echo "sudo kill $pidPutty"
sudo kill $pidPutty
echo "sudo kill $pidXterm"
sudo kill $pidXterm
echo "sudo kill $pidFormat"
sudo kill $pidFormat

#mv /home/uli/Logging/Philips.log /home/uli/Logging/${LogFileName}.log
#mv /home/uli/Logging/Philips_format.log /home/uli/Logging/${LogFileName}-format.log
#chown uli:uli /home/uli/Logging/${LogFileName}*
#chmod 775 /home/uli/Logging/${LogFileName}*
