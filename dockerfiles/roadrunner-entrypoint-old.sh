#!/usr/bin/env bash
if [ -f "artisan" ]; then
  php artisan octane:install --server=roadrunner
  php artisan octane:start --server=roadrunner --port=9807 --host=0.0.0.0
else
  echo "Laravel project not found. Please create the project first."
  echo "Keeping the container running..."
  tail -f /dev/null
fi
