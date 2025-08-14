# this line is used to generate an SSL certificate. 
# since it is self-signed, it will trigger some security concens.

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out $CERT_LOCATION -subj "/C=PT/L=LS/O=42/CN=lmiguel.42.fr"


echo "
server {

    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_certificate /etc/ssl/private/nginx.crt;
    ssl_certificate_key /etc/ssl/private/nginx.key;" > /etc/nginx/sites-enabled/default

echo '

    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location ~ [^/]\\.php(/|$) {
        
        try_files $uri =404;
        return 200 "Hello from NGINX! Running TLSv1.3 \n";
        add_header Content-Type text/plain;
    }
} ' >> /etc/nginx/sites-enabled/default


nginx -g "daemon off;"