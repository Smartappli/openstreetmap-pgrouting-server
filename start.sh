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

wget -c http://download.geofabrik.de/asia/afghanistan-latest.osm.pbf
osmconvert afghanistan-latest.osm.pbf --drop-author --drop-version --out-osm -o=afghanistan.osm
rm afghanistan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/armenia-latest.osm.pbf
osmconvert armenia-latest.osm.pbf --drop-author --drop-version --out-osm -o=armenia.osm
rm armenia-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/azerbaijan-latest.osm.pbf
osmconvert azerbaijan-latest.osm.pbf --drop-author --drop-version --out-osm -o=azerbaijan.osm
rm azerbaijan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/bangladesh-latest.osm.pbf
osmconvert bangladesh-latest.osm.pbf --drop-author --drop-version --out-osm -o=bangladesh.osm
rm bangladesh-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/bhutan-latest.osm.pbf
osmconvert bhutan-latest.osm.pbf --drop-author --drop-version --out-osm -o=bhutan.osm
rm bhutan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/cambodia-latest.osm.pbf
osmconvert cambodia-latest.osm.pbf --drop-author --drop-version --out-osm -o=cambodia.osm
rm cambodia-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/china-latest.osm.pbf
osmconvert china-latest.osm.pbf --drop-author --drop-version --out-osm -o=china.osm
rm china-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/gcc-states-latest.osm.pbf
osmconvert gcc-states-latest.osm.pbf --drop-author --drop-version --out-osm -o=gcc-states.osm
rm gcc-states-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/india-latest.osm.pbf
osmconvert india-latest.osm.pbf --drop-author --drop-version --out-osm -o=india.osm
rm india-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/indonesia-latest.osm.pbf
osmconvert indonesia-latest.osm.pbf --drop-author --drop-version --out-osm -o=indonesia.osm
rm indonesia-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/iran-latest.osm.pbf
osmconvert iran-latest.osm.pbf --drop-author --drop-version --out-osm -o=iran.osm
rm iran-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/iraq-latest.osm.pbf
osmconvert iraq-latest.osm.pbf --drop-author --drop-version --out-osm -o=iraq.osm
rm iraq-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/israel-and-palestine-latest.osm.pbf
osmconvert israel-and-palestine-latest.osm.pbf --drop-author --drop-version --out-osm -o=israel-and-palestine.osm
rm israel-and-palestine-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/japan-latest.osm.pbf
osmconvert japan-latest.osm.pbf --drop-author --drop-version --out-osm -o=japan.osm
rm japan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/jordan-latest.osm.pbf
osmconvert jordan-latest.osm.pbf --drop-author --drop-version --out-osm -o=jordan.osm
rm jordan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/kazakhstan-latest.osm.pbf
osmconvert /kazakhstan-latest.osm.pbf --drop-author --drop-version --out-osm -o=/kazakhstan.osm
rm /kazakhstan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/kyrgyzstan-latest.osm.pbf
osmconvert kyrgyzstan-latest.osm.pbf --drop-author --drop-version --out-osm -o=kyrgyzstan.osm
rm kyrgyzstan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/laos-latest.osm.pbf
osmconvert laos-latest.osm.pbf --drop-author --drop-version --out-osm -o=laos.osm
rm laos-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/lebanon-latest.osm.pbf
osmconvert lebanon-latest.osm.pbf --drop-author --drop-version --out-osm -o=lebanon.osm
rm lebanon-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/malaysia-singapore-brunei-latest.osm.pbf
osmconvert malaysia-singapore-brunei-latest.osm.pbf --drop-author --drop-version --out-osm -o=malaysia-singapore-brunei.osm
rm malaysia-singapore-brunei-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/maldives-latest.osm.pbf
osmconvert maldives-latest.osm.pbf --drop-author --drop-version --out-osm -o=maldives.osm
rm maldives-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/mongolia-latest.osm.pbf
osmconvert mongolia-latest.osm.pbf --drop-author --drop-version --out-osm -o=mongolia.osm
rm mongolia-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/myanmar-latest.osm.pbf
osmconvert myanmar-latest.osm.pbf --drop-author --drop-version --out-osm -o=myanmar.osm
rm myanmar-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/nepal-latest.osm.pbf
osmconvert nepal-latest.osm.pbf --drop-author --drop-version --out-osm -o=nepal.osm
rm nepal-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/north-korea-latest.osm.pbf
osmconvert north-korea-latest.osm.pbf --drop-author --drop-version --out-osm -o=north-korea.osm
rm north-korea-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/pakistan-latest.osm.pbf
osmconvert pakistan-latest.osm.pbf --drop-author --drop-version --out-osm -o=pakistan.osm
rm pakistan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/philippines-latest.osm.pbf
osmconvert philippines-latest.osm.pbf --drop-author --drop-version --out-osm -o=philippines.osm
rm philippines-latest.osm.pbf

wget -c http://download.geofabrik.de/russia-latest.osm.pbf
osmconvert russia-latest.osm.pbf --drop-author --drop-version --out-osm -o=russia.osm
rm russia-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/south-korea-latest.osm.pbf
osmconvert south-korea-latest.osm.pbf --drop-author --drop-version --out-osm -o=south-korea.osm
rm south-korea-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/sri-lanka-latest.osm.pbf
osmconvert sri-lanka-latest.osm.pbf --drop-author --drop-version --out-osm -o=sri-lanka.osm
rm sri-lanka-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/syria-latest.osm.pbf
osmconvert syria-latest.osm.pbf --drop-author --drop-version --out-osm -o=syria.osm
rm syria-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/taiwan-latest.osm.pbf
osmconvert taiwan-latest.osm.pbf --drop-author --drop-version --out-osm -o=taiwan.osm
rm taiwan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/tajikistan-latest.osm.pbf
osmconvert tajikistan-latest.osm.pbf --drop-author --drop-version --out-osm -o=tajikistan.osm
rm tajikistan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/thailand-latest.osm.pbf
osmconvert thailand-latest.osm.pbf --drop-author --drop-version --out-osm -o=thailand.osm
rm thailand-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/turkmenistan-latest.osm.pbf
osmconvert turkmenistan-latest.osm.pbf --drop-author --drop-version --out-osm -o=turkmenistan.osm
rm turkmenistan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/uzbekistan-latest.osm.pbf
osmconvert uzbekistan-latest.osm.pbf --drop-author --drop-version --out-osm -o=uzbekistan.osm
rm uzbekistan-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/vietnam-latest.osm.pbf
osmconvert vietnam-latest.osm.pbf --drop-author --drop-version --out-osm -o=vietnam.osm
rm vietnam-latest.osm.pbf

wget -c http://download.geofabrik.de/asia/yemen-latest.osm.pbf
osmconvert yemen-latest.osm.pbf --drop-author --drop-version --out-osm -o=yemen.osm
rm yemen-latest.osm.pbf

#Oceania
wget -c http://download.geofabrik.de/australia-oceania-latest.osm.pbf
osmconvert australia-oceania-latest.osm.pbf --drop-author --drop-version --out-osm -o=oceania.osm
rm australia-oceania-latest.osm.pbf

#Europe

wget -c https://download.geofabrik.de/europe/albania-latest.osm.pbf
osmconvert albania-latest.osm.pbf --drop-author --drop-version --out-osm -o=albania.osm
rm albania-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/andorra-latest.osm.pbf
osmconvert andorra-latest.osm.pbf --drop-author --drop-version --out-osm -o=andorra.osm
rm andorra-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/austria-latest.osm.pbf
osmconvert austria-latest.osm.pbf --drop-author --drop-version --out-osm -o=austria.osm
rm austria-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/azores-latest.osm.pbf
osmconvert azores-latest.osm.pbf --drop-author --drop-version --out-osm -o=azores.osm
rm azores-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/belarus-latest.osm.pbf
osmconvert belarus-latest.osm.pbf --drop-author --drop-version --out-osm -o=belarus.osm
rm belarus-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/belgium-latest.osm.pbf
osmconvert belgium-latest.osm.pbf --drop-author --drop-version --out-osm -o=belgium.osm
rm belgium-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/bosnia-herzegovina-latest.osm.pbf
osmconvert bosnia-herzegovina-latest.osm.pbf --drop-author --drop-version --out-osm -o=bosnia-herzegovina.osm
rm bosnia-herzegovina-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/bulgaria-latest.osm.pbf
osmconvert bulgaria-latest.osm.pbf --drop-author --drop-version --out-osm -o=bulgaria.osm
rm bulgaria-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/croatia-latest.osm.pbf
osmconvert croatia-latest.osm.pbf --drop-author --drop-version --out-osm -o=croatia.osm
rm croatia-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/cyprus-latest.osm.pbf
osmconvert cyprus-latest.osm.pbf --drop-author --drop-version --out-osm -o=cyprus.osm
rm cyprus-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/czech-republic-latest.osm.pbf
osmconvert czech-republic-latest.osm.pbf --drop-author --drop-version --out-osm -o=czech-republic.osm
rm czech-republic-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/denmark-latest.osm.pbf
osmconvert denmark-latest.osm.pbf --drop-author --drop-version --out-osm -o=denmark.osm
rm denmark-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/estonia-latest.osm.pbf
osmconvert estonia-latest.osm.pbf --drop-author --drop-version --out-osm -o=estonia.osm
rm estonia-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/faroe-islands-latest.osm.pbf
osmconvert faroe-islands-latest.osm.pbf --drop-author --drop-version --out-osm -o=faroe-islands.osm
rm faroe-islands-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/finland-latest.osm.pbf
osmconvert finland-latest.osm.pbf --drop-author --drop-version --out-osm -o=finland.osm
rm finland-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/france-latest.osm.pbf
osmconvert france-latest.osm.pbf --drop-author --drop-version --out-osm -o=france.osm
rm france-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/georgia-latest.osm.pbf
osmconvert georgia-latest.osm.pbf --drop-author --drop-version --out-osm -o=georgia.osm
rm georgia-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/germany-latest.osm.pbf
osmconvert germany-latest.osm.pbf --drop-author --drop-version --out-osm -o=germany.osm
rm germany-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/great-britain-latest.osm.pbf
osmconvert great-britain-latest.osm.pbf --drop-author --drop-version --out-osm -o=great-britain.osm
rm great-britain-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/greece-latest.osm.pbf
osmconvert greece-latest.osm.pbf --drop-author --drop-version --out-osm -o=greece.osm
rm greece-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/guernsey-jersey-latest.osm.pbf
osmconvert guernsey-jersey-latest.osm.pbf --drop-author --drop-version --out-osm -o=guernsey-jersey.osm
rm guernsey-jersey-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/hungary-latest.osm.pbf
osmconvert hungary-latest.osm.pbf --drop-author --drop-version --out-osm -o=hungary.osm
rm hungary-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/iceland-latest.osm.pbf
osmconvert iceland-latest.osm.pbf --drop-author --drop-version --out-osm -o=iceland.osm
rm iceland-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/ireland-and-northern-ireland-latest.osm.pbf
osmconvert ireland-and-northern-ireland-latest.osm.pbf --drop-author --drop-version --out-osm -o=ireland-and-northern-ireland.osm
rm ireland-and-northern-ireland-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/isle-of-man-latest.osm.pbf
osmconvert isle-of-man-ireland-latest.osm.pbf --drop-author --drop-version --out-osm -o=isle-of-man.osm
rm isle-of-man-latest.osm.pbf

wget -c https://download.geofabrik.de/europe/italy-latest.osm.pbf
osmconvert italy-latest.osm.pbf --drop-author --drop-version --out-osm -o=italy.osm
rm italy.osm.pbf

wget -c https://download.geofabrik.de/europe/kosovo-latest.osm.pbf
osmconvert kosovo-latest.osm.pbf --drop-author --drop-version --out-osm -o=kosovo.osm
rm kosovo.osm.pbf

wget -c https://download.geofabrik.de/europe/latvia-latest.osm.pbf
osmconvert latvia-latest.osm.pbf --drop-author --drop-version --out-osm -o=latvia.osm
rm latvia.osm.pbf

wget -c https://download.geofabrik.de/europe/liechtenstein-latest.osm.pbf
osmconvert latvia-latest.osm.pbf --drop-author --drop-version --out-osm -o=latvia.osm
rm latvia.osm.pbf

wget -c https://download.geofabrik.de/europe/lithuania-latest.osm.pbf
osmconvert lithuania-latest.osm.pbf --drop-author --drop-version --out-osm -o=lithuania.osm
rm lithuania.osm.pbf

wget -c https://download.geofabrik.de/europe/luxembourg-latest.osm.pbf
osmconvert luxembourg-latest.osm.pbf --drop-author --drop-version --out-osm -o=luxembourg.osm
rm luxembourg.osm.pbf

wget -c https://download.geofabrik.de/europe/macedonia-latest.osm.pbf
osmconvert macedonia-latest.osm.pbf --drop-author --drop-version --out-osm -o=macedonia.osm
rm macedonia.osm.pbf

wget -c https://download.geofabrik.de/europe/malta-latest.osm.pbf
osmconvert malta-latest.osm.pbf --drop-author --drop-version --out-osm -o=malta.osm
rm malta.osm.pbf

wget -c https://download.geofabrik.de/europe/moldova-latest.osm.pbf
osmconvert moldova-latest.osm.pbf --drop-author --drop-version --out-osm -o=moldova.osm
rm moldova.osm.pbf

wget -c https://download.geofabrik.de/europe/monaco-latest.osm.pbf
osmconvert monaco-latest.osm.pbf --drop-author --drop-version --out-osm -o=monaco.osm
rm monaco.osm.pbf

wget -c https://download.geofabrik.de/europe/montenegro-latest.osm.pbf
osmconvert montenegro-latest.osm.pbf --drop-author --drop-version --out-osm -o=montenegro.osm
rm montenegro.osm.pbf

wget -c https://download.geofabrik.de/europe/netherlands-latest.osm.pbf
osmconvert netherlands-latest.osm.pbf --drop-author --drop-version --out-osm -o=netherlands.osm
rm netherlands.osm.pbf

wget -c https://download.geofabrik.de/europe/norway-latest.osm.pbf
osmconvert norway-latest.osm.pbf --drop-author --drop-version --out-osm -o=norway.osm
rm norway.osm.pbf

wget -c https://download.geofabrik.de/europe/poland-latest.osm.pbf
osmconvert poland-latest.osm.pbf --drop-author --drop-version --out-osm -o=poland.osm
rm poland.osm.pbf

wget -c https://download.geofabrik.de/europe/portugal-latest.osm.pbf
osmconvert portugal-latest.osm.pbf --drop-author --drop-version --out-osm -o=portugal.osm
rm portugal.osm.pbf

wget -c https://download.geofabrik.de/europe/romania-latest.osm.pbf
osmconvert romania-latest.osm.pbf --drop-author --drop-version --out-osm -o=romania.osm
rm romania.osm.pbf

wget -c https://download.geofabrik.de/russia-latest.osm.pbf
osmconvert russia-latest.osm.pbf --drop-author --drop-version --out-osm -o=russia.osm
rm russia.osm.pbf

wget -c https://download.geofabrik.de/europe/serbia-latest.osm.pbf
osmconvert serbia-latest.osm.pbf --drop-author --drop-version --out-osm -o=serbia.osm
rm serbia.osm.pbf

wget -c https://download.geofabrik.de/europe/slovakia-latest.osm.pbf
osmconvert slovakia-latest.osm.pbf --drop-author --drop-version --out-osm -o=slovakia.osm
rm slovakia.osm.pbf

wget -c https://download.geofabrik.de/europe/spain-latest.osm.pbf
osmconvert spain-latest.osm.pbf --drop-author --drop-version --out-osm -o=spain.osm
rm spain.osm.pbf

wget -c https://download.geofabrik.de/europe/sweden-latest.osm.pbf
osmconvert sweden-latest.osm.pbf --drop-author --drop-version --out-osm -o=sweden.osm
rm sweden.osm.pbf

wget -c https://download.geofabrik.de/europe/switzerland-latest.osm.pbf
osmconvert switzerland-latest.osm.pbf --drop-author --drop-version --out-osm -o=switzerland.osm
rm switzerland.osm.pbf

wget -c https://download.geofabrik.de/europe/turkey-latest.osm.pbf
osmconvert turkey-latest.osm.pbf --drop-author --drop-version --out-osm -o=turkey.osm
rm turkey.osm.pbf

wget -c https://download.geofabrik.de/europe/ukraine-latest.osm.pbf
osmconvert ukraine-latest.osm.pbf --drop-author --drop-version --out-osm -o=ukraine.osm
rm ukraine.osm.pbf

#North America


#Central America
wget -c http://download.geofabrik.de/central-america-latest.osm.pbf
osmconvert central-america-latest.osm.pbf --drop-author --drop-version --out-osm -o=c_america.osm
rm central-america-latest.osm.pbf

#South America


docker volume create openstreetmap-datapgr
docker run --name pgrouting -e AUTOVACUUM=off -e PGPASSWORD=pgr -p 5433:5432 -v /opt:/osm -v openstreetmap-datapgr:/var/lib/postgresql/13/main smartappli/openstreetmap-pgrouting-server import
#docker run --name pgrouting -e AUTOVACUUM=on -e PGPASSWORD=pgr -p 5433:5432 -v openstreetmap-datapgr:/var/lib/postgresql/13/main -d smartappli/openstreetmap-pgrouting-server run
