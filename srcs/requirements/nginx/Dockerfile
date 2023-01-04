
FROM debian:buster

RUN apt update && apt install -y nginx openssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/private-key.pem -out /etc/ssl/certs/certificate.pem -days 365 -subj '/CN=FR/O=42/C=FR'
# RUN mkdir -p /var/www/html/wordpress && chmod 777 /var/www/html/wordpress

EXPOSE 443

# COPY ./conf/nginx.conf /etc/nginx/conf.d/ 
COPY ./conf/default /etc/nginx/sites-enabled/
#COPY ./conf/default /etc/nginx/sites-available/

ENTRYPOINT ["nginx", "-g", "daemon off;"]



