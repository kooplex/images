#!/usr/bin/env bash
set -euo pipefail

# --- config ---
: "${NS:?Set NS to the Kubernetes namespace}"
: "${FQDN:?Set FQDN to the fully-qualified domain name}"
: "${SECNAME:?Set SECNAME to the secret name}"

RFC2136_INI="/etc/certbot_ini/rfc2136.ini"
LE_LIVE_DIR="/etc/letsencrypt/live/${FQDN}"
KEY="${LE_LIVE_DIR}/privkey.pem"
CERT="${LE_LIVE_DIR}/fullchain.pem"

log() { printf '[%s] %s\n' "$(date +'%F %T')" "$*" >&2; }

# --- sanity checks ---
command -v kubectl >/dev/null 2>&1 || { echo "kubectl not found"; exit 127; }
command -v certbot >/dev/null 2>&1 || { echo "certbot not found"; exit 127; }

if [[ ! -f "$RFC2136_INI" ]]; then
  echo "RFC2136 credentials file missing: $RFC2136_INI" >&2
  exit 1
fi

log "Using NS=$NS FQDN=$FQDN SECNAME=$SECNAME"

# Optional: ensure namespace exists
if ! kubectl get ns "$NS" >/dev/null 2>&1; then
  echo "Namespace '$NS' not found." >&2
  exit 1
fi

# --- obtain/renew certificate ---
log "Requesting certificate via RFC2136 for ${FQDN}"
certbot certonly \
  --non-interactive \
  --agree-tos \
  -m kooplex@elte.hu \
  --dns-rfc2136 \
  --dns-rfc2136-credentials "$RFC2136_INI" \
  --dns-rfc2136-propagation-seconds 60 \
  -d "$FQDN"

# --- verify files ---
if [[ ! -f "$KEY" || ! -f "$CERT" ]]; then
  echo "Certificate files not found at: $KEY or $CERT" >&2
  exit 1
fi
log "Certificate files found."

# --- create/update k8s secret idempotently ---
log "Applying TLS secret ${SECNAME} in namespace ${NS}"
kubectl create secret tls "$SECNAME" \
  --namespace "$NS" \
  --key "$KEY" \
  --cert "$CERT" \
  --dry-run=client -o yaml \
| kubectl apply -f -

log "Done."

