> 将相应的配置文件上传到 Docker 主机上，就可以一键安装。

### Wordpress
<details>
<summary>点击开展 wordpress.yml 配置</summary><pre><code>
version: '3.1'

services:

  wordpress:
    image: wordpress
    restart: always
    ports:
      - 8088:80
    environment:
      WORDPRESS_DB_HOST: db
      WORDPRESS_DB_USER: exampleuser
      WORDPRESS_DB_PASSWORD: examplepass
      WORDPRESS_DB_NAME: exampledb
    volumes:
      - wordpress:/var/www/html

  db:
    image: mysql:5.7
    restart: always
    environment:
      MYSQL_DATABASE: exampledb
      MYSQL_USER: exampleuser
      MYSQL_PASSWORD: examplepass
      MYSQL_RANDOM_ROOT_PASSWORD: '1'
    volumes:
      - db:/var/lib/mysql

volumes:
  wordpress:
  db:
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
