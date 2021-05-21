 sudo yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
sudo yum install -y yum-utils

sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

sudo yum install docker-ce


sudo mkdir -p /etc/docker
sudo tee /etc/docker/daemon.json <<-'EOF'
{
"registry-mirrors": [
 "https://mirror.ccs.tencentyun.com"
]
}
EOF
sudo systemctl daemon-reload
sudo systemctl restart docker

作者：彭阿三
链接：https://juejin.cn/post/6955296519964753928
来源：掘金
著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。

