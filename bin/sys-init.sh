# 关闭防火墙
$ systemctl stop firewalld && systemctl disable firewalld
# 重置iptables
$ iptables -F && iptables -X && iptables -F -t nat && iptables -X -t nat && iptables -P FORWARD ACCEPT
# 关闭swap
$ swapoff -a
$ sed -i '/swap/s/^\(.*\)$/#\1/g' /etc/fstab
# 关闭selinux
$ setenforce 0
# 关闭dnsmasq(否则可能导致docker容器无法解析域名)
$ service dnsmasq stop && systemctl disable dnsmasq

