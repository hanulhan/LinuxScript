tail -f ~/Logging/Philips.log | \
sed -u -e 's/HTVLIB/\x1B\[31;1mHTVLIB\x1B\[37;0m/g' | \
sed -u -e 's/Javascript Alert/\n\r\x1B\[43;1mJavascript Alert\x1B\[37;0m/g'  | \
sed -u -e 's/OPERA->N_LOADING_FINISHED/\n\r\n\r\x1B\[42;1m###################### NEW SESSION ######################\x1B\[37;0m/g'   | \
sed -u -e 's/WIXP JS --> TV/\n\r\n\r\x1B\[42;1mWIXP JS --> TV\x1B\[37;0m/g'   | \
sed -u -e 's/WIXP TV --> JS/\n\r\n\r\x1B\[44;1mWIXP TV --> JS\x1B\[37;0m/g'   | \
sed -u -e 's/Error thrown at line/\n\r\x1B\[41;1m&\x1B\[37;0m/g'           | \
sed -u -e 's/Uncaught exception/\n\r\x1B\[41;1m&\x1B\[37;0m/g'           | \
sed -u -e 's/"Fun":"[a-zA-Z]*"/\x1B\[35m&\x1B\[37;0m/g'  > ~/Logging/Philips_format.log 




