# Docker 日常记录

## Docker 引擎安装

1. Debian、Ubunut

```sh
apt install curl -y
curl -fsSL https://test.docker.com -o test-docker.sh
sh test-docker.sh
```

2. Alpine

```sh
apk add docker
rc-update add docker boot
rc-service docker start
```

## Docker 阿里镜像加速

1. Debian Ubunut

```sh
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://zwfid6bx.mirror.aliyuncs.com"]
}
EOF
systemctl daemon-reload
systemctl restart docker
```

2. Alpine

```sh
mkdir -p /etc/docker
tee /etc/docker/daemon.json <<-'EOF'
{
  "registry-mirrors": ["https://zwfid6bx.mirror.aliyuncs.com"]
}
EOF
rc-service docker restart
```

## Docker-compose 安装

```sh
curl -L https://get.daocloud.io/docker/compose/releases/download/1.25.5/docker-compose-`uname -s`-`uname -m`  > /usr/local/bin/docker-compose
```
> 给docker-compose赋予运行权限
```sh
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
```

> 测试是否成功

```sh
docker-compose --version
```