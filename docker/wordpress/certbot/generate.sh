#!/usr/bin/env bash
set -Eeuo pipefail

# Generate a Let's Encrypt certificate for the WordPress site.
# Usage: generate.sh
# requires: CERTBOT_EMAIL, CERTBOT_DOMAIN

echo "Running certbot..."
certbot --apache --non-interactive --redirect --keep-until-expiring --no-eff-email --agree-tos --email ${CERTBOT_EMAIL} --domain ${CERTBOT_DOMAIN}
echo "Running certbot is finished."

echo "kill the apache2 process..."
kill -9 $(ps aux | grep 'apache2' | awk '{print $2}')
echo "apache2 process is killed."