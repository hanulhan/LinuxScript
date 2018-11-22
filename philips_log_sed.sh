tail -f ~/Logging/Philips.log | \
sed -u -e 's/HTVLIB/\x1B\[31;1mHTVLIB\x1B\[37;0m/' | \
sed -u -e 's/HCAPI/\x1B\[32;1mHCAPI\x1B\[37;0m/'   | \
sed -u -e 's/Javascript Alert/\n\r\x1B\[41;1mJavascript Alert\x1B\[37;0m/'   | \
sed -u -e 's/WXIP TV/\x1B\[33;1mWXIP TV\x1B\[37;0m/'   | \
sed -u -e 's/WXIP JS/\x1B\[33;1mWXIP JS\x1B\[37;0m/' > ~/Logging/Philips_format.log &




