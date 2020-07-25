
wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz

cudir=`pwd`

#参数1 java 要安装的路径
java_install_path=/opt/soft/java/jdk1.8
#参数2 java 压缩包的位置
java_jar_path="$cudir/jdk-8u131-linux-x64.tar.gz"

java_install_dir_name=/opt/soft/test
java_install_file_name=jdk1.8

java_jar_dir_name=/opt/soft/test
java_jar_file_name=jdk1.8.tar


if [ -n "$1" ]; then
    java_install_path=$1
    #获取文件名
    java_install_dir_name=${java_install_path%/*}
    echo $java_install_dir_name
    #获取所在路径
    java_install_file_name=${java_install_path##*/}
    echo $java_install_file_name
else
    echo "使用配置文件的默认路径安装"
      #获取文件名
    java_install_dir_name=${java_install_path%/*}
    echo $java_install_dir_name
    #获取所在路径
    java_install_file_name=${java_install_path##*/}
    echo $java_install_file_name
fi


java_jar_dir_name=${java_jar_path%/*}
echo $java_jar_dir_name
#获取所在路径
java_jar_file_name=${java_jar_path##*/}
echo $java_jar_file_name
    


if [ ! -d "$java_install_dir_name" ];
then
 mkdir -p  $java_install_dir_name
fi

mv $java_jar_path $java_install_dir_name
cd $java_install_dir_name


mkdir ./jdk8 && tar -xzvf  $java_jar_file_name -C ./jdk8 --strip-components 1
mv jdk8 $java_install_file_name


echo "#jdk8 config" >> ~/.bash_profile
echo "export JAVA_HOME=$java_install_path" >> ~/.bash_profile
echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$PATH:\$JAVA_HOME/sbin"  >> ~/.bash_profile


source ~/.bash_profile

echo "jdk 安装配置完成"
echo `java -version`
