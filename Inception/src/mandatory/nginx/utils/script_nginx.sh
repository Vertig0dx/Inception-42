# this line is used to generate an SSL certificate. 
# since it is self-signed, it will trigger some security concens.

openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx.key -out $CERT_LOCATION -subj "/C=PT/L=LS/O=42/CN=lmiguel.42.fr"


cat > /etc/nginx/sites-enabled/default <<EOF
server {
    listen 443 ssl http2;
    listen [::]:443 ssl http2;

    server_name www.$DOMAIN_NAME $DOMAIN_NAME;

    ssl_certificate /etc/ssl/private/nginx.crt;
    ssl_certificate_key /etc/ssl/private/nginx.key;

    ssl_protocols TLSv1.3;

    index index.php index.html index.htm;
    root /var/www/html;

    location / {
        try_files \$uri \$uri/ /index.php?\$args;
    }

    location ~ [^/]\.php(/|\$) {
        include snippets/fastcgi-php.conf;
        fastcgi_pass wordpress:9000;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }
}
EOF

nginx -g "daemon off;"