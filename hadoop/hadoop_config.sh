source ~/.bash_profile
cupath=$HADOOP_HOME/etc/hadoop/

\cp hadoop-env.sh  $cupath
\cp yarn-env.sh  $cupath
\cp core-site.xml  $cupath
\cp hdfs-site.xml  $cupath
\cp mapred-site.xml  $cupath
\cp yarn-site.xml  $cupath
\cp slaves  $cupath

mkdir -p "$HADOOP_HOME/journaldata"
