## Sentinel-2 data stage-in

Data stage-in is the process to retrieve the inputs and make these available for the processing. Processing inputs are provided as catalogue references and the Platform is responsible for translating those references into inputs available as files for the local processing.

The output of the data stage-in is a local STAC Catalog  with a STAC Item whose Assets have an accessible href (either local or remote e.g. COG) as the input files manifest for the application.

Learn more about the Data Flow Management [here](https://docs.ogc.org/bp/20-089r1.html#toc38).

This repository provides a simple Python script to stage a Sentinel-2 product from the Sentinel-2 Cloud-Optimized GeoTIFFs collection described here: [https://registry.opendata.aws/sentinel-2-l2a-cogs/](https://registry.opendata.aws/sentinel-2-l2a-cogs/).

Run the steps below to stage the Sentinel-2 product:

Create a folder for the staged product:

`mkdir -p reference-data`{{execute}}

`cd reference-data`{{execute}}

Execute the stage-in Python script:

`python ../stage.py https://earth-search.aws.element84.com/v0/collections/sentinel-s2-l2a-cogs/items/S2B_53HPA_20210723_0_L2A`{{execute}}

Go back to the previous working directory:

`cd ..`{{execute}}

Check the content of the staged data directory:

`tree reference-data`{{execute}}

The output is:

```bash
$ tree reference-data/
reference-data/
├── catalog.json
└── S2B_53HPA_20210723_0_L2A
    ├── AOT.tif
    ├── B01.tif
    ├── B02.tif
    ├── B03.tif
    ├── B04.tif
    ├── B05.tif
    ├── B06.tif
    ├── B07.tif
    ├── B08.tif
    ├── B09.tif
    ├── B11.tif
    ├── B12.tif
    ├── B8A.tif
    ├── L2A_PVI.tif
    ├── metadata.xml
    ├── S2B_53HPA_20210723_0_L2A.json
    ├── SCL.tif
    ├── TCI.tif
    ├── tileInfo.json
    └── WVP.tif

1 directory, 21 files
```{{}}