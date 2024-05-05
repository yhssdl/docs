> 将相应的配置文件上传到 Docker 主机上，就可以一键安装。

### Wordpress [点击查看配置 ](wordpress.yml)

- 执行命令一键下载并运行 wordpress

```sh
docker-compose -f wordpress.yml up -d #后台运行
```

- 停止服务，并删除容器。

```sh
docker-compose -f wordpress.yml down #停止并删除服务
```
