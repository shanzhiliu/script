yum install -y gcc-c++
yum install -y wget
wget http://download.redis.io/releases/redis-5.0.4.tar.gz
tar -zxvf redis-5.0.4.tar.gz
 cd redis-5.0.4
 make
 make install PREFIX=/opt/soft/redis
 