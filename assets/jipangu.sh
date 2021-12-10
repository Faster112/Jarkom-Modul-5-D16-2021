#!/bin/sh

echo nameserver 192.168.122.1 > /etc/resolv.conf

apt update && apt install isc-dhcp-server -y

echo '
INTERFACES="eth0"
' > /etc/default/isc-dhcp-server

echo '
subnet 10.29.7.128 netmask 255.255.255.248 {
}

subnet 10.29.7.0 netmask 255.255.255.128 {
        range 10.29.7.2 10.29.7.101;
        option routers 10.29.7.1;
        option broadcast-address 10.29.7.127;
        option domain-name-servers 10.29.7.130;
        default-lease-time 360;
        max-lease-time 7200;
}

subnet 10.29.0.0 netmask 255.255.252.0 {
        range 10.29.0.2 10.29.2.189;
        option routers 10.29.0.1;
        option broadcast-address 10.29.3.255;
        option domain-name-servers 10.29.7.130;
        default-lease-time 360;
        max-lease-time 7200;
}

subnet 10.29.7.148 netmask 255.255.255.252 {
}

subnet 10.29.4.0 netmask 255.255.254.0 {
        range 10.29.4.2 10.29.5.45;
        option routers 10.29.4.1;
        option broadcast-address 10.29.5.255;
        option domain-name-servers 10.29.7.130;
        default-lease-time 360;
        max-lease-time 7200;
}

subnet 10.29.6.0 netmask 255.255.255.0 {
        range 10.29.6.2 10.29.6.201;
        option routers 10.29.6.1;
        option broadcast-address 10.29.6.255;
        option domain-name-servers 10.29.7.130;
        default-lease-time 360;
        max-lease-time 7200;
}
' > /etc/dhcp/dhcpd.conf

service isc-dhcp-server restart

iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --connlimit-mask 0 -j DROP
