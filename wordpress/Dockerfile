FROM wordpress:6.4.3-php8.2-apache
RUN apt-get update && apt-get install -y --no-install-recommends\
  certbot \
  python3-certbot-apache \
  && rm -rf /var/lib/apt/lists/*
