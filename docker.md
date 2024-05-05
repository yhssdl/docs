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