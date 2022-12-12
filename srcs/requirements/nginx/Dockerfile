FROM debian:buster


RUN apt update && apt install -y nginx openssl
RUN openssl req -x509 -nodes -newkey rsa:2048 -keyout /etc/ssl/private/private-key.pem -out /etc/ssl/certs/certificate.pem -days 365 -subj '/CN=FR/O=42/C=FR'

CMD ["nginx", "-g", "daemon off;"]



COPY default /etc/nginx/conf.d/
COPY default /etc/nginx/sites-enabled/


