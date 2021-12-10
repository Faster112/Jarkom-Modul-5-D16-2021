#!/bin/sh

iptables -t nat -A POSTROUTING -o eth0 -s 10.29.0.0/16 -j SNAT --to-source 192.168.122.2

# A1
route add -net 10.29.7.128 netmask 255.255.255.248 gw 10.29.7.146
# A2
route add -net 10.29.7.0 netmask 255.255.255.128 gw 10.29.7.146
# A3
route add -net 10.29.0.0 netmask 255.255.252.0 gw 10.29.7.146
# A4
route add -net 10.29.7.144 netmask 255.255.255.252 gw 10.29.7.146
# A5
route add -net 10.29.7.148 netmask 255.255.255.252 gw 10.29.7.150
# A6
route add -net 10.29.4.0 netmask 255.255.254.0 gw 10.29.7.150
# A7
route add -net 10.29.6.0 netmask 255.255.255.0 gw 10.29.7.150
# A8 
route add -net 10.29.7.136 netmask 255.255.255.248 gw 10.29.7.150

iptables -A FORWARD -i eth0 -p tcp --dport 80 -d 10.29.7.128/29 -j DROP