# wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/mysql/mysql_install.sh


# 卸载mysql
lines=`rpm -qa|grep mysql`


for line in $lines
do
rpm -e --nodeps $line
str="rpm -e --nodeps $line"
echo $str 
done


# 后边拼接上一次命令的结果
# rpm -e --nodeps
