FROM ubuntu:latest

MAINTAINER venantvr

RUN apt-get update

# Add the PPA for PHP 5.6
RUN apt-get -y install software-properties-common
RUN LC_ALL=C.UTF-8 add-apt-repository ppa:ondrej/php -y

RUN apt-get update

# Update software list and install php + apache + etc...
RUN apt-get install -y \
    apache2 \
    git \
    libapache2-mod-php \
    libcurl3-openssl-dev \
    libxslt-dev \
    mysql-client \
    php5.6 \
    php5.6-fpm \
    php5.6-cli \
    php5.6-mysql \
    php5.6-mcrypt \
    php5.6-curl \
    php5.6-gd \
    php5.6-intl \
    php5.6-mbstring \
    php5.6-dev \
    php5.6-apcu \
    php5.6-curl \
    php5.6-intl \
    php5.6-xdebug \
    php-xml \
    php-pear \
    libapache2-mod-php5.6

RUN a2dismod php7.1
RUN a2enmod php5.6
RUN service apache2 restart

RUN pecl install xdebug

ADD php-custom.ini /etc/php/5.6/apache2/conf.d/
ADD 20-xdebug.ini /etc/php/5.6/apache2/conf.d/
ADD php-custom.ini /etc/php/5.6/cli/conf.d/
ADD 20-xdebug.ini /etc/php/5.6/cli/conf.d/

RUN php -r "readfile('https://getcomposer.org/installer');" | php -- --install-dir=/usr/local/bin --filename=composer \
    && chmod +x /usr/local/bin/composer

EXPOSE 80

WORKDIR /etc/php5.6

CMD /usr/sbin/apache2ctl -D FOREGROUND
