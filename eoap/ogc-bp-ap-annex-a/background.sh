#!/bin/bash

pip install cwltool

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/D.1.%20Crop%20Application%20Example/app-package.cwl -O d1-app-package.cwl

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/D.2.%20Scatter%20Crop%20Application%20Example/app-package-scatter.cwl -O d2-app-package-scatter.cwl

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/D.3.%20Composite%20two-step%20Workflow%20Example/app-package-two-steps-rgb.cwl -O d3-app-package-two-steps-rgb.cwl

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/D.4.%20Multiple%20Inputs%20Composite%20Two-step%20Workflow%20Example/app-package-multiple-products.cwl -O d4-app-package-multiple-products.cwl

wget https://raw.githubusercontent.com/eoap/ogc-bp-ap-annex-a-examples/main/stage.py -O stage.py

# pip install stac-asset pystac

apt-get install -y tree

touch /tmp/finished