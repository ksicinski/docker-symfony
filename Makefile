up:
	docker compose up -d
	mutagen project start

down:
	mutagen project terminate
	docker compose down

build:
	cd .docker/nginx/ssl
	openssl req -newkey rsa:2048 -nodes -keyout .docker/nginx/ssl/default-key.pem -x509 -days 365 -out .docker/nginx/ssl/default-certificate.pem
	cd ../../../
	docker compose up -d --build
	mutagen project start

rebuild:
	mutagen project terminate
	docker compose down -v
	rm .docker/nginx/ssl/default-key.pem
	rm .docker/nginx/ssl/default-certificate.pem
	make build
