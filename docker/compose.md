> 将相应的配置文件上传到 Docker 主机上，就可以一键安装。

### Wordpress
<details>
<summary>点击开展 wordpress.yml 配置</summary><pre><code>
version: '3.3'
services:
   db:
     image: mysql:5.7
     volumes:
       - db_data:/var/lib/mysql
     restart: always
     environment:
       MYSQL_ROOT_PASSWORD: somewordpress
       MYSQL_DATABASE: wordpress
       MYSQL_USER: wordpress
       MYSQL_PASSWORD: wordpress
   wordpress:
     depends_on:
       - db
     image: wordpress:latest
     ports:
       - "8088:80"
     restart: always
     environment:
       WORDPRESS_DB_HOST: db:3306
       WORDPRESS_DB_USER: wordpress
       WORDPRESS_DB_PASSWORD: wordpress
       WORDPRESS_DB_NAME: wordpress
volumes:
    db_data: {}
</code></pre></details>

---

- 下载 wordpress.yml 文件

```sh
apt install wget
apk add wget
wget https://gitee.com/yhssdl/docs/raw/master/docker/wordpress.yml
```

- 创建容器、运行 wordpress

```sh
docker-compose -f wordpress.yml up -d #后台运行，访问端口8088
```

- 停止服务，并删除容器。

```sh
docker-compose -f wordpress.yml down #停止并删除服务
```
