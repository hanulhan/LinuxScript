#!/bin/sh
identify $1
identify -format "%x x %y" $1
