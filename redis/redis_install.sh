# wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/redis/redis_install.sh

yum install -y gcc-c++
yum install -y wget
wget http://download.redis.io/releases/redis-5.0.4.tar.gz
tar -zxvf redis-5.0.4.tar.gz
 cd redis-5.0.4
 make
 make install PREFIX=/opt/soft/redis

java_path=/opt/soft/redis

echo "#redis config" >> ~/.bash_profile
echo "export REDIS_HOME=$java_path" >> ~/.bash_profile
echo "export PATH=\$PATH:\$REDIS_HOME/bin:\$PATH:\$REDIS_HOME/sbin"  >> ~/.bash_profile





# cd /opt/soft/redis/bin
# ./redis-server