## Docker 安装使用日记

### Docker 引擎安装

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
<br>

### Docker 阿里镜像加速

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

- > 查看是否生效

    ```sh
    docker info | grep Mirrors -A 1
    ```

<br>

### Docker-compose 安装

1. 安装脚本 

    ```sh
    curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    ```

- > 给docker-compose赋予运行权限

    ```sh
    chmod +x /usr/local/bin/docker-compose
    ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
    ```

- > 对于 ***alpine***，需要以下依赖包： py-pip，python-dev，libffi-dev，openssl-dev，gcc，libc-dev，和 make。

    ```sh
    apk add py-pip python-dev libffi-dev openssl-dev gcc libc-dev make
    ```

- > 测试是否成功

    ```sh
    docker-compose --version
    ```
