## Configuration
- PHP: 7.4
- MySQL: 8.0
- PhpMyAdmin: latest
- Node: 22.19.0
- Server: NGINX
- Mailpit: latest

## Get Started

### Create the .env file
```sh
make env
```

### Edit the .env file
```conf
SERVER_PORT=80
PHP_MY_ADMIN_PORT=8080
MAIL_WEB_PORT=8025
```

### Build the docker services
```sh
make build
```

### Start the docker services
```sh
make up
```

### Create the wp-config file
```sh
make wp-config
```

### Access the app container shell
```sh
make app-shell
```

### Access the applications
- Web: http://localhost:80
- PHP My Admin: http://localhost:8080
- Mail: http://localhost:8025