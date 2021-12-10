#!/bin/sh

echo nameserver 192.168.122.1 > /etc/resolv.conf

route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.29.7.149

apt update && apt install isc-dhcp-relay -y

echo '
SERVERS="10.29.7.131"
INTERFACES=""
OPTIONS=""
' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart

iptables -t nat -A PREROUTING -d 10.29.7.140 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.29.7.138
iptables -t nat -A PREROUTING -d 10.29.7.140 -j DNAT --to-destination 10.29.7.139