# /usr/local/bin/incluster-kubeconfig.sh
set -euo pipefail

SA_DIR=/var/run/secrets/kubernetes.io/serviceaccount
KUBECONFIG_PATH=/tmp/kubeconfig

cat > "$KUBECONFIG_PATH" <<EOF
apiVersion: v1
kind: Config
clusters:
- cluster:
    certificate-authority: ${SA_DIR}/ca.crt
    server: https://${KUBERNETES_SERVICE_HOST}:${KUBERNETES_SERVICE_PORT}
  name: in-cluster
contexts:
- context:
    cluster: in-cluster
    namespace: ${POD_NAMESPACE:-default}
    user: sa
  name: in-cluster
current-context: in-cluster
users:
- name: sa
  user:
    token: "$(cat ${SA_DIR}/token)"
EOF

export KUBECONFIG="$KUBECONFIG_PATH"
exec "$@"

