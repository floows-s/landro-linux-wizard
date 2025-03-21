#!/usr/bin/env bash
if [ ! -d "vendor" ]; then
  if [ -f "composer.json" ]; then
    echo "Vendor directory not found. Installing dependencies..."
    composer install --no-cache --optimize-autoloader
    php artisan package:discover --ansi
  else
    echo "composer.json not found. Skipping dependency installation."
  fi
fi

if [ -f "artisan" ]; then
  php artisan octane:install --server=roadrunner
  php artisan octane:start --server=roadrunner --port=9807 --host=0.0.0.0
else
  echo "Laravel project not found. Please create the project first."
  echo "Keeping the container running..."
  tail -f /dev/null
fi
