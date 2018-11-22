#!/bin/bash
PATH_TO_FILE=/home/uli/Logging
CONFIG_FILE=$PATH_TO_FILE/Philips_putty_pid
LOG_FILE=$PATH_TO_FILE/Philips.log
LOG_FILE_FORMAT=$PATH_TO_FILE/Philips_format.log

export CONFIG_FILE
export LOG_FILE
export LOG_FILE_FORMAT


#Delete old log-files
if [ -f $CONFIG_FILE ];
then
    sudo rm $CONFIG_FILE
fi
if [ -f $LOG_FILE ];
then
    sudo rm $LOG_FILE
fi
if [ -f $LOG_FILE_FORMAT ];
then
    sudo rm $LOG_FILE_FORMAT
fi

#############################################################
##### Start putty in background without error output ########
#############################################################
putty -load "Philips"  2>/dev/null &
pidPutty=$!
echo "Putty pid: ${pidPutty}"
echo "pidPutty=\"${pidPutty}\"" > $CONFIG_FILE
while ! [ -f $LOG_FILE ];
do
   sleep 1
   echo "#"
done


#############################################################
##### Start formatting Philips.log > Philips_format.log #####
#############################################################
echo "Start Formatting of Philips.log"
touch $LOG_FILE_FORMAT
tail -f $LOG_FILE | \
sed -u -e 's/HTVLIB/\x1B\[31;1mHTVLIB\x1B\[37;0m/g' | \
sed -u -e 's/Javascript Alert/\n\r\x1B\[43;1mJavascript Alert\x1B\[37;0m/g'  | \
sed -u -e 's/OPERA->N_LOADING_FINISHED/\n\r\n\r\x1B\[42;1m###################### NEW SESSION ######################\x1B\[37;0m/g'   | \
sed -u -e 's/WIXP JS --> TV/\n\r\n\r\x1B\[42;1mWIXP JS --> TV\x1B\[37;0m/g'   | \
sed -u -e 's/WIXP TV --> JS/\n\r\n\r\x1B\[44;1mWIXP TV --> JS\x1B\[37;0m/g'   | \
sed -u -e 's/Error thrown at line/\n\r\x1B\[41;1m&\x1B\[37;0m/g'           | \
sed -u -e 's/Uncaught exception/\n\r\x1B\[41;1m&\x1B\[37;0m/g'           | \
sed -u -e 's/"Fun":"[a-zA-Z]*"/\x1B\[35m&\x1B\[37;0m/g'  > $LOG_FILE_FORMAT &
pidFormat=$!
echo "Format pid: ${pidFormat}"
echo "pidFormat=\"${pidFormat}\"" >> $CONFIG_FILE
while ! [ -f $LOG_FILE_FORMAT ];
do
   sleep 1
   echo "#"
done

#############################################################
##### Start grep in background                       ########
#############################################################
#touch /home/uli/Logging/Philips_grep.log
xterm -e 'tail -f /home/uli/Logging/Philips_format.log | grep -i --colour -e "WIXP TV --> JS" -e "WIXP JS --> TV" -e "Javascript Alert" -e "NEW SESSION" -e "Uncaught exception"  -e "OnKeyReceiveHandler" -e "Injecting keyCode"'  &
pidXterm=$!
echo "Xterm pid: ${pidXterm}"
echo "pidXterm=\"${pidXterm}\"" >> $CONFIG_FILE







#########################################################################

echo "Jetzt wieder einlsesen"

echo "Reading config..." >&2
if [ ! -f $CONFIG_FILE ]; then
    echo "File $CONFIG_FILE  not found!"
fi
source $CONFIG_FILE &>/dev/null
echo "Config for pidPutty: $pidPutty" >&2
echo "Config for pidXterm: $pidXterm" >&2
echo "Config for pidFormat: $pidFormat" >&2

