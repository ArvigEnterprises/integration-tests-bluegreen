FROM arvigtestregistry.azurecr.io/laravel-image:php8.1.laravel.9.1
#FROM arvig.azurecr.io/laravel-image:php8.1.laravel.9.1
ARG NOVA_USERNAME
ARG NOVA_PASSWORD

LABEL maintainer="Arvig Development Team"

WORKDIR /var/www/laravel

# Apt stuff
RUN apt-get update && curl -sL https://deb.nodesource.com/setup_16.x | bash - && apt-get install -y nodejs

# Deleting base folder if this is not first build
COPY . /temp
RUN if test -f "/temp/config/app.php"; then rm -rf /var/www/laravel/; fi; rm -rf /temp

# Copy our repo code into the container
COPY . /var/www/laravel

# Fixup perms
RUN chmod -R u+rwX,go+rX /var/www/laravel/ && chown -R www-data:www-data /var/www/laravel/ && chmod +x /var/www/laravel/.deploy/startup.sh

# # Add Nova
# RUN composer config repositories.nova '{"type": "composer", "url": "https://nova.laravel.com"}' --file composer.json && \
#     composer config --global http-basic.nova.laravel.com $NOVA_USERNAME $NOVA_PASSWORD && \
#     composer require laravel/nova && \
#     rm /root/.config/composer/auth.json && \
#     composer clearcache

# Install our Node APP && Run Composer Install && Enable Apache mod_rewrite
# RUN npm install && composer install && a2enmod rewrite
RUN a2enmod rewrite
EXPOSE 80
# Start Apache2
CMD ["/var/www/laravel/.deploy/startup.sh"]
