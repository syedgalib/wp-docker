## Configuration
- PHP: 7.4
- MySQL: 8.0
- PhpMyAdmin: latest
- Node: latest
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

### Start the docker
```sh
make up
```

### Create the wp-config file
```sh
make wp-config
```

### Access the Node container shell
```sh
make node-shell
```

### Access the applications
- Web: http://localhost:80
- PHP My Admin: http://localhost:8080
- Mail: http://localhost:8025