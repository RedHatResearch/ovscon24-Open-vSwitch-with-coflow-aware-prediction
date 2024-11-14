#!/usr/bin/env bash

filename="udp_timestamp_xdp.c"
interface="ens16f1np1"
basename="${filename%.*}"

clang -O2 -g -Wall -target bpf -c $filename -o $basename.o -I /usr/include/

sudo xdp-loader load -vv -m skb -s udp_timestamp_ingress $interface $basename.o