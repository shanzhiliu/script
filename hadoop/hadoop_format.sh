

cuuser=shanshan3
#本机shanshan3用户配置免密登录
su - $cuuser << EOF

rm -rf $HADOOP_HOME/tmpdata
rm -rf $HADOOP_HOME/hadoop/dfs/name/
rm -rf $HADOOP_HOME/hadoop/hdfs/data/

hdfs namenode -format

EOF

