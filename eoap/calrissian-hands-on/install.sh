echo "1. Install dependencies for RWX storage class"

apt update > /dev/null 2>&1
apt install -y nfs-common  > /dev/null 2>&1

echo "2. Install nfs-common on node01"
ssh 172.30.2.2 "apt update; apt-get install -y nfs-common" # > /dev/null 2>&1

echo "3. Install OpenEBS"
helm repo add openebs-nfs https://openebs.github.io/dynamic-nfs-provisioner  > /dev/null 2>&1
helm repo update  > /dev/null 2>&1
helm upgrade \
    --install openebs-nfs  openebs-nfs/nfs-provisioner \
    --namespace default \
    --create-namespace \
    --set ndm.enabled=false \
    --set ndmOperator.enabled=false \
    --set localprovisioner.enabled=false \
    --set nfs-provisioner.enabled=true \
    --set-string nfsStorageClass.backendStorageClass=local-path \
    --set nfsStorageClass.name=openebs  > /dev/null 2>&1

echo "4. Veryfying RWX storage class"

kubectl wait --for=condition=ready pod -l app=nfs-provisioner --timeout=5m  # > /dev/null 2>&1  

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

kubectl wait --for=jsonpath='{.status.phase}'=Bound pvc -l nfs.openebs.io/nfs-pvc-name=local-path-pvc --timeout=5m 

