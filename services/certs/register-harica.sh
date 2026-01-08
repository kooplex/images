#!/usr/bin/env bash
set -euo pipefail

# --- config ---
: "${KEY_ID:?Set key id}"
: "${HMAC_KEY:?Set HMAC key}"

URL="https://acme-v02.harica.gr/acme/962d61f0-7815-46cc-9c42-8e8aa25443d1/directory"
ROOT="/etc/harica"

for d in config work logs ; do
  mkdir -p ${ROOT}/$d
done

# --- sanity checks ---
command -v certbot >/dev/null 2>&1 || { echo "certbot not found"; exit 127; }

certbot register \
--server "${URL}" \
--eab-kid "${KEY_ID}" \
--eab-hmac-key "${HMAC_KEY}" \
-m your@mail.here --agree-tos -n \
--config-dir ${ROOT}/config \
--work-dir   ${ROOT}/work \
--logs-dir   ${ROOT}/logs

