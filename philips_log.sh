#!/bin/sh
tail -f ~/Logging/Philips.log | grep -e '\[HCAPI]' -e '\Javascript Alert' -e '\[HTVLIB]'

