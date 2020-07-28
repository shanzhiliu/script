
#--------------------本机root---------------------
function installBaseLocal(){
#配置本机host.ini
#本机安装基础软件
sh base_install.sh
#本机配置host
sh host_install.sh
#本机配置免密登录
sh nopasswd_install.sh
}


#--------------------其他机器root---------------------
function installBaseOther(){
#拷贝host.ini到其他机器
sh config_install_other.sh
#其他机器安装基础软件
sh base_install_other.sh
#其他机器配置host
sh host_install_other.sh
#其他机器配置免密登录
sh nopasswd_install_other.sh
}

#安装java
function installJava(){
#本机安装java
sh java_install.sh
#其他机器安装java
sh java_install_other.sh

source ~/.bash_profile
}

#添加shanshan3用户
function addLinuxUser(){
#本机shanshan3用户
sh user_config.sh
#其他机器shanshan3用户
sh user_config_other.sh
#执行其他用的免密登录
sh user_nopasswd.sh
}


#安装配置hadoop
function installHadoop(){
#hadoop_slaves文件修改
sh hadoop_config_slaves.sh
#本机安装
sh hadoop_install.sh
#使生效
source ~/.bash_profile
#其他机器安装java
sh hadoop_install_other.sh

#本机配置hadoop
sh hadoop_config.sh
#其他机器配置hadoop
sh hadoop_config_other.sh

#.base_profile from root to user
sh profile_install.sh
sh profile_install_other.sh

#本机hadoop 修改所属用户
sh hadoop_chown.sh
#其他机器hadoop 修改所属用户
sh hadoop_chown_other.sh
#格式化hadoop
sh hadoop_format.sh
}


#安装zookeeper
function installZookeeper(){
#本机安装zookeeper
sh zookeeper_install.sh
#其他机器安装zookeeper
sh zookeeper_install_other.sh

#.base_profile from root to user
sh profile_install.sh
sh profile_install_other.sh

#使生效
source ~/.bash_profile
}





#--------------------本机root（基础软件，免密登录）---------------------
installBaseLocal
#--------------------其他机器root（基础软件，免密登录）---------------------
installBaseOther
#安装java
installJava
#添加shanshan3用户
addLinuxUser
#安装配置hadoop
installHadoop
#安装zookeeper
installZookeeper





# function setPassword() {

# /usr/bin/expect << EOF
# set timeout 30
# spawn passwd shanshan3
# expect {
#     "密码" { send "jF5GEK1VXCxTS132jF5GEKggs3441VXCxTS132\r";exp_continue }
#     "密码" { send "jF5GEK1VXCxTS132jF5GEKggs3441VXCxTS132\r"}
#     }
# expect eof
# EOF

# }

# cuuser=shanshan3
# cupwd=jF5GEK1VXCxTS132jF5GEKggs3441VXCxTS132
# #本机创建用户
# useradd $cuuser
# #其他机器创建用户
# passwd $cuuser
# setPassword $cupwd


