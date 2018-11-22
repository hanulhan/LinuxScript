#!/bin/sh
tail -f ~/Logging/Philips_format.log | grep -i --colour -e "\[DEBUG\]" -e "\[ERROR\]" -e "NEW SESSION"
