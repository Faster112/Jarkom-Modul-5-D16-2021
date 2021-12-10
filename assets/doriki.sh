#!/bin/sh

echo nameserver 192.168.122.1 > /etc/resolv.conf

apt update && apt install bind9 -y

echo '
options {
        directory "/var/cache/bind";
        forwarders {
                192.168.122.1;
        };

        // dnssec-validation auto;
        allow-query { any; };
        auth-nxdomain no;    # conform to RFC1035
        listen-on-v6 { any; };
};
' > /etc/bind/named.conf.options

service bind9 restart

iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --connlimit-mask 0 -j DROP

iptables -A INPUT -s 10.29.7.0/25,10.29.0.0/22 -m time --timestart 07:00 --timestop 15:00 --weekdays Mon,Tue,Wed,Thu -j ACCEPT
iptables -A INPUT -s 10.29.7.0/25,10.29.0.0/22 -j REJECT

iptables -A INPUT -s 10.29.4.0/23,10.29.6.0/24 -m time --timestart 15:01 --timestop 23:59:59 -j ACCEPT
iptables -A INPUT -s 10.29.4.0/23,10.29.6.0/24 -m time --timestart 00:00 --timestop 06:59 -j ACCEPT
iptables -A INPUT -s 10.29.4.0/23,10.29.6.0/24 -j REJECT

mkdir /etc/bind/jarkom

echo '
zone "jarkom2021.com" {
        type master;
        file "/etc/bind/jarkom/jarkom2021.com";
};
' > /etc/bind/named.conf.local

echo '
;
; BIND data file for local loopback interface
;
$TTL    604800
@       IN      SOA     jarkom2021.com. root.jarkom2021.com. (
                     2021120701         ; Serial
                         604800         ; Refresh
                          86400         ; Retry
                        2419200         ; Expire
                         604800 )       ; Negative Cache TTL
;
@       IN      NS      jarkom2021.com.
@       IN      A       10.29.7.140
@       IN      AAAA    ::1
' > /etc/bind/jarkom/jarkom2021.com

service bind9 restart