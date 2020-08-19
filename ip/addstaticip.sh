sed -i "s/dhcp/static/g"  /etc/sysconfig/network-scripts/ifcfg-ens33
echo "IPADDR=$1" >> /etc/sysconfig/network-scripts/ifcfg-ens33
echo "NETMASK=255.255.255.0" >> /etc/sysconfig/network-scripts/ifcfg-ens33
echo "GATEWAY=192.168.2.2" >> /etc/sysconfig/network-scripts/ifcfg-ens33
echo "DNS1=192.168.2.2" >> /etc/sysconfig/network-scripts/ifcfg-ens33
systemctl restart network