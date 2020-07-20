
#参数1 java 要安装的路径
java_install_path=/opt/soft/test/jdk1.8
#参数2 java 压缩包的位置
java_jar_path=/opt/soft/test/jdk1.8.tar

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
    echo "请输入你想要安装的路径-路径-如 /opt/soft/test/jdk1.8"
    exit
fi

if [ -n "$2" ]; then
		java_jar_path=$2
    #获取文件名
    java_jar_dir_name=${java_jar_path%/*}
    echo $java_jar_dir_name
    #获取所在路径
    java_jar_file_name=${java_jar_path##*/}
    echo $java_jar_file_name

else
    echo "请输入java压缩包路径- 如 /opt/soft/test/jdk8.tar"
    exit
fi


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


