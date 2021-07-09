# Derived from official mysql image (our base image)
FROM mysql:8.0

RUN sed -i '/^\[mysqld\]$/a\default-authentication-plugin=mysql_native_password\ncharacter-set-server=utf8mb4\ncollation-server=utf8mb4_unicode_ci' /etc/mysql/my.cnf

WORKDIR /var/www/html/
COPY waitForMySQL.sh /var/www/html/
RUN chmod +rwx waitForMySQL.sh

CMD ["mysqld"]
