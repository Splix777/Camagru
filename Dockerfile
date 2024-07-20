FROM php:7.4-apache

# Install dependencies
RUN docker-php-ext-install pdo pdo_mysql

# Enable mod_rewrite for Apache
RUN a2enmod rewrite

# Set the DocumentRoot to the public directory
ENV APACHE_DOCUMENT_ROOT /var/www/html/public

# Configure Apache to use the correct DocumentRoot
COPY /apache/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Copy application source
COPY . /var/www/html/

# Set working directory
WORKDIR /var/www/html/

# Set permissions for the application directory
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html

# Expose port 80
EXPOSE 80
