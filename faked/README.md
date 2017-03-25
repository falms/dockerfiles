# faked

Fake daemon for nginx-proxy

Available on [Docker Hub](https://hub.docker.com/r/falms/faked/).

## Usage

    docker run -d -p 80:80 -v /path/to/vhost.d:/etc/nginx/vhost.d:ro -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy
    echo "location /app/ { proxy_pass http://192.0.2.1; }" > /path/to/vhost.d/app.example.com
    docker run -d -e VIRTUAL_HOST="app.example.com" falms/faked
