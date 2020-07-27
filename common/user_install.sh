cuuser=shanshan3
#创建用户
useradd $cuuser
#设置密码
echo "123hsdfuq3oiqddksYUFCZqw34QwoeFFwww233" | passwd -stdin $cuuser
cp user_host.ini nopasswd_install.sh user_install_other.sh /home/$cuuser/
su - $cuuser << EOF
mv user_host.ini host.ini 
sh nopasswd_install.sh
EOF