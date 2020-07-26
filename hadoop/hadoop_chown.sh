
cuuser=shanshan3

chown -R $cuuser:$cuuser  $HADOOP_HOME

chmod -R 755 $HADOOP_HOME
chmod -R g+w $HADOOP_HOME
chmod -R o+w $HADOOP_HOME