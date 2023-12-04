#!/bin/bash

pip install cwltool

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/D.1.%20Crop%20Application%20Example/app-package.cwl -O d1-app-package.cwl

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/D.1.%20Crop%20Application%20Example/params.yml -O d1-params.yml

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/stage.py -O stage.py

pip install stac-asset pystac

touch /tmp/finished