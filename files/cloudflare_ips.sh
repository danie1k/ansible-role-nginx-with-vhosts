#!/usr/bin/env bash
set -e

ips_v4=$(wget -qO- https://www.cloudflare.com/ips-v4 | sed -e 's/^/set_real_ip_from /' | sed -e 's/$/;/')
ips_v6=$(wget -qO- https://www.cloudflare.com/ips-v6 | sed -e 's/^/set_real_ip_from /' | sed -e 's/$/;/')

echo "${ips_v4}"
echo "${ips_v6}"
echo
echo "real_ip_header CF-Connecting-IP;"
