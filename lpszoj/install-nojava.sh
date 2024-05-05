#!/usr/bin/env bash

red='\033[0;31m'
green='\033[0;32m'
yellow='\033[0;33m'
plain='\033[0m'


error_detect_depends(){
    local command=$1
    local depend=`echo "${command}" | awk '{print $4}'`
    echo -e "[${green}Info${plain}] Starting to install package ${depend}"
    ${command}
    if [ $? -ne 0 ]; then
        echo -e "[${red}Error${plain}] Failed to install ${red}${depend}${plain}"
        echo "Please visit: https://gitee.com/yhssdl/lpszoj/wikis and contact."
        exit 1
    fi
}

install_dependencies(){
    apt_depends=(
        php php-common php-gd php-zip php-xml php-simplexml php-mbstring php-fileinfo php-opcache php-fpm php-pdo php-pdo_mysql php-ctype php-session php-zip
        mariadb mariadb-client mariadb-dev 
        git make gcc g++ python3
    )
    for depend in ${apt_depends[@]}; do
        error_detect_depends "apk add ${depend}"
    done
}


config_lpszoj(){
	key="abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
	pass=""
	for i in {1..12}
	do
	  num=$[RANDOM%${#key}]
	  tmp=${key:num:1}
	  pass=${pass}${tmp}
	done

    DBNAME="ojdate"
    DBUSER="root"
    DBPASS=$pass

    PHP_VERSION=`php -v>&1|awk 'NR==1{print}'|awk -F ' ' '{print $2}'|awk -F '.' '{printf "%s%s\n", $1, $2}'`
    mv /etc/nginx/conf.d/default.conf /etc/nginx/conf.d/default.bak
    cat>/etc/nginx/conf.d/lpszoj.conf<<EOF
server {
    listen 80 default_server;
    listen [::]:80 default_server;
    root /var/www/lpszoj/web;
    index index.php;
    server_name _;
    client_max_body_size    128M;
    location / {
            try_files \$uri \$uri/ /index.php?\$args;
    }
    location ~ \.php$ {
            include fastcgi.conf;
            fastcgi_index     index.php;
            fastcgi_pass 127.0.0.1:9000;
    }
}
EOF
    cat>/etc/my.cnf<<EOF
[client-server]
port		= 3306

[mysqld]
port		= 3306
default_storage_engine = InnoDB
EOF
    DBUSER="root"
    /etc/init.d/mariadb setup
    rc-service mariadb start
    ln -s /usr/bin/php${PHP_VERSION} /usr/bin/php
    mysqladmin -u root password $DBPASS
    sed -i "s/post_max_size = 8M/post_max_size = 128M/g" /etc/php${PHP_VERSION}/php.ini
    sed -i "s/upload_max_filesize = 2M/upload_max_filesize = 128M/g" /etc/php${PHP_VERSION}/php.ini
     cat>/etc/init.d/judge<<EOF
#!/sbin/openrc-run

name="judge"
command="/var/www/lpszoj/judge/dispatcher"
command_args="-o"
#command_background="yes"
 
depend() {
	after networking mariadb
}
EOF
        cat>/etc/init.d/polygon<<EOF
#!/sbin/openrc-run

name="polygon"
command="/var/www/lpszoj/polygon/polygon"
#command_background="yes"
 
depend() {
	after networking mariadb
}
EOF
        chmod +x /etc/init.d/judge
        chmod +x /etc/init.d/polygon


    mysql -h localhost -u$DBUSER -p$DBPASS -e "create database ojdate;"
    if [ $? -eq 0 ]; then
        # Modify database information
        sed -i "s/'username' => 'ojdate'/'username' => '$DBUSER'/g" /var/www/lpszoj/config/db.php
        sed -i "s/OJ_USER_NAME=ojdate/OJ_USER_NAME=$DBUSER'/g" /var/www/lpszoj/judge/config.ini
        sed -i "s/OJ_USER_NAME=ojdate/OJ_USER_NAME=$DBUSER'/g" /var/www/lpszoj/polygon/config.ini       
        sed -i "s/123456/$DBPASS/g" /var/www/lpszoj/config/db.php
        sed -i "s/123456/$DBPASS/g"  /var/www/lpszoj/judge/config.ini
        sed -i "s/123456/$DBPASS/g"  /var/www/lpszoj/polygon/config.ini

        sed -i "s/OJ_MYSQL_UNIX_PORT/#OJ_MYSQL_UNIX_PORT/g"  /var/www/lpszoj/judge/config.ini
        sed -i "s/OJ_MYSQL_UNIX_PORT/#OJ_MYSQL_UNIX_PORT/g"  /var/www/lpszoj/polygon/config.ini
    fi
}

enable_server(){
    PHP_VERSION=`php -v>&1|awk 'NR==1{print}'|awk -F ' ' '{print $2}'|awk -F '.' '{printf "%s%s\n", $1, $2}'`
        rc-update add mariadb
        rc-update add php-fpm${PHP_VERSION}
        rc-service mariadb restart
        rc-service php-fpm${PHP_VERSION} restart
}

install_lpszoj(){
    install_dependencies
    adduser -D -u 1536 judge
    mkdir /var/www
    cd /var/www/
    git clone https://gitee.com/yhssdl/lpszoj.git
    rm -rf /var/www/lpszoj/.git
    rm -rf /var/www/lpszoj/.vscode
    rm -rf /var/www/lpszoj/docs

    config_lpszoj
    enable_server

    cd /var/www/lpszoj
    echo -e "yes" "\n" "admin" "\n" "123456" "\n" "admin@lpszoj.org" | ./yii install
    cd /var/www/lpszoj/judge
    make
    ./dispatcher -o
    cd /var/www/lpszoj/polygon
    make
    ./polygon
    echo
    echo
    echo -e "[${green}Mysql account${plain}] $DBUSER"
    echo -e "[${green}Password${plain}] $DBPASS"
    echo
    echo -e "[${green}Administrator account${plain}] admin"
    echo -e "[${green}Password${plain}] 123456"
    echo
    echo "Enjoy it!"
    echo "Welcome to visit: https://gitee.com/yhssdl"
    echo
    echo "Successful installation"
}

install_lpszoj
apk del wget
rm -rf /var/cache/apk/*
rm /root/install.sh
rm /root/install-nojava.sh

