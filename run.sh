#!/bin/bash

set -x

function createPostgresConfig() {
  cp /etc/postgresql/13/main/postgresql.custom.conf.tmpl /etc/postgresql/13/main/conf.d/postgresql.custom.conf
  sudo -u postgres echo "autovacuum = $AUTOVACUUM" >> /etc/postgresql/13/main/conf.d/postgresql.custom.conf
  cat /etc/postgresql/13/main/conf.d/postgresql.custom.conf
}

function setPostgresPassword() {
    sudo -u postgres psql -c "ALTER USER pgr PASSWORD '${PGPASSWORD:-pgr}'"
}

if [ "$#" -ne 1 ]; then
    echo "usage: <import|run>"
    echo "commands:"
    echo "    import: Set up the database and import /data.osm.pbf"
    echo "    run: Runs PG Routing service"
    exit 1
fi

if [ "$1" = "import" ]; then
    # Ensure that database directory is in right state
    chown postgres:postgres -R /var/lib/postgresql
    if [ ! -f /var/lib/postgresql/13/main/PG_VERSION ]; then
        sudo -u postgres /usr/lib/postgresql/13/bin/pg_ctl -D /var/lib/postgresql/13/main/ initdb -o "--locale C.UTF-8"
    fi

    # Initialize PostgreSQL
    createPostgresConfig
    service postgresql start
    sudo -u postgres createuser pgr
    sudo -u postgres createdb -E UTF8 -O pgr routing
    sudo -u postgres psql -d routing -c "CREATE EXTENSION postgis;"
    sudo -u postgres psql -d routing -c "CREATE EXTENSION pgrouting;"
    #sudo -u postgres createdb -E UTF8 -O pgr cars_routing
    #sudo -u postgres psql -d cars_routing -c "CREATE EXTENSION postgis;"
    #sudo -u postgres psql -d cars_routing -c "CREATE EXTENSION pgrouting;"
    #sudo -u postgres createdb -E UTF8 -O pgr bicycles_routing
    #sudo -u postgres psql -d bicycles_routing -c "CREATE EXTENSION postgis;"
    #sudo -u postgres psql -d bicycles_routing -c "CREATE EXTENSION pgrouting;"
    #sudo -u postgres createdb -E UTF8 -O pgr pedestrian_routing
    #sudo -u postgres psql -d pedestrian_routing -c "CREATE EXTENSION postgis;"
    #sudo -u postgres psql -d pedestrian_routing -c "CREATE EXTENSION pgrouting;" 
    setPostgresPassword
      
    # Import data
    osm2pgrouting --f /osm/algeria.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --clean
    osm2pgrouting --f /osm/angola.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/benin.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/botswana.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/burkina-faso.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index 
    osm2pgrouting --f /osm/burundi.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index    
    osm2pgrouting --f /osm/cameroon.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/canary-islands.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index   
    osm2pgrouting --f /osm/cape-verde.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/central-african-republic.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/chad.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/comores.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/congo-brazzaville.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/congo-democratic-republic.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/djibouti.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/egypt.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/equatorial-guinea.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/eritrea.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/ethiopia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/gabon.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/ghana.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/guinea.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/guinea-bissau.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/ivory-coast.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/kenya.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/lesotho.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/liberia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index 
    osm2pgrouting --f /osm/libya.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index  
    osm2pgrouting --f /osm/madagascar.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index  
    osm2pgrouting --f /osm/malawi.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/mali.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index    
    osm2pgrouting --f /osm/mauritania.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index    
    osm2pgrouting --f /osm/mauritius.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index    
    osm2pgrouting --f /osm/morocco.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/mozambique.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/namibia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/niger.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/nigeria.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/saint-helena-ascension-and-tristan-da-cunha.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/sao-tome-and-principe.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/senegal-and-gambia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/seychelles.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/sierra-leone.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/somalia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/south-africa.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/south-sudan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/sudan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/swaziland.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/tanzania.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/togo.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/tunisia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/uganda.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index    
    osm2pgrouting --f /osm/zambia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index    
    osm2pgrouting --f /osm/zimbabwe.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index 
    
    osm2pgrouting --f /osm/antarctica.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    
    osm2pgrouting --f /osm/afghanistan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/armenia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/azerbaijan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/bangladesh.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/bhutan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/cambodia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/china.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/gcc-states.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/india.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/indonesia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/iran.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/iraq.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/israel-and-palestine.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/japan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/jordan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/kazakhstan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/kyrgyzstan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/laos.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/lebanon.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/malaysia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/maldives.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/mongolia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/myanmar.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/nepal.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/north-korea.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/pakistan.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/philippines.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/russia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/south-korea.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/sri-lanka.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/syria-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/taiwan-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/tajikistan-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/thailand-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/turkmenistan-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/uzbekistan-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/vietnam-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/yemen-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    
    osm2pgrouting --f /osm/oceania.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    
    osm2pgrouting --f /osm/albania.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/andorra.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/austria.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/azores.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/belarus.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/belgium.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/bosnia-herzegovina.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/bulgaria.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/croatia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/cyprus.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/czech.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/denmark.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/estonia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/faroe-islands.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/finland.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/france.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/georgia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/germany.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/great-britain.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/greece.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/guernsey-jersey.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/hungary.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/iceland.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/ireland-and-northern-ireland.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/isle-of-man-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/italy.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/kosovo.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/latvia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/liechtenstein.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/lithuania.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/luxembourg.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/macedonia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/malta.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/moldova.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/monaco.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/montenegro.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/netherlands.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/norway.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/poland.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/portugal.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/romania.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/russia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/serbia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/slovakia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/spain.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/sweden.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/switzerland.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/turkey.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/ukraine.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/canada.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/greenland.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/mexico.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/us-midwest-latest.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/us-northeast.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/us-pacific.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/us-south.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/us-west.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index

    osm2pgrouting --f /osm/c_america.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    
    osm2pgrouting --f /osm/argentina.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/bolivia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/brazil.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/chile.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/colombia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/ecuador.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/paraguay.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/peru.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/suriname.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/uruguay.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f /osm/venezuela.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
        
    #osm2pgrouting --f output_data_reduc.osm --conf mapconfig_for_bicycles.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname bicycles_routing --clean
    #osm2pgrouting --f output_data_reduc.osm --conf mapconfig_for_cars.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname cars_routing --clean
    #osm2pgrouting --f output_data_reduc.osm --conf mapconfig_for_pedestrian.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname pedestrian_routing --clean
    
    # Create indexes
    #sudo -u postgres psql -d routing -f indexes.sql
    #sudo -u postgres psql -d bicycles_routing -f indexes.sql
    #sudo -u postgres psql -d cars_routing -f indexes.sql
    #sudo -u postgres psql -d pedestrian_routing -f indexes.sql
    
    exit 0
fi

if [ "$1" = "run" ]; then
    # Clean /tmp
    rm -rf /tmp/*

    # Fix postgres data privileges
    chown postgres:postgres /var/lib/postgresql -R

    # Initialize PostgreSQL
    createPostgresConfig
    service postgresql start
    setPostgresPassword
    
    # Run while handling docker stop's SIGTERM
    stop_handler() {
        kill -TERM "$child"
    }
    trap stop_handler SIGTERM

    service postgresql stop

    exit 0
fi

echo "invalid command"
exit 1
