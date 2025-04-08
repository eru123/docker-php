# docker-php

For complete list of tags see [Docker Hub](https://hub.docker.com/r/lighty262/php/tags).  
For Documentation please refer to [PHP official repo](https://hub.docker.com/_/php).

### Added Features
 - [x] Composer installed
 - [x] `.htaccess` enabled
 - [x] `TZ` env
 - [x] `HOST_ID` and `HOST_GID` env for permission issues related to cross-container volume mounting (e.g. sftp and ssh containers)
 - [x] `COMPOSER_DIR` and `COMPOSER_DIRS` env for composer install at startup, to fix overwriting of `vendor` directory when mounting a volume
 - [x] Pre-installed PHP extensions
    - mysqli 
    - pdo 
    - pdo_mysql 
    - zip 
    - intl 
    - opcache 
    - xml

### Environment variables (Optional)
| Docker Environment  | Description |
| ------------- | ------------- |
| `TZ`  | Set the System Timezone  |
| `PWD`  | The Container Workdir (`/var/www/html`)  |
| `HOST_ID`  | The Container User ID  |
| `HOST_GID`  | The Container Group ID  |
| `INI_ENV`  | Use `development` or `production` .ini file (default to `production`)  |
| `COMPOSER_DIR` | Composer install directory, can be absolute or relative to `PWD`  |
| `COMPOSER_DIRS` | Composer install directories separated by space, can be absolute or relative to `PWD` |

### Manually update `php.ini`

If you have manually configured `php.ini`, you can replace the default `.ini` files.

```Dockerfile
FROM lighty262/php:latest-apache

COPY php.ini /usr/local/etc/php/php.ini-development
COPY php.ini /usr/local/etc/php/php.ini-production
COPY php.ini /usr/local/etc/php/php.ini
```
