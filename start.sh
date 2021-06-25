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
osmconvert botswana-latest.osm.pbf --drop-author --drop-version --out-osm -o=botswana.osm
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
osmconvert equatorial-guinea-latest.osm.pbf --drop-author --drop-version --out-osm -o=equatorial-guinea.osm
rm equatorial-guinea-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/eritrea-latest.osm.pbf
osmconvert eritrea-latest.osm.pbf --drop-author --drop-version --out-osm -o=eritrea.osm
rm eritrea-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/ethiopia-latest.osm.pbf
osmconvert ethiopia-latest.osm.pbf --drop-author --drop-version --out-osm -o=ethiopia.osm
rm ethiopia-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/gabon-latest.osm.pbf
osmconvert gabon-latest.osm.pbf --drop-author --drop-version --out-osm -o=gabon.osm
rm gabon-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/ghana-latest.osm.pbf
osmconvert ghana-latest.osm.pbf --drop-author --drop-version --out-osm -o=ghana.osm
rm ghana-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/guinea-latest.osm.pbf
osmconvert guinea-latest.osm.pbf --drop-author --drop-version --out-osm -o=guinea.osm
rm guinea-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/guinea-bissau-latest.osm.pbf
osmconvert guinea-bissau-latest.osm.pbf --drop-author --drop-version --out-osm -o=guinea-bissau.osm
rm guinea-bissau-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/ivory-coast-latest.osm.pbf
osmconvert ivory-coast-latest.osm.pbf --drop-author --drop-version --out-osm -o=ivory-coast.osm
rm ivory-coast-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/kenya-latest.osm.pbf
osmconvert kenya-latest.osm.pbf --drop-author --drop-version --out-osm -o=kenya.osm
rm kenya-latest.osm.pbf

wget -c https://download.geofabrik.de/africa/lesotho-latest.osm.pbf
osmconvert lesotho-latest.osm.pbf --drop-author --drop-version --out-osm -o=lesotho.osm
rm lesotho-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/liberia-latest.osm.pbf
osmconvert liberia-latest.osm.pbf --drop-author --drop-version --out-osm -o=liberia.osm
rm liberia-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/libya-latest.osm.pbf
osmconvert libya-latest.osm.pbf --drop-author --drop-version --out-osm -o=libya.osm
rm libya-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/madagascar-latest.osm.pbf
osmconvert madagascar-latest.osm.pbf --drop-author --drop-version --out-osm -o=madagascar.osm
rm madagascar-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/malawi-latest.osm.pbf
osmconvert malawi-latest.osm.pbf --drop-author --drop-version --out-osm -o=malawi.osm
rm malawi-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/mali-latest.osm.pbf
osmconvert mali-latest.osm.pbf --drop-author --drop-version --out-osm -o=mali.osm
rm mali-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/mauritania-latest.osm.pbf
osmconvert mauritania-latest.osm.pbf --drop-author --drop-version --out-osm -o=mauritania.osm
rm mauritania-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/mauritius-latest.osm.pbf
osmconvert mauritius-latest.osm.pbf --drop-author --drop-version --out-osm -o=mauritius.osm
rm mauritius-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/morocco.html
osmconvert morocco-latest.osm.pbf --drop-author --drop-version --out-osm -o=morocco.osm
rm morocco-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/mozambique.html
osmconvert mozambique-latest.osm.pbf --drop-author --drop-version --out-osm -o=mozambique.osm
rm mozambique-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/namibia-latest.osm.pbf
osmconvert namibia-latest.osm.pbf --drop-author --drop-version --out-osm -o=namibia.osm
rm namibia-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/niger-latest.osm.pbf
osmconvert namibia-latest.osm.pbf --drop-author --drop-version --out-osm -o=niger.osm
rm niger-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/nigeria-latest.osm.pbf
osmconvert nigeria-latest.osm.pbf --drop-author --drop-version --out-osm -o=nigeria.osm
rm nigeria-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/saint-helena-ascension-and-tristan-da-cunha-latest.osm.pbf
osmconvert saint-helena-ascension-and-tristan-da-cunha-latest.osm.pbf --drop-author --drop-version --out-osm -o=saint-helena-ascension-and-tristan-da-cunha.osm
rm saint-helena-ascension-and-tristan-da-cunha-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/sao-tome-and-principe-latest.osm.pbf
osmconvert sao-tome-and-principe-latest.osm.pbf --drop-author --drop-version --out-osm -o=sao-tome-and-principe.osm
rm sao-tome-and-principe-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/senegal-and-gambia-latest.osm.pbf
osmconvert senegal-and-gambia-latest.osm.pbf --drop-author --drop-version --out-osm -o=senegal-and-gambia.osm
rm senegal-and-gambia-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/seychelles-latest.osm.pbf
osmconvert seychelles-latest.osm.pbf --drop-author --drop-version --out-osm -o=seychelles.osm
rm seychelles-latest.osm.pbf

wget -c http://download.geofabrik.de/africa/sierra-leone-latest.osm.pbf
osmconvert sierra-leone-latest.osm.pbf --drop-author --drop-version --out-osm -o=sierra-leone.osm
rm sierra-leone.osm.pbf

wget -c http://download.geofabrik.de/africa/somalia-latest.osm.pbf
osmconvert somalia-latest.osm.pbf --drop-author --drop-version --out-osm -o=somalia.osm
rm somalia.osm.pbf

wget -c http://download.geofabrik.de/africa/south-africa-latest.osm.pbf
osmconvert south-africa-latest.osm.pbf --drop-author --drop-version --out-osm -o=south-africa.osm
rm south-africa.osm.pbf

wget -c http://download.geofabrik.de/africa/south-sudan-latest.osm.pbf
osmconvert south-sudan-latest.osm.pbf --drop-author --drop-version --out-osm -o=south-sudan.osm
rm south-sudan.osm.pbf

wget -c http://download.geofabrik.de/africa/sudan-latest.osm.pbf
osmconvert sudan-latest.osm.pbf --drop-author --drop-version --out-osm -o=sudan.osm
rm sudan.osm.pbf

wget -c http://download.geofabrik.de/africa/swaziland-latest.osm.pbf
osmconvert swaziland-latest.osm.pbf --drop-author --drop-version --out-osm -o=swaziland.osm
rm swaziland.osm.pbf

wget -c http://download.geofabrik.de/africa/tanzania-latest.osm.pbf
osmconvert tanzania-latest.osm.pbf --drop-author --drop-version --out-osm -o=tanzania.osm
rm tanzania.osm.pbf

wget -c http://download.geofabrik.de/africa/togo-latest.osm.pbf
osmconvert togo-latest.osm.pbf --drop-author --drop-version --out-osm -o=togo.osm
rm togo.osm.pbf

wget -c http://download.geofabrik.de/africa/tunisia-latest.osm.pbf
osmconvert tunisia-latest.osm.pbf --drop-author --drop-version --out-osm -o=tunisia.osm
rm tunisia.osm.pbf

wget -c http://download.geofabrik.de/africa/uganda-latest.osm.pbf
osmconvert uganda-latest.osm.pbf --drop-author --drop-version --out-osm -o=uganda.osm
rm uganda.osm.pbf

wget -c http://download.geofabrik.de/africa/zambia-latest.osm.pbf
osmconvert zambia-latest.osm.pbf --drop-author --drop-version --out-osm -o=zambia.osm
rm zambia.osm.pbf

wget -c http://download.geofabrik.de/africa/zimbabwe-latest.osm.pbf
osmconvert zimbabwe-latest.osm.pbf --drop-author --drop-version --out-osm -o=zimbabwe.osm
rm zimbabwe.osm.pbf

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
