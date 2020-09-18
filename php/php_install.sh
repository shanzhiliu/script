
# wget https://raw.githubusercontent.com/shanzhiliu/script/master/php/php_install.sh
# sh php_install.sh user group 
# sh php_install.sh test test

yum install epel-release -y
yum install http://rpms.remirepo.net/enterprise/remi-release-7.rpm -y
yum install yum-utils -y

yum install -y php73-php-fpm php73-php-cli php73-php-bcmath php73-php-gd php73-php-json php73-php-mbstring php73-php-mcrypt php73-php-mysqlnd php73-php-opcache php73-php-pdo php73-php-pecl-crypto php73-php-pecl-mcrypt php73-php-pecl-geoip php73-php-recode php73-php-snmp php73-php-soap php73-php-xmll

#最好重启一下Pn9#72b{VLe.W24W

systemctl enable php73-php-fpm

systemctl start php73-php-fpm

rpm -qa | grep 'php'
rpm -ql php73-php-fpm-7.3.21-1.el7.remi.x86_64
find /etc/opt/remi/php73 -name php.ini
sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/' /etc/opt/remi/php73/php.ini
systemctl restart php73-php-fpm
php73 -v



sed -i "s/user = apache/user = $1/g;s/group = apache/group = $2/g"  /etc/opt/remi/php73/php-fpm.d/www.conf
systemctl restart php73-php-fpm