
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

function ConfigRunShell(){
    echo -e "连接到其他服务器运行脚本--开始\t"
    for ((i=0;i<${CONFIG_LENGTH};i++));
    do
        CONFIG=(${CONFIGS[$i]}) #将一维sites字符串赋值到数组
        ssh -T -p ${CONFIG[2]} ${CONFIG[4]}@${CONFIG[3]} << EOF 
        rm -rf $HADOOP_HOME/tmpdata
        rm -rf $HADOOP_HOME/hadoop/dfs/name/
        rm -rf $HADOOP_HOME/hadoop/hdfs/data/
EOF
    done
    
     echo -e "连接到其他服务器运行脚本---完成\t"
}

ConfigRunShell


cuuser=shanshan3
#本机shanshan3用户配置免密登录
su - $cuuser << EOF
#使生效
source ~/.base_profile
hdfs namenode -format

EOF