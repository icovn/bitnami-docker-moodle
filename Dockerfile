FROM bitnami/moodle:3.8.2

# install additional packages
RUN apt-get update && apt-get install -y autoconf build-essential dnsutils iputils-ping wget vim

# install php-redis
RUN wget https://pecl.php.net/get/redis-5.2.1.tgz && tar -xvf redis-5.2.1.tgz && cd redis-5.2.1 && phpize && ./configure && make && make install
RUN echo "extension=redis.so" >> /opt/bitnami/php/conf/php.ini
RUN php -m | grep redis