rm -rf /root/*
rm -rf /root/.ssh
rm -rf /opt/soft/

echo "" >  /etc/hosts

sed -i '13,2000d' /root/.bash_profile
userdel -r shanshan3

source ~/.bash_profile

#rm -rf /home/shanshan3/*
#rm -rf /home/shanshan3/.ssh

 