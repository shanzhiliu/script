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

#先清空hosts
echo "" > /etc/hosts
ConfigHosts