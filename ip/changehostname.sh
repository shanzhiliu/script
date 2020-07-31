sed -i "s/192.168.2.201/$1/g"  /etc/sysconfig/network-scripts/ifcfg-ens33
systemctl restart network