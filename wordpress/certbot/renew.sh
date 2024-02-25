#!/usr/bin/env bash
set -Eeuo pipefail

# Renew the Let's Encrypt certificate for the WordPress site.
certbot renew --quiet
