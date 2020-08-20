function blue(){
    echo -e "\033[34m\033[01m$1\033[0m"
}
function green(){
    echo -e "\033[32m\033[01m$1\033[0m"
}
function red(){
    echo -e "\033[31m\033[01m$1\033[0m"
}
function yellow(){
    echo -e "\033[33m\033[01m$1\033[0m"
}
function bred(){
    echo -e "\033[31m\033[01m\033[05m$1\033[0m"
}
function byellow(){
    echo -e "\033[33m\033[01m\033[05m$1\033[0m"
}


wget https://dev.mysql.com/get/mysql57-community-release-el7-11.noarch.rpm
yum localinstall mysql57-community-release-el7-11.noarch.rpm -y
yum repolist enabled | grep "mysql.*-community.*"
yum install -y mysql-community-server
systemctl start mysqld
systemctl status mysqld

if [ `yum list installed | grep mysql-community | wc -l` -ne 0 ]; then
    	echo "【bingo---】 MySQL安装成功"
	    echo
	    echo
        
	    
fi

grep 'temporary password' /var/log/mysqld.log

originpasswd=`cat /var/log/mysqld.log | grep password | head -1 | rev  | cut -d ' ' -f 1 | rev`

#查看密码


#手动修改mysql密码
#  ALTER USER 'root'@'localhost' IDENTIFIED BY 'shan@@aaAA1SS'; 
##### 修改支持远程连接

# mysql -uroot -p
# use mysql;
# select host from user where user = "root";
# update user set host = '%' where user ='root';
# flush privileges;
# systemctl restart mysqld