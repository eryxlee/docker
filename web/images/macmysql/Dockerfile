FROM mysql:5.7
RUN usermod -u 1000 mysql
RUN usermod -G staff mysql
RUN chown mysql /var/run/mysqld
EXPOSE 3306

