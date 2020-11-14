
# wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/rocketmq/rocketmq_install.sh

wget  https://downloads.apache.org/rocketmq/4.7.1/rocketmq-all-4.7.1-bin-release.zip

#java 安装路径
rocketmq_path=/opt/soft/
#下载下来的压缩包名称
rocketmq_zip_name=rocketmq-all-4.7.1-bin-release.zip 
# 如果不存在文件夹 就创建
if [ ! -d "$rocketmq_path" ];
then
 mkdir -p  $rocketmq_path
fi

#解压到指定的java路径中
unzip  $rocketmq_zip_name -d $rocketmq_path
#删除压缩包
rm -rf $rocketmq_zip_name
#进入目录
cd $rocketmq_path
#修改名称
mv $rocketmq_zip_name rocketmq-4.7.1

rocketmq_path=/opt/soft/rocketmq-4.7.1
# 环境变量修改
echo "#rocketmq config" >> ~/.bash_profile
echo "export ROCKETMQ_HOME=$rocketmq_path" >> ~/.bash_profile
echo "export PATH=\$PATH:\$ROCKETMQ_HOME/bin"  >> ~/.bash_profile


source ~/.bash_profile

echo "rocketmq 安装配置完成"
