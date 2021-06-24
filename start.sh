#!/bin/bash

set -x

apt install osmctools docker.io

cd /opt

# --- Africa ---
wget -c https://download.geofabrik.de/africa/algeria-latest.osm.pbf
osmconvert algeria-latest.osm.pbf --drop-author --drop-version --out-osm -o=algeria.osm
rm algeria-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/angola-latest.osm.pbf
osmconvert angola-latest.osm.pbf --drop-author --drop-version --out-osm -o=angola.osm
rm angola-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/benin-latest.osm.pbf
osmconvert benin-latest.osm.pbf --drop-author --drop-version --out-osm -o=benin.osm
rm benin-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/botswana-latest.osm.pbf
osmconvert botswana-latest.osm.pbf --drop-author --drop-version --out-osm -o=/osm/botswana.osm
rm botswana-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/burkina-faso-latest.osm.pbf
osmconvert burkina-faso-latest.osm.pbf --drop-author --drop-version --out-osm -o=burkina-faso.osm
rm burkina-faso-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/burundi-latest.osm.pbf
osmconvert burundi-latest.osm.pbf --drop-author --drop-version --out-osm -o=burundi.osm
rm burundi-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/cameroon-latest.osm.pbf
osmconvert cameroon-latest.osm.pbf --drop-author --drop-version --out-osm -o=cameroon.osm
rm cameroon-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/canary-islands-latest.osm.pbf
osmconvert canary-islands-latest.osm.pbf --drop-author --drop-version --out-osm -o=canary-islands.osm
rm /canary-islands-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/cape-verde-latest.osm.pbf
osmconvert cape-verde-latest.osm.pbf --drop-author --drop-version --out-osm -o=cape-verde.osm
rm cape-verde-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/central-african-republic-latest.osm.pbf
osmconvert central-african-republic-latest.osm.pbf --drop-author --drop-version --out-osm -o=central-african-republic.osm
rm central-african-republic-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/chad-latest.osm.pbf
osmconvert chad-latest.osm.pbf --drop-author --drop-version --out-osm -o=chad.osm
rm chad-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/comores-latest.osm.pbf
osmconvert comores-latest.osm.pbf --drop-author --drop-version --out-osm -o=comores.osm
rm comores-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/congo-brazzaville-latest.osm.pbf
osmconvert congo-brazzaville-latest.osm.pbf --drop-author --drop-version --out-osm -o=congo-brazzaville.osm
rm congo-brazzaville-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/congo-democratic-republic-latest.osm.pbf
osmconvert congo-democratic-republic-latest.osm.pbf --drop-author --drop-version --out-osm -o=congo-democratic-republic.osm
rm congo-democratic-republic-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/djibouti-latest.osm.pbf
osmconvert djibouti-latest.osm.pbf --drop-author --drop-version --out-osm -o=djibouti.osm
rm djibouti-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/egypt-latest.osm.pbf
osmconvert egypt-latest.osm.pbf --drop-author --drop-version --out-osm -o=egypt.osm
rm egypt-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/equatorial-guinea-latest.osm.pbf
osmconvert equatorial-guinea.osm.pbf --drop-author --drop-version --out-osm -o=equatorial-guinea.osm
rm equatorial-guinea.osm.pbf

#Antartica
wget -c http://download.geofabrik.de/antarctica-latest.osm.pbf
osmconvert antarctica-latest.osm.pbf --drop-author --drop-version --out-osm -o=antarctica.osm
rm antarctica-latest.osm.pbf




#Asia






#Oceania
wget -c http://download.geofabrik.de/australia-oceania-latest.osm.pbf
osmconvert australia-oceania-latest.osm.pbf --drop-author --drop-version --out-osm -o=oceania.osm
rm australia-oceania-latest.osm.pbf

#Europe


#North America


#Central America
wget -c http://download.geofabrik.de/central-america-latest.osm.pbf
osmconvert central-america-latest.osm.pbf --drop-author --drop-version --out-osm -o=c_america.osm
rm central-america-latest.osm.pbf

#South America


docker volume create openstreetmap-datapgr
docker run --name pgrouting -e AUTOVACUUM=off -e PGPASSWORD=pgr -p 5433:5432 -v /opt:/osm -v openstreetmap-datapgr:/var/lib/postgresql/13/main smartappli/openstreetmap-pgrouting-server import
#docker run --name pgrouting -e AUTOVACUUM=on -e PGPASSWORD=pgr -p 5433:5432 -v openstreetmap-datapgr:/var/lib/postgresql/13/main -d smartappli/openstreetmap-pgrouting-server run
