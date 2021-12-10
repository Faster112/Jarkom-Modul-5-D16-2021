#!/bin/sh

echo nameserver 192.168.122.1 > /etc/resolv.conf

route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.29.7.145

apt update && apt install isc-dhcp-relay -y

echo '
SERVERS="10.29.7.131"
INTERFACES=""
OPTIONS=""
' > /etc/default/isc-dhcp-relay

service isc-dhcp-relay restart

