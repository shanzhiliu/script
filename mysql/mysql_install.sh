wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum localinstall mysql57-community-release-el7-11.noarch.rpm -y
yum repolist enabled | grep "mysql.*-community.*"
yum install -y mysql-community-server
systemctl start mysqld
systemctl status mysqld

#查看密码
grep 'temporary password' /var/log/mysqld.log

#手动修改mysql密码
#  ALTER USER 'root'@'localhost' IDENTIFIED BY 'shan@@aaAA1SS'; 
##### 修改支持远程连接

# mysql -uroot -p
# use mysql;
# select host from user where user = "root";
# update user set host = '%' where user ='root';
# flush privileges;
# systemctl restart mysqld

#查询 mysql 默认大小写
#show global variables like '%lower_case%';
#lower_case_table_names = 1 大小写不敏感, lower_case_table_names = 0 大小写敏感
#设置 vi vim /etc/my.cnf
#最后一行设置  
#lower_case_table_names = 1
