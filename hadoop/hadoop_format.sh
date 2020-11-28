

cuuser=shanshan3
#本机shanshan3用户配置免密登录
su - $cuuser << EOF

#使生效
source ~/.base_profile

rm -rf $HADOOP_HOME/tmpdata
rm -rf $HADOOP_HOME/hadoop/dfs/name/
rm -rf $HADOOP_HOME/hadoop/hdfs/data/

mkdir -p $HADOOP_HOME/tmpdata
mkdir -p $HADOOP_HOME/hadoop/dfs/name/
mkdir -p $HADOOP_HOME/hadoop/hdfs/data/

hdfs namenode -format

EOF

