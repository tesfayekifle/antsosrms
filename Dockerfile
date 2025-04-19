# Use an official PHP image as a base
FROM php:8.1-apache

# Enable Apache mod_rewrite (needed for some PHP applications)
RUN a2enmod rewrite

# Install any PHP extensions you need, for example:
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy the local code to the container's web directory
COPY . /var/www/html/

# Set permissions for Apache to access the files
RUN chown -R www-data:www-data /var/www/html

# Expose the port that Apache will run on
EXPOSE 80

# Start Apache in the foreground
CMD ["apache2-foreground"]