#wget https://archive.apache.org/dist/kafka/1.1.0/kafka_2.11-1.1.0.tgz


basepath=/opt/soft/
kafkaname=kafka
kafkapath="$basepath$kafkaname"
kafkalogpath="$kafkapath/kafka-logs"
runpath="$kafkapath/bin/kafka-server-start.sh"

mkdir -p $kafkapath 
tar -zxvf kafka_2.11-1.1.0.tgz -C $kafkapath --strip-components 1

mkdir -p $kafkalogpath


##--------------------------------------------修改配置文件------------------------------------
confpath="$kafkapath/config/server.properties"
#修改 broker.id=0 （替换）
sed -i "s/broker.id=0/broker.id=$1/g" $confpath

#指定当前broker的服务地址 （新增）/ 需要 转成 \/
sed -i "/#advertised.listeners=PLAINTEXT:\/\/your.host.name:9092/a\advertised.listeners=PLAINTEXT:\/\/$2:9092" $confpath

#kafka集群数据存放的目录(替换)
sed -i "s#log.dirs=/tmp/kafka-logs#log.dirs=$kafkalogpath#g" $confpath

#指定依赖zk的地址(替换)
sed -i "s/zookeeper.connect=localhost:2181/$3/g" $confpath

#zookeeper.connect=node1:2181,node2:2181,node3:2181

#指定kafka中的topic是否可以删除，默认是false，表示不可以删除，改为true，可以删除(文件末尾新增)
echo -e "\n#指定kafka中的topic是否可以删除" >> $confpath
echo -e "\ndelete.topic.enable=true" >> $confpath

##--------------------------------------------修改运行文件文件------------------------------------
sed -i "s/-Xmx1G -Xms1G/-Xmx512m -Xms512m/g" $runpath

echo "#kafka config" >> ~/.bash_profile
echo "export KAFKA_HOME=$kafkapath" >> ~/.bash_profile
echo "export PATH=\$PATH:\$KAFKA_HOME/bin"  >> ~/.bash_profile

source ~/.bash_profile
