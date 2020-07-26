
wget wget https://archive.apache.org/dist/hadoop/core/hadoop-2.7.3/hadoop-2.7.3.tar.gz

cudir=`pwd`

#参数1 java 要安装的路径
hadoop_install_path=/opt/soft/hadoop-2.7.3
#参数2 java 压缩包的位置
hadoop_jar_path="$cudir/hadoop-2.7.3.tar.gz"

hadoop_install_dir_name=/opt/soft/test
hadoop_install_file_name=hadoop2.7.3

hadoop_jar_dir_name=/opt/soft/test
hadoop_jar_file_name=jdk1.8.tar


if [ -n "$1" ]; then
    hadoop_install_path=$1
    #获取文件名
    hadoop_install_dir_name=${hadoop_install_path%/*}
    echo $hadoop_install_dir_name
    #获取所在路径
    hadoop_install_file_name=${hadoop_install_path##*/}
    echo $hadoop_install_file_name
else
    echo "使用配置文件的默认路径安装"
      #获取文件名
    hadoop_install_dir_name=${hadoop_install_path%/*}
    echo $hadoop_install_dir_name
    #获取所在路径
    hadoop_install_file_name=${hadoop_install_path##*/}
    echo $hadoop_install_file_name
fi


hadoop_jar_dir_name=${hadoop_jar_path%/*}
echo $hadoop_jar_dir_name
#获取所在路径
hadoop_jar_file_name=${hadoop_jar_path##*/}
echo $hadoop_jar_file_name
    


if [ ! -d "$hadoop_install_dir_name" ];
then
 mkdir -p  $hadoop_install_dir_name
fi

mv $hadoop_jar_path $hadoop_install_dir_name
cd $hadoop_install_dir_name


mkdir ./hadoop && tar -xzvf  $hadoop_jar_file_name -C ./hadoop --strip-components 1
mv hadoop $hadoop_install_file_name



echo "#hadoop config" >> ~/.bash_profile
echo "export HADOOP_HOME=$hadoop_install_path" >> ~/.bash_profile
echo "export PATH=\$PATH:\$HADOOP_HOME/bin:\$PATH:\$HADOOP_HOME/sbin"  >> ~/.bash_profile


source ~/.bash_profile

echo "hadoop 安装配置完成"
