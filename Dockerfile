FROM php:8.2-fpm

# Установка нужных расширений

RUN apt-get update && apt-get install -y \

    build-essential \

    libpng-dev \

    libjpeg-dev \

    libonig-dev \

    libxml2-dev \

    zip \

    unzip \

    curl \

    git \

    libzip-dev \

    libpq-dev \

    && docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip

# Установка Composer

COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Установка рабочего каталога

WORKDIR /var/www

# Копирование файлов

COPY . .

# Установка зависимостей Laravel

RUN composer install --optimize-autoloader --no-dev

# Генерация кешей (необязательно, если .env ещё не готов)

RUN php artisan config:clear || true

RUN php artisan route:clear || true

EXPOSE 8000

CMD php artisan serve --host=0.0.0.0 --port=8000
