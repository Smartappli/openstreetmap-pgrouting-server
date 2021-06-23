#!/bin/bash

set -x

apt install osmctools docker.io

cd /opt
wget -c https://ftp5.gwdg.de/pub/misc/openstreetmap/planet.openstreetmap.org/pbf/planet-latest.osm.pbf
osmconvert planet-latest.osm.pbf --drop-author --drop-version --out-osm -o=output_data_reduc.osm
rm planet-latest.osm.pbf

docker volume create openstreetmap-datapgr
docker run --name pgrouting -e AUTOVACUUM=off -e -p 5433:5432 -v /opt/output_data_reduc.osm:/output_data_reduc.osm -v openstreetmap-datapgr:/var/lib/postgresql/13/main smartappli/openstreetmap-pgrouting-server import
