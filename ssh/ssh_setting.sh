#第1个参数  是1 root可以登录，是2 root不可以可以登录
#第2个参数  是1 可以密码登录，是2 不可以密码登录

if [ -n "$1" ]; then

    # open
    if [ $1 == 1 ]; then
    sed -i  "s/PermitRootLogin no/PermitRootLogin yes/g" /etc/ssh/sshd_config
    else
    sed -i  "s/PermitRootLogin yes/PermitRootLogin no/g" /etc/ssh/sshd_config
    fi

else

  echo "请输入参数"
  exit
     
fi


if [ -n "$2" ]; then
     
    # open
    if [ $2 == 1 ]; then
    sed -i  "s/PasswordAuthentication no/PasswordAuthentication yes/g" /etc/ssh/sshd_config
    else
    sed -i  "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config
    fi
    
else

  echo "请输入参数"
  exit
     
fi

systemctl restart sshd.service
echo "修改成功"
