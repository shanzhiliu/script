yum -y install expect
yum -y install openssh-server
yum -y install vim
yum -y install wget

#关闭防火墙
systemctl stop firewalld.service

