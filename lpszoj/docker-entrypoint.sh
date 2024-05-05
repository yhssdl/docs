#!/bin/sh
if [ "$1" = "nginx" ] ; then
    exec "sh"
else
    rc-service mariadb restart
    rc-service php-fpm82  restart
    /var/www/lpszoj/judge/dispatcher -o
    /var/www/lpszoj/polygon/polygon
    nginx -g "daemon off;"
fi
