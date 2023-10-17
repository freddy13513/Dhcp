#!/bin/bash
set -x
 
# Actualizar la lista de paquetes disponibles
sudo apt update

# Actualizar todos los paquetes instalados
sudo apt upgrade -y

# Instalar el servicio isc-dhcp-server
sudo apt install isc-dhcp-server -y

# Deshabilitar NetworkManager
sudo systemctl stop NetworkManager
sudo systemctl disable NetworkManager

# Cambiar la configuración en /etc/default/isc-dhcp-server
sudo bash -c 'cat << EOF > /etc/default/isc-dhcp-server
# On what interfaces should the DHCP server (dhcpd) serve DHCP requests?
# Separate multiple interfaces with spaces, e.g. "eth0 eth1".
INTERFACESv4="enX0"
INTERFACESv6=""
EOF'

# Cambiar la configuración en /etc/dhcp/dhcpd.conf
sudo bash -c 'cat << EOF > /etc/dhcp/dhcpd.conf
# dhcpd.conf

option domain-name "example.org";
option domain-name-servers ns1.example.org, ns2.example.org;

default-lease-time 600;
max-lease-time 7200;

ddns-update-style none;

authoritative;
failover peer "FAILOVER" {
  primary;
  address 172.31.37.55;
  port 647;
  peer address 172.31.37.56;
  peer port 647;
  max-unacked-updates 10;
  max-response-delay 30;
  load balance max seconds 3;
  mclt 1800;
  split 128;
}

subnet 172.31.32.0 netmask 255.255.240.0 {
  option broadcast-address 172.31.47.255;
  option routers 172.31.32.1;
  option domain-name-servers 8.8.8.8, 8.8.4.4;
  pool {
    failover peer "FAILOVER";
    max-lease-time 3600;
    range 172.31.32.10 172.31.32.20;
  }
}
EOF'

# Cambiar la configuración en /etc/network/interfaces
sudo bash -c 'cat << EOF > /etc/network/interfaces
# This file describes the network interfaces available on your system
# and how to activate them. For more information, see interfaces(5).

source /etc/network/interfaces.d/*

# The loopback network interface
auto enX0
iface enX0 inet static
        address 172.31.37.55
        netmask 255.255.240.0
        network 172.31.32.0
        broadcast 172.31.47.255

EOF'

# Reiniciar el servicio networking
sudo systemctl restart networking

# Reiniciar el servicio dhcp
sudo systemctl restart isc-dhcp-server

# Mostrar un mensaje de finalización
echo "Actualización de paquetes y configuración completada, networking reiniciado."
