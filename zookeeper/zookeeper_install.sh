wget http://archive.apache.org/dist/zookeeper/zookeeper-3.4.2/zookeeper-3.4.2.tar.gz

cuuser=shanshan3

basepath=/opt/soft/
zkname=zookeeper-3.4.2
zkpath=$basepath$zkname"

tar -xzvf zookeeper-3.4.2.tar.gz -C $basepath

chown -R $cuuser:$cuuser $zkpath

chmod -R 755 $zkpath

#zookeer config
export ZOOKEEPER_HOME=$zkpath


echo "zookeer config" >> ~/.bash_profile
echo "export ZOOKEEPER_HOME=$zkpath" >> ~/.bash_profile
echo "export PATH=$PATH:$ZOOKEEPER_HOME/bin:$PATH:$ZOOKEEPER_HOME/sbin"  >> ~/.bash_profile


source ~/.bash_profile
