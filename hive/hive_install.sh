
wget https://downloads.apache.org/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz

cudir=`pwd`
cuuser=shanshan3

#参数1 java 要安装的路径
hive_install_path=/opt/soft/hive-1.2.2
#参数2 java 压缩包的位置
hive_jar_path="$cudir/apache-hive-1.2.2-bin.tar.gz"

hive_install_dir_name=/opt/soft/test
hive_install_file_name=jdk1.8

hive_jar_dir_name=/opt/soft/test
hive_jar_file_name=jdk1.8.tar


if [ -n "$1" ]; then
    hive_install_path=$1
    #获取文件名
    hive_install_dir_name=${hive_install_path%/*}
    echo $hive_install_dir_name
    #获取所在路径
    hive_install_file_name=${hive_install_path##*/}
    echo $hive_install_file_name
else
    echo "使用配置文件的默认路径安装"
      #获取文件名
    hive_install_dir_name=${hive_install_path%/*}
    echo $hive_install_dir_name
    #获取所在路径
    hive_install_file_name=${hive_install_path##*/}
    echo $hive_install_file_name
fi


hive_jar_dir_name=${hive_jar_path%/*}
echo $hive_jar_dir_name
#获取所在路径
hive_jar_file_name=${hive_jar_path##*/}
echo $hive_jar_file_name
    


if [ ! -d "$hive_install_dir_name" ];
then
 mkdir -p  $hive_install_dir_name
fi

mv $hive_jar_path $hive_install_dir_name
cd $hive_install_dir_name


mkdir ./hive && tar -xzvf  $hive_jar_file_name -C ./hive --strip-components 1
mv hive $hive_install_file_name


chown -R $cuuser:$cuuser $hive_install_path
chmod -R 755 $hive_install_path	


echo "hive 安装配置完成"

