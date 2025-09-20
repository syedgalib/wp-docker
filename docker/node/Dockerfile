FROM node:alpine

# Install bash (optional, useful for debugging), curl, git
RUN apk add --no-cache bash curl git

# Install pnpm globally
RUN npm install -g pnpm

WORKDIR /var/www/html/wp-content
