wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum localinstall mysql57-community-release-el7-11.noarch.rpm -y
yum repolist enabled | grep "mysql.*-community.*"
yum install -y mysql-community-server
systemctl start mysqld
systemctl status mysqld

#查看密码
grep 'temporary password' /var/log/mysqld.log

#手动修改mysql密码