FROM php:7.4.33-fpm-alpine

# Install system dependencies for PHP extensions + msmtp
RUN apk add --no-cache \
    bash \
    git \
    curl \
    unzip \
    icu-dev \
    libzip-dev \
    oniguruma-dev \
    autoconf \
    make \
    g++ \
    msmtp

# Install PHP extensions needed for WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql intl mbstring zip

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- \
    --install-dir=/usr/local/bin --filename=composer

# Configure msmtp
RUN echo "defaults" > /etc/msmtprc \
 && echo "auth           off" >> /etc/msmtprc \
 && echo "tls            off" >> /etc/msmtprc \
 && echo "logfile        /var/log/msmtp.log" >> /etc/msmtprc \
 && echo "account mailpit" >> /etc/msmtprc \
 && echo "host mailpit" >> /etc/msmtprc \
 && echo "port 1025" >> /etc/msmtprc \
 && echo "from no-reply@wp-admin.com" >> /etc/msmtprc \
 && echo "account default : mailpit" >> /etc/msmtprc \
 && chown www-data:www-data /etc/msmtprc \
 && chmod 600 /etc/msmtprc

# Prepare log file
RUN mkdir -p /var/log \
 && touch /var/log/msmtp.log \
 && chown www-data:www-data /var/log/msmtp.log \
 && chmod 644 /var/log/msmtp.log

# Ensure PHP-FPM uses msmtp for mail()
RUN echo "sendmail_path = /usr/bin/msmtp -t -f no-reply@wp-admin.com" > /usr/local/etc/php/conf.d/sendmail.ini

WORKDIR /var/www/html
