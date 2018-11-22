#!/bin/sh
sudo ip route add 224.0.0.0/4 dev eth0
route
cvlc $1 -L :sout=#std{access=udp,mux=ts,dst=$2}
