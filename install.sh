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
