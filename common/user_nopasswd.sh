cuuser=shanshan3
#拷贝host.ini到当前用户目录下,执行免密登录
sh user_install.sh
#本机shanshan3用户配置免密登录
su - $cuuser << EOF
sh user_install_other.sh
EOF