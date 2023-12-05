echo "1. Install dependencies for RWX storage class"

apt update > /dev/null 2>&1
apt install -y nfs-common  > /dev/null 2>&1

echo "2. Install nfs-common on node01"
ssh 172.30.2.2 "apt update; apt-get install -y nfs-common" > /dev/null 2>&1

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

echo "4. Create RWX storage class"

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


stac_items:
- "https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2A_10TFK_20210708_0_L2A"
- "https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2B_10TFK_20210713_0_L2A"
aoi: "-121.399,39.834,-120.74,40.472"
epsg: "EPSG:4326"


