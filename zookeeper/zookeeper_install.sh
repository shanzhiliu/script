
# wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/zookeeper/zookeeper_install.sh wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/zookeeper/conf/zoo.cfg

wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.9/zookeeper-3.4.9.tar.gz

zkpath="/opt/soft/zookeeper-3.4.9"
zkmyidpath="$zkpath/zkdata"
zklogpath="$zkpath/zklog"

myidcontext=1


if [ -n "$1" ]; then
     myidcontext=$1
else
    echo "使用默认参数"
fi

#创建zk目录
mkdir -p $zkpath
#创建myid存放路径
mkdir -p $zkmyidpath
#创建log存放路径
mkdir -p $zklogpath

tar -xzvf zookeeper-3.4.9.tar.gz -C $zkpath --strip-components 1

echo $myidcontext >> "$zkmyidpath/myid"
#拷贝配置文件
cp zoo.cfg "$zkpath/conf"


echo "#zookeer config" >> ~/.bash_profile
echo "export ZOOKEEPER_HOME=$zkpath" >> ~/.bash_profile
echo "export PATH=\$PATH:\$ZOOKEEPER_HOME/bin:\$PATH:\$ZOOKEEPER_HOME/sbin"  >> ~/.bash_profile

source ~/.bash_profile
