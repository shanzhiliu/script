# wget https://raw.githubusercontent.com/shanzhiliu/script/newShell/mongo/mongo_install.sh

# 配置文件修改
cat > /etc/yum.repos.d/mongodb-org.repo<<EOF
[mongodb-org]
name=MongoDB Repository
baseurl=http://mirrors.aliyun.com/mongodb/yum/redhat/7/mongodb-org/4.2/x86_64/
gpgcheck=0
enabled=1
EOF

# 安装
sudo yum install -y mongodb-org

#修改绑定的ip 从 127.0.0.1 -> 0.0.0.0
sed -i "s/bindIp: 127.0.0.1/bindIp: 0.0.0.0/g" /etc/mongod.conf

#关闭防火墙
systemctl stop firewalld.service  

#启动
systemctl start mongod.service