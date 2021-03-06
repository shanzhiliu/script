wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.2/zookeeper-3.4.2.tar.gz

yum install nc -y

cuuser=shanshan3

basepath=/opt/soft/
zkname=zookeeper-3.4.2
zkpath="$basepath$zkname"
zkmyidpath="$zkpath/mydata"

myidcontext=1


if [ -n "$1" ]; then
     myidcontext=$1
else
    echo "使用默认参数"
fi

tar -xzvf zookeeper-3.4.2.tar.gz -C $basepath

#创建myid存放路径
mkdir -p $zkmyidpath

echo $myidcontext >> "$zkmyidpath/myid"
#拷贝配置文件
cp zoo.cfg "$zkpath/conf"

#修改脚本文件 去掉-q 1
sed -i  "s/-q 1/ /g" "$zkpath/bin/zkServer.sh"

chown -R $cuuser:$cuuser $zkpath

chmod -R 755 $zkpath


echo "#zookeer config" >> ~/.bash_profile
echo "export ZOOKEEPER_HOME=$zkpath" >> ~/.bash_profile
echo "export PATH=\$PATH:\$ZOOKEEPER_HOME/bin:\$PATH:\$ZOOKEEPER_HOME/sbin"  >> ~/.bash_profile


source ~/.bash_profile
