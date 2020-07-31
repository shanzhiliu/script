
wget https://downloads.apache.org/hive/hive-1.2.2/apache-hive-1.2.2-bin.tar.gz

cudir=`pwd`
cuuser=shanshan3

#参数1 java 要安装的路径
hive_install_path=/opt/soft/hive-1.2.2
#参数2 java 压缩包的位置
hive_jar_path="$cudir/apache-hive-1.2.2-bin.tar.gz"

hive_install_dir_name=""
hive_install_file_name=""

hive_jar_dir_name=""
hive_jar_file_name=""


echo "使用配置文件的默认路径安装"
#获取文件名
hive_install_dir_name=${hive_install_path%/*}
echo $hive_install_dir_name
#获取所在路径
hive_install_file_name=${hive_install_path##*/}
echo $hive_install_file_name


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

cd ~
cp hive-site.xml  "$hive_install_path/conf/"

#替换数据库ip
sed -i  "s/149.28.28.165/$1/g" "$hive_install_path/conf/hive-site.xml"
#替换hive默认数据库用户名
sed -i  "s#<value>root</value>#<value>$2</value>#g" "$hive_install_path/conf/hive-site.xml"
#替换hive默认数据库密码
sed -i  "s#<value>mysqlpasswd</value>#<value>$3</value>#g" "$hive_install_path/conf/hive-site.xml"

#下载mysql驱动
wget https://repo1.maven.org/maven2/mysql/mysql-connector-java/5.1.46/mysql-connector-java-5.1.46.jar
#拷贝驱动给hive
cp mysql-connector-java-5.1.46.jar  "$hive_install_path/lib/"

chown -R $cuuser:$cuuser $hive_install_path
chmod -R 755 $hive_install_path	



echo "hive 安装配置完成"

#使用 （mysqlip user passwd）
# sh hive_mysql_install.sh 149.28.28.165 root shan@@aaAA1SS
#启动
# ./bin/hive  #启动hive （必须这个路径，执行）

