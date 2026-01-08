#!/usr/bin/env bash
set -euo pipefail

# --- config ---
: "${NS:?Set NS to the Kubernetes namespace}"
: "${FQDN:?Set FQDN to the fully-qualified domain name}"
: "${SECNAME:?Set SECNAME to the secret name}"

ROOT="/etc/harica"
URL="https://acme-v02.harica.gr/acme/962d61f0-7815-46cc-9c42-8e8aa25443d1/directory"
LE_LIVE_DIR="${ROOT}/config/live/${FQDN}"
KEY="${LE_LIVE_DIR}/privkey.pem"
CERT="${LE_LIVE_DIR}/fullchain.pem"

log() { printf '[%s] %s\n' "$(date +'%F %T')" "$*" >&2; }

# --- sanity checks ---
command -v kubectl >/dev/null 2>&1 || { echo "kubectl not found"; exit 127; }
command -v certbot >/dev/null 2>&1 || { echo "certbot not found"; exit 127; }

log "Using NS=$NS FQDN=$FQDN SECNAME=$SECNAME"

# Optional: ensure namespace exists
if ! kubectl get ns "$NS" >/dev/null 2>&1; then
  echo "Namespace '$NS' not found." >&2
  exit 1
fi

# --- obtain/renew certificate ---
log "Requesting certificate via RFC2136 for ${FQDN}"
certbot certonly \
  --server ${URL} \
  --standalone \
  -d "${FQDN}" \
  --key-type rsa --rsa-key-size 2048 \
  --config-dir ${ROOT}/config \
  --work-dir   ${ROOT}/work \
  --logs-dir   ${ROOT}/logs \
  --non-interactive \
  --agree-tos \
  -m kooplex@elte.hu

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

