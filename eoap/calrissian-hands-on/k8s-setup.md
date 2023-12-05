## Create a namespace 

You will use a dedicated namespace named `calrissian-demo-project`{{}}

```
NAMESPACE_NAME=calrissian-demo-project
kubectl create namespace "$NAMESPACE_NAME"
```{{execute}}

## Create the roles 

```
kubectl --namespace="$NAMESPACE_NAME" create role pod-manager-role \
  --verb=create,patch,delete,list,watch --resource=pods
```{{execute}}

```
kubectl --namespace="$NAMESPACE_NAME" create role log-reader-role \
  --verb=get,list --resource=pods/log
```{{execute}}

## Create the role bindings

```
kubectl --namespace="$NAMESPACE_NAME" create rolebinding pod-manager-default-binding \
  --role=pod-manager-role --serviceaccount=${NAMESPACE_NAME}:default
```{{execute}}

```
kubectl --namespace="$NAMESPACE_NAME" create rolebinding log-reader-default-binding \
  --role=log-reader-role --serviceaccount=${NAMESPACE_NAME}:default
```{{execute}}

## Create the volumes

```
cat <<EOF | kubectl apply -n calrissian-demo-project -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: calrissian-tmp
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
  storageClassName: openebs
EOF
```{{execute}}

```
cat <<EOF | kubectl apply -n calrissian-demo-project -f -
apiVersion: v1
kind: PersistentVolumeClaim
metadata:
  name: calrissian-out
spec:
  accessModes:
    - ReadWriteMany
  resources:
    requests:
      storage: 1Gi
  storageClassName: openebs
EOF
```{{execute}}