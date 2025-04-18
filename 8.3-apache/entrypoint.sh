#!/bin/sh

if [ -n "$TZ" ]; then
    ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
fi

if [ -z "$PWD" ]; then
    PWD=/var/www/html
fi

if [ -n "$HOST_ID" ]; then
    usermod -u $HOST_ID www-data
fi

if [ -n "$HOST_GID" ]; then
    groupmod -g $HOST_GID www-data
fi

if [ "$INI_ENV" = "development" ]; then
    cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini
else
    cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini
fi

cd $PWD

if [ -n "$COMPOSER_DIR" ]; then
    cd $COMPOSER_DIR && composer install --no-interaction --no-progress --optimize-autoloader
elif [ -f "composer.json" ]; then
    composer install --no-interaction --no-progress --optimize-autoloader
fi

if [ -n "$COMPOSER_DIRS" ]; then
    for COMPOSER_DIR in $COMPOSER_DIRS; do
        cd $PWD && cd $COMPOSER_DIR && composer install --no-interaction --no-progress --optimize-autoloader
    done
fi

# cd $PWD && printenv > .env # Uncomment if you want to use .env file
apache2-foreground
