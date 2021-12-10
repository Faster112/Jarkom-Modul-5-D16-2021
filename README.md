# Jarkom-Modul-5-D16-2021
Mohammad Tauchid - 05111940000136

## Prerequisites
**(A)** Buat topologi jaringan menjadi seperti ini.
![topologi](images/topologi.png)
Dengan keterangan :
* Doriki adalah DNS Server
* Jipangu adalah DHCP Server
* Maingate dan Jorge adalah Web Server
* Jumlah Host pada Blueno adalah 100 host
* Jumlah Host pada Cipher adalah 700 host
* Jumlah Host pada Elena adalah 300 host
* Jumlah Host pada Fukurou adalah 200 host

* **Foosha**
```
auto eth0
iface eth0 inet static
address 192.168.122.2
netmask 255.255.255.0
gateway 192.168.122.1

auto eth1
iface eth1 inet static
address 10.29.7.145
netmask 255.255.255.252

auto eth2
iface eth2 inet static
address 10.29.7.149
netmask 255.255.255.252
```
* **Water7**
```
auto eth0
iface eth0 inet static
address 10.29.7.146
netmask 255.255.255.252

auto eth1
iface eth1 inet static
address 10.29.7.1
netmask 255.255.255.128

auto eth2
iface eth2 inet static
address 10.29.0.1
netmask 255.255.252.0

auto eth3
iface eth3 inet static
address 10.29.7.129
netmask 255.255.255.248
```
* **Guanhao**
```
auto eth0
iface eth0 inet static
address 10.29.7.150
netmask 255.255.255.252

auto eth1
iface eth1 inet static
address 10.29.4.1
netmask 255.255.254.0

auto eth2
iface eth2 inet static
address 10.29.6.1
netmask 255.255.255.0

auto eth3
iface eth3 inet static
address 10.29.7.137
netmask 255.255.255.248
```
* **Jipangu**
```
auto eth0
iface eth0 inet static
address 10.29.7.131
netmask 255.255.255.248
gateway 10.29.7.129
```
* **Doriki**
```
auto eth0
iface eth0 inet static
address 10.29.7.130
netmask 255.255.255.248
gateway 10.29.7.129
```
* **Jorge**
```
auto eth0
iface eth0 inet static
address 10.29.7.138
netmask 255.255.255.248
gateway 10.29.7.137
```
* **Maingate**
```
auto eth0
iface eth0 inet static
address 10.29.7.139
netmask 255.255.255.248
gateway 10.29.7.137
```
* **Blueno, Cipher, Elena, dan Fukurou**
```
auto eth0
iface eth0 inet dhcp
```

**(B)** Lakukan subnetting dengan metode VLSM atau CIDR. Untuk soal ini, saya menggunakan VLSM sehingga didapatkan subnet sebagai berikut
<table>
    <tbody>
        <tr>
            <td rowspan = 3><strong>A1</strong></td>
            <td>Network ID</td>
            <td>10.29.7.128</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.255.248</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.7.135</td>
        </tr>
        <tr>
            <td rowspan = 3><strong>A2</strong></td>
            <td>Network ID</td>
            <td>10.29.7.0</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.255.128</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.7.127</td>
        </tr>
        <tr>
            <td rowspan = 3><strong>A3</strong></td>
            <td>Network ID</td>
            <td>10.29.0.0</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.252.0</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.3.255</td>
        </tr>
        <tr>
            <td rowspan = 3><strong>A4</strong></td>
            <td>Network ID</td>
            <td>10.29.7.144</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.255.252</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.7.147</td>
        </tr>
        <tr>
            <td rowspan = 3><strong>A5</strong></td>
            <td>Network ID</td>
            <td>10.29.7.148</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.255.252</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.7.151</td>
        </tr>
        <tr>
            <td rowspan = 3><strong>A6</strong></td>
            <td>Network ID</td>
            <td>10.29.4.0</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.254.0</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.5.255</td>
        </tr><tr>
            <td rowspan = 3><strong>A7</strong></td>
            <td>Network ID</td>
            <td>10.29.6.0</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.255.0</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.6.255</td>
        </tr>
        <tr>
            <td rowspan = 3><strong>A8</strong></td>
            <td>Network ID</td>
            <td>10.29.7.136</td>
        </tr>
        <tr>
            <td>Netmask</td>
            <td>255.255.255.248</td>
        </tr>
        <tr>
            <td>Broadcast Address</td>
            <td>10.29.7.143</td>
        </tr>
    </tbody>
</table>

**(C)** Lalu lakukan routing juga
* **Foosha**
```
route add -net 10.29.7.128 netmask 255.255.255.248 gw 10.29.7.146
route add -net 10.29.7.0 netmask 255.255.255.128 gw 10.29.7.146
route add -net 10.29.0.0 netmask 255.255.252.0 gw 10.29.7.146
route add -net 10.29.7.144 netmask 255.255.255.252 gw 10.29.7.146
route add -net 10.29.7.148 netmask 255.255.255.252 gw 10.29.7.150
route add -net 10.29.4.0 netmask 255.255.254.0 gw 10.29.7.150
route add -net 10.29.6.0 netmask 255.255.255.0 gw 10.29.7.150
route add -net 10.29.7.136 netmask 255.255.255.248 gw 10.29.7.150
```
* **Water7**
```
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.29.7.145
```
* **Guanhao**
```
route add -net 0.0.0.0 netmask 0.0.0.0 gw 10.29.7.149
```

**(D)** Set IP client menjadi **DHCP** dengan **Jipangu** sebagai DHCP servernya.
(**catatan**: jalankan program pada jawaban [nomor 1](#nomor-1) terlebih dahulu)
* **Jipangu**

Set nameserver pada `/etc/resolv.conf` ke **192.168.122.1** lalu install `isc-dhcp-server`
```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt update && apt install isc-dhcp-server -y
```

Lalu pada `/etc/default/isc-dhcp-server` settinga agak konfigurasinya menjadi seperti ini
```
INTERFACES="eth0"
```

Kemudian, tambahkan konfigurasi DHCP pada `/etc/dhcp/dhcpd.conf` menjadi seperti ini
```
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
```

Restart `isc-dhcp-server`

* DHCP Relay (**Water7** dan **Guanhao**)

Set nameserver pada `/etc/resolv.conf` ke **192.168.122.1** lalu install `isc-dhcp-relay`
```bash
echo nameserver 192.168.122.1 > /etc/resolv.conf
apt update && apt install isc-dhcp-relay -y
```

Ubah konfigurasi `/etc/default/isc-dhcp-relay` menjadi
```
SERVERS="10.29.7.131"
INTERFACES=""
OPTIONS=""
```

Kemudian restart `isc-dhcp-relay`

## Soal
**(1)** Agar topologi yang kalian buat dapat mengakses keluar, kalian diminta untuk mengkonfigurasi Foosha menggunakan iptables, tetapi Luffy tidak ingin menggunakan MASQUERADE. **(2)** Kalian diminta untuk mendrop semua akses HTTP dari luar Topologi kalian pada server yang merupakan DHCP Server dan DNS Server demi menjaga keamanan. **(3)** Karena kelompok kalian maksimal terdiri dari 3 orang. Luffy meminta kalian untuk membatasi DHCP dan DNS Server hanya boleh menerima maksimal 3 koneksi ICMP secara bersamaan menggunakan iptables, selebihnya didrop. Kemudian kalian diminta untuk membatasi akses ke Doriki yang berasal dari subnet Blueno, Cipher, Elena dan Fukuro dengan beraturan sebagai berikut: **(4)** Akses dari subnet Blueno dan Cipher hanya diperbolehkan pada pukul 07.00 - 15.00 pada hari Senin sampai Kamis. **(5)** Akses dari subnet Elena dan Fukuro hanya diperbolehkan pada pukul 15.01 hingga pukul 06.59 setiap harinya. Selain itu di reject. **(6)** Karena kita memiliki 2 Web Server, Luffy ingin Guanhao disetting sehingga setiap request dari client yang mengakses DNS Server akan didistribusikan secara bergantian pada Jorge dan Maingate

## Jawaban
### Nomor 1
Tambahkan rule berikut pada iptables **Foosha**
```
iptables -t nat -A POSTROUTING -o eth0 -s 10.29.0.0/16 -j SNAT --to-source 192.168.122.2
```
**Penjelasan** :
* `-t nat`: menggunakan tabel nat karena akan mengubah alamat paket
* `-A POSTROUTING`: menambahkan chain POSTROUTING karena mengubah alamat paket setelah routing
* `-o eth0`: interface tempat paket keluar (dalam hal ini ke NAT)
* `-s 10.29.0.0/16`: alamat asal yang akan diubah
* `-j SNAT`: menggunakan target SNAT untuk mengubah alamat asal
* `--to-source 192.168.122.2`: mengubah alamat asal menjadi 192.168.122.2 (interface eth0 **Foosha**)

Untuk mengecek apakah sudah berhasil, bisa dengan cara `ping google.com` pada setiap node.
![ping-google](images/ping-google.png)

### Nomor 2
Tambahkan rule berikut pada iptables **Foosha**
```
iptables -A FORWARD -i eth0 -p tcp --dport 80 -d 10.29.7.128/29 -j DROP
```
**Penjelasan** :
* `-A FORWARD`: menambahkan chain FORWARD karena berurusan dengan filtering
* `-i eth0`: interface tempat paket masuk (dalam hal ini dari NAT)
* `-p tcp`: menggunakan protokol TCP
* `--dport 80`: menggunakan port 80 (HTTP)
* `-d 10.29.7.128/29`: alamat tujuan paket, dalam hal ini adalah subnet A1 (DHCP dan DNS server)
* `-j DROP`: men-DROP paket yang melalui filter

### Nomor 3
Tambahkan rule berikut pada iptables di DHCP dan DNS server
```
iptables -A INPUT -p icmp -m connlimit --connlimit-above 3 --connlimit-mask 0 -j DROP
```
**Penjelasan**
* `-A INPUT`: menambahkan chain INPUT karena berurusan dengan paket yang masuk
* `-p icmp`: menggunakan protokol ICMP
* `-m connlimit`: menggunakan matchcase *connlimit*
* `--conlimit-above 3`: menerapkan rule apabila ada koneksi lebih dari 3
* `--conlimit-mask 0`: menggunakan netmask 0 (rule berlaku untuk semua network)
* `-j DROP`: men-DROP paket ketika koneksi melebihi 3

### Nomor 4
Tambahkan rule berikut pada iptables di **Doriki**
```
iptables -A INPUT -s 10.29.7.0/25,10.29.0.0/22 -m time --timestart 07:00 --timestop 15:00 --weekdays Mon,Tue,Wed,Thu -j ACCEPT
```
**Penjelasan** :
* `-A INPUT`: menambahkan chain INPUT karena berhubungan dengan paket yang masuk
* `-s 10.29.7.0/25,10.29.0.0/22`: mendefinisikan alamat asal (**Blueno** dan **Cipher**)
* `-m time`: menggunakan matchcase *time*
* `--timestart 07:00`: mendefinisikan waktu rule mulai, dalam hal ini 07:00
* `--timestop 15:00`: mendefinisikan waktu rule berhenti, dalam hal ini 15:00
* `--weekdays Mon,Tue,Wed,Thu`: mendefinisikan hari apa rule dijalankan (Senin, Selasa, Rabu, Kamis)
* `-j ACCEPT`: menggunakan target ACCEPT ketika rule memenuhi matchcase

Setelah itu tambahkan rule default, yakni ketika rule di atas tidak dijalankan (tidak memenuhi matchcase)
```
iptables -A INPUT -s 10.29.7.0/25,10.29.0.0/22 -j REJECT
```
**Penjelasan** :
* `-A INPUT`: menambahkan chain INPUT karena berhubungan dengan paket yang masuk
* `-s 10.29.7.0/25,10.29.0.0/22`: mendefinisikan alamat asal (**Blueno** dan **Cipher**)
* `-j REJECT`: menggunakan target REJECT ke semua paket yang melalui rule ini

Untuk mengecek apakah berjalan atau tidak, lakukan ping pada **Blueno**
![4-fail](images/4-failed.png)

Lalu ganti tanggal atau waktunya, kemudian ping lagi
![4-succeed](images/4-succeed.png)

### Nomor 5
Tambahkan rule berikut pada iptables di **Doriki**
```
iptables -A INPUT -s 10.29.4.0/23,10.29.6.0/24 -m time --timestart 15:01 --timestop 23:59:59 -j ACCEPT
iptables -A INPUT -s 10.29.4.0/23,10.29.6.0/24 -m time --timestart 00:00 --timestop 06:59 -j ACCEPT
```
**Penjelasan** :
* `-A INPUT`: menambahkan chain INPUT karena berhubungan dengan paket yang masuk
* `-s 10.29.4.0/23,10.29.6.0/24`: mendefinisikan alamat asal (**Elena** dan **Fukurou**)
* `-m time`: menggunakan matchcase *time*
* `--timestart 15:01`: mendefinisikan waktu rule mulai, dalam hal ini 15:00
* `--timestop 23:59:59`: mendefinisikan waktu rule berhenti, dalam hal ini 23:59:59
* `--timestart 00:00`: mendefinisikan waktu rule mulai lagi, dalam hal ini 00:00
* `--timestop 06:59`: mendefinisikan waktu rule berhenti lagi, dalam hal ini 06:59
* `-j ACCEPT`: menggunakan target ACCEPT ketika rule memenuhi matchcase

Setelah itu tambahkan rule default, yakni ketika rule di atas tidak dijalankan (tidak memenuhi matchcase)
```
iptables -A INPUT -s 10.29.4.0/23,10.29.6.0/24 -j REJECT
```
**Penjelasan** :
* `-A INPUT`: menambahkan chain INPUT karena berhubungan dengan paket yang masuk
* `-s 10.29.4.0/23,10.29.6.0/24`: mendefinisikan alamat asal (**Elena** dan **Fukurou**)
* `-j REJECT`: menggunakan target REJECT ke semua paket yang melalui rule ini

Untuk mengecek apakah berjalan atau tidak, lakukan ping pada **Elena**
![5-fail](images/5-failed.png)

Lalu ganti tanggal atau waktunya, kemudian ping lagi
![5-succeed](images/5-succeed.png)

### Nomor 6
Install bind9 pada **Doriki**
```bash
apt update && apt install bind9 -y
```
Buat domain baru pada **Doriki** yang mengarah ke IP random (dalam hal ini 10.29.7.140)
```
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
```

Tambahkan zone pada **Doriki**
```
zone "jarkom2021.com" {
        type master;
        file "/etc/bind/jarkom/jarkom2021.com";
};
```

Tambahkan rule pada **Guanhao** seperti berikut
```
iptables -t nat -A PREROUTING -d 10.29.7.140 -m statistic --mode nth --every 2 --packet 0 -j DNAT --to-destination 10.29.7.138
```
**Penjelasan** :
* `-t nat`: menggunakan tabel NAT karena akan merubah alamat paket
* `-A PREROUTING`: menggunakan chain PREROUTING karena mengubah alamat sebelum routing
* `-d 10.29.7.140`: mendefinisikan alamat, dalam hal ini 10.29.7.140
* `-m statistic`: menggunakan matchcase *statistic*
* `--mode nth`: menggunakan mode *nth*
* `--every 2`: menerapkan rule setiap 2 paket
* `--packet 0`: mengambil paket ke-1 dari 2 paket yang melalui rule
* `-j DNAT`: menggunakan target DNAT untuk mengubah alamat tujuan paket
* `--to-destination 10.29.7.138`: mengubah alamat paket menjadi 10.29.7.138 (**Jorge**)

Tambahkan rule default atau ketika rule di atas tidak dijalankan
```
iptables -t nat -A PREROUTING -d 10.29.7.140 -j DNAT --to-destination 10.29.7.139
```
**Penjelasan** :
* `-t nat`: menggunakan tabel NAT karena akan merubah alamat paket
* `-A PREROUTING`: menggunakan chain PREROUTING karena mengubah alamat sebelum routing
* `-d 10.29.7.140`: mendefinisikan alamat, dalam hal ini 10.29.7.140
* `-j DNAT`: menggunakan target DNAT untuk mengubah alamat tujuan paket
* `--to-destination 10.29.7.139`: mengubah alamat paket menjadi 10.29.7.138 (**Maingate**)

Untuk mengecek jalan tidaknya firewall, lakukan ping ke **jarkom2021.com**
![6-client1](images/6-client1.png)

Ping juga dengan client lainnya
![6-client2](images/6-client2.png)

Untuk mengecek apkah berhasil diubah alamat tujuannya, jalankan `tcpdump` pada **Jorge** dan **Maingate**
* **Jorge**
![jorge](images/jorge.png)
* **Maingate**
![maingate](images/maingate.png)
