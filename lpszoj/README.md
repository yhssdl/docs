# LPSZOJ 的 Docker 镜像构建

1. 将几个文件上传到 Docker 的 linux 当前目录中。

    ```sh
    apt install wget
    apk add wget
    wget https://gitee.com/yhssdl/docs/raw/master/lpszoj/Dockerfile
    wget https://gitee.com/yhssdl/docs/raw/master/lpszoj/docker-entrypoint.sh
    wget https://gitee.com/yhssdl/docs/raw/master/lpszoj/install-nojava.sh
    wget https://gitee.com/yhssdl/docs/raw/master/lpszoj/install.sh

    ```

2. 构建镜像：`docker build -t lpszoj .`
3. 运行容器并进入：`docker run -it -p 80:80 --name lpszoj lpszoj nginx`
4. 修改 `docker-entrypoint.sh` 文件内容，将 `if` 中的 `nginx` 改为 `sh`
5. 一键安装OJ系统：`bash /root/install-nojava.sh` 或 `bash /root/install.sh`
6. 退出容器：`exit`
7. 将容器重新打包为新的镜像：`docker commit lpszoj yhssdl/lpszoj`
8. 删除容器：`docker rm lpszoj`
9.  运行新的容器，测试是否成功：`docker run -p 80:80 --name lpszoj yhssdl/lpszoj`