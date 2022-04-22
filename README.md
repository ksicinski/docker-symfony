# Install Docker

Below manual how to correct install and run docker for Symfony project.

## How to set up Docker

### Database

#### Set new credentials

Go to `docker-compose.yml` and for service `db` set new credentials for database connection:

- MYSQL_DATABASE: 'database_name'
- MYSQL_USER: 'database_user'
- MYSQL_PASSWORD: 'database_password'

### Nginx

#### Set custom domain name

**Step 1**

Go to `.docker/nginx/conf.d/defualt.conf` and set custom domain name in parameters `server_name sexample.localhost;`

**Step 2**

Set custom domain name in host in file `/etc/hosts`, set: `127.0.0.1    example.localhost`

## How to install docker

To make first installation docker need torun command:
`make build` or `docker compose up -d --build` (here you need generate SSL token manual)

## How configured xdebug in PHPStorm

- **idekey For Xdebug:** PHPSTORM
- **Port for Xdebug:** 9001

**Step 1**

Go to `Preferences -> PHP -> Debug` and inside section `xdebug` add port `9001`.

**Step 2**

Next create new server in `Preferences -> PHP -> Servers`:
- name: localhost
- host: localhost
- port: 80

Enable `Use path mapping` and set `/app` in column `Absolute path on the server` for project file.

## Useful commands

### Make
Short script to help in daily work on project
- Run project: `make up`
- Down project: `make down`
- Build project (+install SSL cert): `make build`
- Rebuild project (+install SSL cert) `make rebuild`

### Docker
- Run project: `docker compose up -d`
- Down project: `docker compose down`
- Down project and remove volumes: `docker down -v`
- Run project and build: `docker compose up -d --build`

### Mutagen
Tools to copy files from project to docker container.
- Start mutagen: `mutagen project start`
- Stop mutagen: `mutagen project terminate`
- Status of copy files: `mutagen project list`
