
# wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/java/java_install.sh

wget https://downloads.apache.org/maven/maven-3/3.8.1/binaries/apache-maven-3.8.1-bin.tar.gz

#maven 安装路径
maven_path=/opt/soft/maven
#下载下来的压缩包名称
maven_zip_name=apache-maven-3.8.1-bin.tar.gz
# 如果不存在文件夹 就创建
if [ ! -d "$maven_path" ];
then
 mkdir -p  $maven_path
fi

#解压到指定的java路径中
tar -xzvf  $maven_zip_name -C $maven_path --strip-components 1

rm -rf $maven_zip_name

# 环境变量修改
echo "#maven config" >> ~/.bash_profile
echo "export M2_HOME=$maven_path" >> ~/.bash_profile
echo "export PATH=\$PATH:\$M2_HOME/bin"  >> ~/.bash_profile


source ~/.bash_profile

echo "maven 安装配置完成"
echo `mvn -v`
