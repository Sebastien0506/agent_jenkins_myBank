FROM jenkins/inbound-agent:latest

USER root

# Installer PHP et les extensions nécessaires
RUN apt-get update && apt-get install -y \
    php-cli php-mysql php-pdo \
    php-mbstring \
    php-xml \
    php-dom \
    php-intl \
    unzip \
    curl \
    git \
 && curl -sS https://getcomposer.org/installer | php \
 && mv composer.phar /usr/local/bin/composer \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

USER jenkins