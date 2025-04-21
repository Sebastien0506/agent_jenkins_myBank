FROM jenkins/inbound-agent:latest

USER root

# Installer PHP, Composer, et Symfony CLI
RUN apt-get update && \
    apt-get install -y curl php php-cli unzip git && \
    curl -sS https://getcomposer.org/installer | php && \
    mv composer.phar /usr/local/bin/composer && \
    curl -sS https://get.symfony.com/cli/installer | bash && \
    mv /root/.symfony*/bin/symfony /usr/local/bin/symfony && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Vérifier les versions
RUN php -v && composer -V && symfony -V

USER jenkins