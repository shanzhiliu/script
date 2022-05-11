# wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/mysql/mysql_uninstall.sh


# 卸载mysql
lines=`rpm -qa|grep mysql`

# 后边拼接上一次命令的结果
# rpm -e --nodeps

for line in $lines
do
rpm -e --nodeps $line
str="rpm -e --nodeps $line"
echo $str 
done



rm -rf /var/lib/mysql
rm -rf /var/lib/mysql/mysql

rm -rf /usr/share/mysql
rm -rf /usr/lib64/mysql

rm -rf /var/log/mysqld.log
