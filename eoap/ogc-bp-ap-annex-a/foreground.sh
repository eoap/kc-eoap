#!/bin/bash

echo "Installing dependencies..."
while [ ! -f /tmp/finished ]; do sleep 1; done

echo "Done"

pip install stac-asset pystac
