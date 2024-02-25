FROM wordpress:6.4.3-php8.2-apache
RUN apt-get update && apt-get install -y --no-install-recommends\
  certbot \
  python3-certbot-apache \
  cron \
  && rm -rf /var/lib/apt/lists/*

# Download and move and make it executable the wordpress cli to the container
RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp
RUN chmod +x /usr/local/bin/wp

# COPY the sh file to the container
COPY ./certbot/generate.sh /usr/local/bin/
COPY ./certbot/renew.sh /usr/local/bin/

# Make the sh file executable
RUN chmod +x /usr/local/bin/generate.sh
RUN chmod +x /usr/local/bin/renew.sh


# add renew cron job
# RUN echo "0 0 * * * /usr/local/bin/renew.sh" > /etc/cron.d/renew-cron
RUN echo "0 6 * * * /usr/local/bin/renew.sh" | crontab -

# Remove exec "$@" line of docker-entrypoint.sh
RUN sed -i '$ d' /usr/local/bin/docker-entrypoint.sh

# Append generate script to docker-entrypoint.sh
RUN echo "/usr/local/bin/generate.sh" >> /usr/local/bin/docker-entrypoint.sh

# add exec "$@" line to docker-entrypoint.sh
RUN echo "exec \"\$@\"" >> /usr/local/bin/docker-entrypoint.sh


