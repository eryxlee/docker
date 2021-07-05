#!/bin/bash
# 添加更新源国内开源镜像的地址。腾讯ECS中已经处理
#
# 更新系统
#yum -y update && yum -y upgrade
# 关闭防火墙
sudo systemctl stop firewalld && systemctl disable firewalld
# 重置iptables
sudo iptables -F && iptables -X && iptables -F -t nat && iptables -X -t nat && iptables -P FORWARD ACCEPT
# 关闭swap
sudo swapoff -a
sudo sed -i '/swap/s/^\(.*\)$/#\1/g' /etc/fstab
# 关闭selinux
sudo setenforce 0
# 永久关闭 修改/etc/sysconfig/selinux文件设置
sed -i 's/SELINUX=permissive/SELINUX=disabled/' /etc/sysconfig/selinux
sed -i "s/SELINUX=enforcing/SELINUX=disabled/g" /etc/selinux/config
# 关闭dnsmasq(否则可能导致docker容器无法解析域名)
sudo systemctl stop dnsmasq && systemctl disable dnsmasq
