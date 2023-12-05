
Download a CWL document

`wget https://github.com/eoap/mastering-app-package/releases/download/1.0.0/app-water-bodies-cloud-native.1.0.0.cwl`{{execute}}

Create a configMap with the CWL document:

`kubectl -n calrissian-demo-project create configmap cwl-workflow --from-file=app-water-bodies-cloud-native.1.0.0.cwl`{{execute}}

Create a configMap with the workflow parameters:


```cat <<EOF | kubectl -n calrissian-demo-project apply -f -
apiVersion: v1
kind: ConfigMap
metadata:
  name: game-config
data:
  inputs:
    stac_items:
    - "https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2A_10TFK_20210708_0_L2A"
    - "https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2B_10TFK_20210713_0_L2A"
    aoi: "-121.399,39.834,-120.74,40.472"
    epsg: "EPSG:4326"
EOF```{{execute}}
