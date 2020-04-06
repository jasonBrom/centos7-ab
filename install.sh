#!/bin/bash
# BY：WKZ
# AB压力测试一键安装魔改

clear
echo "准备开始安装"
clear
echo "---------------------"

echo "欢迎使用AB压力测试一键安装魔改脚本 V1.0"
echo "本脚本仅适用于Centos7x(其他系统未测试)"
echo "By:CXK"
echo "10秒后开始安装，如果要退出安装请按 唱跳Rap篮球(Ctrl)+草(C)"
echo "安装魔改版可能会造成系统不稳定"

echo "---------------------"
sleep 10s
clear
echo "开始安装AB"
sleep 1s
yum -y install httpd-tools
sleep 1s
clear
echo "开始魔改AB"
ulimit -n 35768
echo "net.ipv4.tcp_syncookies = 0" >> /etc/sysctl.conf
sysctl -p
echo "魔改完成"
clear
sleep 1s
echo "开始安装HTTP环境"
sleep 1s
yum install pip -y
pip3 install -r requirements.txt
yum install git -y
yum install python3 -y
yum install htop -y
yum -y update
yum install gcc libcap libpcap libpcap-devel screen php dstat cmake gmp gmp-devel gengetopt byacc flex git json-c zmap iptraf nano -y
yum groupinstall "Development Tools" -y
yum install gcc php-devel php-pear libssh2 libssh2-devel -y
clear
echo "安装时如果出现输入框回车即可"
sleep 3s
pecl install -f ssh2
clear
echo "---------------------------"
sleep 1s
touch /etc/php.d/ssh2.ini
echo -e“\n”
echo extension=ssh2.so > /etc/php.d/ssh2.ini
Service httpd restart
chkconfig httpd on
chkconfig --list | grep httpd
chkconfig -add httpd
chkconfig httpd on
systemctl start httpd.service
systemctl enable httpd.service
iptables -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT
service iptables save
service iptables restart
firewall-cmd --zone=public --add-port=80/tcp --permanent
firewall-cmd --reload
pip3 install -r requirements.txt
clear
echo "开始下载脚本"
wget https://raw.githubusercontent.com/jasonBrom/centos7-ab/master/api.php
mv api.php /var/www/html
cd /var/www/html

clear
echo "--------------------------------------------"
echo "安装完成请修改 vi /var/www/html/api.php设置服务器IP密码"
echo "--------------------------------------------"
