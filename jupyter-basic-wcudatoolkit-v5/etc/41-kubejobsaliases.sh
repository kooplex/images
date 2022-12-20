#cat << EOF >> /etc/profile.d/
export PATH=${PATH}:/etc/jobtools/

alias kj-delete="kubectl delete job "
alias kj-status="kubectl get job "
alias kj-cluster-info="kubectl top nodes |grep -v controlplane"
alias kj-pod-info="kubectl top pods"
alias kj-submit="/etc/jobtools/kj-submit"

function kj-pod-status() {
          kubectl get pod  $(kubectl get pods |grep "^$1"|awk '{if(NR>1) exit; else print $1}') -o wide
}
export -f kj-pod-status

function kj-pod-describe() {
          kubectl describe pod  $(kubectl get pods |grep "^$1"|awk '{if(NR>1) exit; else print $1}')
}
export -f kj-pod-describe

function kj-pod-log() {
          kubectl logs -f  $(kubectl get pods |grep "^$1"|awk '{if(NR>1) exit; else print $1}')
}
export -f kj-pod-log

