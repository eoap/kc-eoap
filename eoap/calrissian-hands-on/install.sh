echo "1. Install dependencies for RWX storage class"

apt update
apt install -y nfs-common

echo "2. Install OpenEBS"
helm repo add openebs-nfs https://openebs.github.io/dynamic-nfs-provisioner
helm repo update
helm upgrade --install openebs-nfs  openebs-nfs/nfs-provisioner --namespace openebs --create-namespace --set ndm.enabled=false --set ndmOperator.enabled=false --set localprovisioner.enabled=false --set nfs-provisioner.enabled=true  --set-string nfsStorageClass.backendStorageClass=local-path --set nfsStorageClass.name=openebs

echo "3. Create RWX storage class"

cat <<EOF | kubectl apply -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: local-path-pvc
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 100Mi
  storageClassName: openebs
EOF


