systemctl stop firewalld.service

yum install pcre vim -y
yum install pcre pcre-devel -y
yum install zlib-devel -y
yum -y install gcc 
yum -y install gcc-c++ 
yum install make -y
yum -y install openssl openssl-devel  


wget http://nginx.org/download/nginx-1.14.0.tar.gz
tar -zxvf nginx-1.14.0.tar.gz
cd nginx-1.14.0 
mkdir ~/.vim
cp -r contrib/vim/* ~/.vim/

./configure --prefix=/usr/local/src/nginx --with-http_stub_status_module  --with-http_ssl_module
make
make install

echo "#nginx config" >> ~/.bash_profile
echo "export NGINX_HOME=/usr/local/src/nginx" >> ~/.bash_profile
echo "export PATH=\$NGINX_HOME/sbin:\$PATH"  >> ~/.bash_profile

source ~/.bash_profile


