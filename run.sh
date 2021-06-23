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
    sudo -u postgres psql -d routing -c "CREATE EXTENSION pgrouting CASCADE;"
    sudo -u postgres createdb -E UTF8 -O pgr cars_routing
    sudo -u postgres psql -d cars_routing -c "CREATE EXTENSION postgis;"
    sudo -u postgres psql -d cars_routing -c "CREATE EXTENSION pgrouting CASCADE;"
    sudo -u postgres createdb -E UTF8 -O pgr bicycles_routing
    sudo -u postgres psql -d bicycles_routing -c "CREATE EXTENSION postgis;"
    sudo -u postgres psql -d bicycles_routing -c "CREATE EXTENSION pgrouting CASCADE;"
    sudo -u postgres createdb -E UTF8 -O pgr pedestrian_routing
    sudo -u postgres psql -d pedestrian_routing -c "CREATE EXTENSION postgis;"
    sudo -u postgres psql -d pedestrian_routing -c "CREATE EXTENSION pgrouting CASCADE;" 
    setPostgresPassword
    
    # Download Luxembourg as sample if no data is provided
    if [ ! -f /data.osm.pbf ] && [ -z "$DOWNLOAD_PBF" ]; then
        echo "WARNING: No import file at /data.osm.pbf, so importing Luxembourg as example..."
        DOWNLOAD_PBF="https://download.geofabrik.de/europe/luxembourg-latest.osm.pbf"
    fi

    if [ -n "$DOWNLOAD_PBF" ]; then
        echo "INFO: Download PBF file: $DOWNLOAD_PBF"
        wget "$WGET_ARGS" "$DOWNLOAD_PBF" -O /data.osm.pbf
    fi
    
    # Import data
    sudo -u pgr osmconvert data.osm.pbf --drop-author --drop-version --out-pbf -o=output_data_reduc.osm.pbf
    rm data.osm.pbf
    sudo -u pgr osm2pgrouting --f output_data_reduc.osm.pbf --conf mapconfig.xml  --dbname routing --clean    
    sudo -u pgr osm2pgrouting --f output_data_reduc.osm.pbf --conf mapconfig_for_bicycles.xml  --dbname bicycles_routing --clean
    sudo -u pgr osm2pgrouting --f output_data_reduc.osm.pbf --conf mapconfig_for_cars.xml --dbname cars_routing --clean
    sudo -u pgr osm2pgrouting --f output_data_reduc.osm.pbf --conf mapconfig_for_pedestrian.xml  --dbname pedestrian_routing --clean
    
    # Create indexes
    #sudo -u postgres psql -d routing -f indexes.sql
    #sudo -u postgres psql -d bicycles_routing -f indexes.sql
    #sudo -u postgres psql -d cars_routing -f indexes.sql
    #sudo -u postgres psql -d pedestrian_routing -f indexes.sql
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
