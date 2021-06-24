#!/bin/bash

set -x

apt install osmctools docker.io

cd /opt

#Africa
wget -c http://download.geofabrik.de/africa-latest.osm.pbf
osmconvert africa-latest.osm.pbf --drop-author --drop-version --out-osm -o=africa.osm
rm /africa-latest.osm.pbf

#Antartica
wget -c http://download.geofabrik.de/antarctica-latest.osm.pbf
osmconvert antarctica-latest.osm.pbf --drop-author --drop-version --out-osm -o=antarctica.osm
rm /antarctica-latest.osm.pbf

#Asia
wget -c http://download.geofabrik.de/asia-latest.osm.pbf
osmconvert asia-latest.osm.pbf --drop-author --drop-version --out-osm -o=asia.osm
rm /asia-latest.osm.pbf

#Oceenia
wget -c http://download.geofabrik.de/australia-oceania-latest.osm.pbf
osmconvert australia-oceania-latest.osm.pbf --drop-author --drop-version --out-osm -o=oceania.osm
rm /australia-oceania-latest.osm.pbf

#Europe
wget -c http://download.geofabrik.de/europe-latest.osm.pbf
osmconvert europe-latest.osm.pbf --drop-author --drop-version --out-osm -o=europe.osm
rm /europe-latest.osm.pbf

#North America
wget -c http://download.geofabrik.de/north-america-latest.osm.pbf
osmconvert north-america-latest.osm.pbf --drop-author --drop-version --out-osm -o=n_america.osm
rm /north-america-latest.osm.pbf

#Central America
wget -c http://download.geofabrik.de/central-america-latest.osm.pbf
osmconvert central-america-latest.osm.pbf --drop-author --drop-version --out-osm -o=c_america.osm
rm /central-america-latest.osm.pbf

#South America
wget -c http://download.geofabrik.de/south-america-latest.osm.pbf
osmconvert south-america-latest.osm.pbf --drop-author --drop-version --out-osm -o=s_america.osm
rm /south-america-latest.osm.pbf

docker volume create openstreetmap-datapgr
docker run --name pgrouting -e AUTOVACUUM=off -e PGPASSWORD=pgr -p 5433:5432 -v /opt/africa.osm:/africa.osm -v /opt/antarctica.osm:/antarctica.osm -v /opt/asia.osm:/asia.osm -v /opt/oceania.osm:/oceania.osm -v /opt/europe.osm:/europe.osm -v /opt/n_america.osm:/n_america.osm -v /opt/c_america.osm:/c_america.osm -v /opt/s_america.osm:/s_america.osm-v openstreetmap-datapgr:/var/lib/postgresql/13/main smartappli/openstreetmap-pgrouting-server import
docker run --name pgrouting -e AUTOVACUUM=on -e PGPASSWORD=pgr -p 5433:5432 -v openstreetmap-datapgr:/var/lib/postgresql/13/main -d smartappli/openstreetmap-pgrouting-server run
