.PHONY: create-project breeze

create-project:
	@echo "Creating Laravel project..."
	@docker compose exec roadrunner sh -c '\
		composer --no-cache create-project laravel/laravel . && \
		php artisan migrate:fresh && \
		composer --no-cache require laravel/octane '

breeze:
	@echo "Installing Laravel Breeze..."
	@docker compose exec roadrunner sh -c '\
		composer --no-cache require laravel/breeze --dev && \
		php artisan breeze:install blade && \
		php artisan migrate'
	@docker compose run bun sh -c 'bun install && bunx --bun vite build'
