hostname CentOS-3
nmcli con mod enp1s0 ipv4.addresses 192.168.86.123/16
nmcli con mod enp1s0 ipv4.gateway 192.168.86.1
nmcli con mod enp1s0 ipv4.dns 192.168.86.120,8.8.8.8
nmcli con mod enp1s0 ipv4.method manual
nmcli con up enp1s0