FROM php:7.4-fpm

# Install required PHP extensions for WordPress
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Install system dependencies
RUN apt-get update && apt-get install -y \
    unzip \
    git \
    curl \
    msmtp \
    && rm -rf /var/lib/apt/lists/*

# Install Composer globally
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

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

# Prepare log file with correct permissions
RUN touch /var/log/msmtp.log \
 && chown www-data:www-data /var/log/msmtp.log \
 && chmod 644 /var/log/msmtp.log

# Ensure PHP-FPM uses msmtp for mail() with envelope sender
RUN echo "sendmail_path = /usr/bin/msmtp -t -f no-reply@example.com" > /usr/local/etc/php/conf.d/sendmail.ini

WORKDIR /var/www/html