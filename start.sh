#!/bin/bash

set -x

apt install osmctools docker.io

cd /opt

# --- Africa ---
wget -c https://download.geofabrik.de/africa/algeria-latest.osm.pbf
osmconvert algeria-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/algeria.osm
rm /algeria-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/angola-latest.osm.pbf
osmconvert angola-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/angola.osm
rm /angola-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/benin-latest.osm.pbf
osmconvert angola-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/benin.osm
rm /benin-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/botswana-latest.osm.pbf
osmconvert botswana-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/botswana.osm
rm /botswana-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/burkina-faso-latest.osm.pbf
osmconvert burkina-faso-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/burkina-faso.osm
rm /burkina-faso-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/burundi-latest.osm.pbf
osmconvert burundi-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/burundi.osm
rm /burundi-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/cameroon-latest.osm.pbf
osmconvert cameroon-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/cameroon.osm
rm /cameroon-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/canary-islands-latest.osm.pbf
osmconvert canary-islands-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/canary-islands.osm
rm /canary-islands-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/cape-verde-latest.osm.pbf
osmconvert cape-verde-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/cape-verde.osm
rm /cape-verde-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/central-african-republic-latest.osm.pbf
osmconvert central-african-republic-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/central-african-republic.osm
rm /central-african-republic-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/chad-latest.osm.pbf
osmconvert chad-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/chad.osm
rm /chad.osm-latest.pbf






#Antartica
wget -c http://download.geofabrik.de/antarctica-latest.osm.pbf
osmconvert antarctica-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/antarctica.osm
rm /antarctica-latest.osm.pbf




#Asia






#Oceania
wget -c http://download.geofabrik.de/australia-oceania-latest.osm.pbf
osmconvert australia-oceania-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/oceania.osm
rm /australia-oceania-latest.osm.pbf

#Europe


#North America


#Central America
wget -c http://download.geofabrik.de/central-america-latest.osm.pbf
osmconvert central-america-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/c_america.osm
rm /central-america-latest.osm.pbf

#South America


docker volume create openstreetmap-datapgr
docker run --name pgrouting -e AUTOVACUUM=off -e PGPASSWORD=pgr -p 5433:5432 -v /opt:/osm -v openstreetmap-datapgr:/var/lib/postgresql/13/main smartappli/openstreetmap-pgrouting-server import
#docker run --name pgrouting -e AUTOVACUUM=on -e PGPASSWORD=pgr -p 5433:5432 -v openstreetmap-datapgr:/var/lib/postgresql/13/main -d smartappli/openstreetmap-pgrouting-server run
