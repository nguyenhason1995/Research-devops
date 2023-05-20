PHP:7.3-FPM(php-product)
- port: 9000
- Cài mysqli, pd0_mysql
- Thư mục làm việc : /home/site/sites1
APACHE HTTPD :(c-httpd01) 
- port: 80, 443
- config: /usr/local/apache2/conf/httpd.config
    *Nạp mod _proxy, mod_proxy_fcgi
    *Thư mục làm việc: /home/site/sites1
    *index mặc định : index.php index.html
    *PHPHANDLER: AddHandler "proxy:fcgi://php-product:9000" .php

MYSQL: (mysql-product)
    - port :3304
    - config: /etc/mysql/my.conf
        *default-authentication-plugin=mysql_native_password
    - databases: /var/lib/mysql -> /mycode/db
    - MYSQL_ROOT_PASSWORD: 123abc
    - MYSQL_DATABASE:db_site
    - MYSQL_USER: siteuser
    - MYSQL_PASSWORD: sitepass

NETWORK: 
    - bridge
    - my-network 

VOLUME:
    - dir-site
    - bind, devide =/mycode/