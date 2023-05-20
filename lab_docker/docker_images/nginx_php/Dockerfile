FROM centos:7
RUN yum update -y
RUN yum install epel-release -y
RUN yum install nginx -y
RUN yum -y install https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
RUN yum -y install https://rpms.remirepo.net/enterprise/remi-release-7.rpm
RUN yum -y install yum-utils
RUN yum-config-manager --disable 'remi-php*'
RUN yum-config-manager --enable remi-php81
RUN yum repolist
RUN yum -y install php php-{cli,fpm,mysqlnd,zip,devel,gd,mbstring,curl,xml,pear,bcmath,json,opcache,redis,memcache}
# Configure nginx - http
#COPY nginx.conf /etc/nginx/nginx.conf
# Configure nginx - default server
#COPY conf.d /etc/nginx/conf.d/
COPY www.conf /etc/php-fpm.d/www.conf
COPY info.php /usr/share/nginx/html/info.php
COPY start.sh start.sh
RUN chmod 777 start.sh
#EXPOSE 8080
CMD /start.sh



    