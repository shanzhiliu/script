
# wget https://raw.githubusercontent.com/shanzhiliu/script/master/java/java_install.sh

wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u131-b11/d54c1d3a095b4ff2b6607d096fa80163/jdk-8u131-linux-x64.tar.gz

cudir=`pwd`

#java 安装路径
java_path=/opt/soft/jdk8
#下载下来的压缩包名称
java_zip_name=jdk-8u131-linux-x64.tar.gz 
# 如果不存在文件夹 就创建
if [ ! -d "$java_path" ];
then
 mkdir -p  $java_path
fi

#解压到指定的java路径中
tar -xzvf  jdk-8u131-linux-x64.tar.gz -C $java_path --strip-components 1

rm -rf $java_zip_name

# 环境变量修改
echo "#jdk8 config" >> ~/.bash_profile
echo "export JAVA_HOME=$java_path" >> ~/.bash_profile
echo "export PATH=\$PATH:\$JAVA_HOME/bin:\$PATH:\$JAVA_HOME/sbin"  >> ~/.bash_profile


source ~/.bash_profile

echo "jdk 安装配置完成"
echo `java -version`
