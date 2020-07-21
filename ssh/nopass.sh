function sshkeygen() {

/usr/bin/expect << EOF
set timeout 30
spawn ssh-keygen -t rsa
expect {
    ".ssh/id_rsa)" { send "\r";exp_continue }
    "Overwrite (y/n)?" { send "y\r";exp_continue }
     "empty for no passphrase)" { send "\r";exp_continue }
     "passphrase again" { send "\r"}
    }
expect eof
EOF

}


function sshkeypush() {

echo "--------------------------------"
echo $2

/usr/bin/expect << EOF
set timeout 30
spawn ssh-copy-id -i $1
expect {
    "yes/no" { send "yes\r";exp_continue }
    "password:" { send "$2\r"}
    }
expect eof
EOF
}

CONFIG_PATH="host.ini"
CONFIGS=()

# 读取配置文件
if [ -f ${CONFIG_PATH} ]; then
    CONFIGS=()
    while read line
    do
        # 注释行或空行 跳过
        if [[ ${line:0:1} == "#" || $line =~ ^$ ]]; then
            continue
        else
            CONFIGS+=("$line")
        fi
    done < ${CONFIG_PATH}
fi

#服务器配置数
CONFIG_LENGTH=${#CONFIGS[*]}  #配置站点个数


##
# 配置hosts
##
function ConfigHosts(){
    echo -e "配置hosts--开始\t"
    for ((i=0;i<${CONFIG_LENGTH};i++));
    do
        CONFIG=(${CONFIGS[$i]}) #将一维sites字符串赋值到数组
        echo "${CONFIG[3]} ${CONFIG[0]}" >> /etc/hosts   
    done
    echo -e "配置hosts--完成\t"
}

##
# 拷贝本地秘钥到所有服务器（包括自己）
##
function ConfigPasswd(){
    echo -e "拷贝本地秘钥到其他服务器--开始\t"
    for ((i=0;i<${CONFIG_LENGTH};i++));
    do
        CONFIG=(${CONFIGS[$i]}) #将一维sites字符串赋值到数组
        sshkeypush ${CONFIG[0]} ${CONFIG[5]}
    done
    
     echo -e "拷贝本地秘钥到其他服务器---完成\t"
}

##
# 拷贝本地host.ini 和 nopass.sh
##
function ConfigPushShell(){
    echo -e "拷贝本地脚本到其他服务器--开始\t"
    for ((i=0;i<${CONFIG_LENGTH};i++));
    do
        CONFIG=(${CONFIGS[$i]}) #将一维sites字符串赋值到数组
        scp host.ini nopass.sh  ${CONFIG[4]}@${CONFIG[3]}:~
    done
    
     echo -e "拷贝本地脚本到其他服务器---完成\t"
}
 

yum -y install expect
yum -y install openssh-server
sshkeygen
ConfigHosts
ConfigPasswd
ConfigPushShell


