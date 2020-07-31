
#wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" https://downloads.lightbend.com/scala/2.11.8/scala-2.11.8.tgz

cudir=`pwd`

#参数1 scala 要安装的路径
scala_install_path=/opt/soft/scala-2.11.8
#参数2 scala 压缩包的位置
scala_jar_path="$cudir/scala-2.11.8.tgz"

scala_install_dir_name=/opt/soft/test
scala_install_file_name=jdk1.8

scala_jar_dir_name=/opt/soft/test
scala_jar_file_name=jdk1.8.tar


if [ -n "$1" ]; then
    scala_install_path=$1
    #获取文件名
    scala_install_dir_name=${scala_install_path%/*}
    echo $scala_install_dir_name
    #获取所在路径
    scala_install_file_name=${scala_install_path##*/}
    echo $scala_install_file_name
else
    echo "使用配置文件的默认路径安装"
      #获取文件名
    scala_install_dir_name=${scala_install_path%/*}
    echo $scala_install_dir_name
    #获取所在路径
    scala_install_file_name=${scala_install_path##*/}
    echo $scala_install_file_name
fi


scala_jar_dir_name=${scala_jar_path%/*}
echo $scala_jar_dir_name
#获取所在路径
scala_jar_file_name=${scala_jar_path##*/}
echo $scala_jar_file_name
    


if [ ! -d "$scala_install_dir_name" ];
then
 mkdir -p  $scala_install_dir_name
fi

cp $scala_jar_path $scala_install_dir_name
cd $scala_install_dir_name


mkdir ./scala && tar -xzvf  $scala_jar_file_name -C ./scala --strip-components 1
mv scala $scala_install_file_name


echo "#scala config" >> ~/.bash_profile
echo "export SCALA_HOME=$scala_install_path" >> ~/.bash_profile
echo "export PATH=\$PATH:\$SCALA_HOME/bin"  >> ~/.bash_profile


source ~/.bash_profile

echo "scala 安装配置完成"
