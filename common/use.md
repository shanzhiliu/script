

#下载脚本
wget https://raw.githubusercontent.com/shanzhiliu/script/master/common/download.sh && chmod 777 download.sh && ./download.sh&&chmod 777 *

#先创建其他用户在所有机器上
useradd test
passwd test


#配置host.ini
vim host.ini


#配置user_host.ini
vim user_host.ini

运行安装脚本
./install_all.sh