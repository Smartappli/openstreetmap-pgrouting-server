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
    #osmconvert /data.osm.pbf --drop-author --drop-version --drop-timestamp --out-osm -o=output_data_reduc.osm
    osm2pgrouting --f africa.osm.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --clean
    osm2pgrouting --f antarctica.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f asia.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f oceania.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f europe.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index  
    osm2pgrouting --f n_america.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f c_america.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    osm2pgrouting --f s_america.osm --conf mapconfig.xml -U pgr -W ${PGPASSWORD:-pgr} --dbname routing --no-index
    
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
