FROM ubuntu:latest

MAINTAINER venantvr

RUN apt-get update

# Install Atom
RUN apt-get install -y --no-install-recommends \
    apt-utils \
    ca-certificates \
    curl \
    fakeroot \
    gconf2 \
    gconf-service \
    git \
    gvfs-bin \
    libasound2 \
    libcanberra-gtk-module \
    libcap2 \
    libgconf-2-4 \
    libgtk2.0-0 \
    libnotify4 \
    libnss3 \
    libxkbfile1 \
    libxss1 \
    libxtst6 \
    python \
    snap \
    wget \
    xdg-utils

RUN wget https://github.com/atom/atom/releases/download/v1.17.1/atom-amd64.deb
RUN dpkg -i atom-amd64.deb

RUN apm install monokai-seti \
    hyperclick \
    intentions \
    file-icons \
    save-session \
    keybinding-cheatsheet \
    git-plus \
    imdone-atom \
    project-manager \
    php-integrator-base \
    php-integrator-autocomplete-plus \
    php-integrator-navigation \
    php-integrator-tooltips \
    php-integrator-annotations \
    php-integrator-call-tips \
    php-integrator-refactoring \
    php-integrator-linter \
    php-integrator-symbol-viewer

VOLUME ["/var/www", "/var/www/html", "/var/www/sql", "/var/www/code"]
WORKDIR /var/www

RUN apt-get install -y --no-install-recommends chromium-browser
RUN apt-get install -y --no-install-recommends libglu1-mesa
RUN apt-get install -y --no-install-recommends php
RUN apt-get install -y --no-install-recommends git-core
RUN apt-get install -y --no-install-recommends php7.0-sqlite
RUN apt-get install -y --no-install-recommends sqlite3

# Todo...
RUN apt-get -y install \
    php-xml \
    php-pear \
    php-mbstring \
    openssl

RUN usermod -u 1000 www-data
RUN chown -R www-data:www-data /var/www

CMD ["/usr/bin/atom","-f"]

