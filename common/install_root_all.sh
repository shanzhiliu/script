#--------------------本机root---------------------
#配置本机host.ini
#本机安装基础软件
sh base_install.sh
#本机配置host
sh host_install.sh
#本机配置免密登录
sh nopasswd_install.sh

#--------------------其他机器root---------------------

#拷贝host.ini到其他机器
sh config_install_other.sh
#其他机器安装基础软件
sh base_install_other.sh
#其他机器配置host
sh host_install_other.sh
#其他机器配置免密登录
sh nopasswd_install_other.sh


#本机安装java
sh java_install.sh
#其他机器安装java
sh java_install_other.sh



#创建用户名密码,因为需要识别中文输入，expect不咋好用，这里需要手动创建用户

#拷贝host.ini到当前用户目录下
sh user_install.sh
#本机shanshan3用户配置免密登录
sh user_install_other.sh

#其他机器shanshan3用户配置免密登录


#本机安装
sh hadoop_install.sh
#其他机器安装java
sh hadoop_install_other.sh





















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


