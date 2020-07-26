cuuser=shanshan3
cp user_host.ini nopasswd_install.sh user_install_other.sh /home/$cuuser/
su - $cuuser << EOF
mv user_host.ini host.ini 
sh nopasswd_install.sh
EOF