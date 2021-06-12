#!/bin/bash

set -x

function createPostgresConfig() {
  cp /etc/postgresql/12/main/postgresql.custom.conf.tmpl /etc/postgresql/12/main/conf.d/postgresql.custom.conf
  sudo -u postgres echo "autovacuum = $AUTOVACUUM" >> /etc/postgresql/12/main/conf.d/postgresql.custom.conf
  cat /etc/postgresql/12/main/conf.d/postgresql.custom.conf
}

function setPostgresPassword() {
    sudo -u postgres psql -c "ALTER USER renderer PASSWORD '${PGPASSWORD:-renderer}'"
}

if [ "$#" -ne 1 ]; then
    echo "usage: <import|run>"
    echo "commands:"
    echo "    import: Set up the database and import /data.osm.pbf"
    echo "    run: Runs Apache and renderd to serve tiles at /tile/{z}/{x}/{y}.png"
    echo "environment variables:"
    echo "    THREADS: defines number of threads used for importing / tile rendering"
    echo "    UPDATES: consecutive updates (enabled/disabled)"
    exit 1
fi

if [ "$1" = "import" ]; then
    # Ensure that database directory is in right state
    chown postgres:postgres -R /var/lib/postgresql
    if [ ! -f /var/lib/postgresql/12/main/PG_VERSION ]; then
        sudo -u postgres /usr/lib/postgresql/12/bin/pg_ctl -D /var/lib/postgresql/12/main/ initdb -o "--locale C.UTF-8"
    fi

    # Initialize PostgreSQL
    createPostgresConfig
    service postgresql start
    sudo -u postgres createuser rounting
    sudo -u postgres createdb -E UTF8 -O routing cars_routing
    sudo -u postgres psql -d cars_routing -c "CREATE EXTENSION postgis;"
    sudo -u postgres psql -d cars_routing -c "CREATE EXTENSION pgrouting;"
    sudo -u postgres createdb -E UTF8 -O routing bicycles_routing
    sudo -u postgres psql -d bicycles_routing -c "CREATE EXTENSION postgis;"
    sudo -u postgres psql -d bicycles_routing -c "CREATE EXTENSION pgrouting;"
    sudo -u postgres createdb -E UTF8 -O routing pedestrian_routing
    sudo -u postgres psql -d pedestrian_routing -c "CREATE EXTENSION postgis;"
    sudo -u postgres psql -d pedestrian_routing -c "CREATE EXTENSION pgrouting;" 
    setPostgresPassword
    
    # Download Luxembourg as sample if no data is provided
    if [ ! -f /data.osm.pbf ] && [ -z "$DOWNLOAD_PBF" ]; then
        echo "WARNING: No import file at /data.osm.pbf, so importing Luxembourg as example..."
        DOWNLOAD_PBF="https://download.geofabrik.de/europe/luxembourg-latest.osm.pbf"
        DOWNLOAD_POLY="https://download.geofabrik.de/europe/luxembourg.poly"
    fi

    if [ -n "$DOWNLOAD_PBF" ]; then
        echo "INFO: Download PBF file: $DOWNLOAD_PBF"
        wget "$WGET_ARGS" "$DOWNLOAD_PBF" -O /data.osm.pbf
        if [ -n "$DOWNLOAD_POLY" ]; then
            echo "INFO: Download PBF-POLY file: $DOWNLOAD_POLY"
            wget "$WGET_ARGS" "$DOWNLOAD_POLY" -O /data.poly
        fi
    fi
    
    # Import data
    sudo -u routing osm2pgrouting --f data.osm.pbf --conf mapconfig_for_bicycles.xml  --dbname bicycles_routing --clean
    sudo -u routing osm2pgrouting --f data.osm.pbf --conf mapconfig_for_cars.xml --dbname cars_routing --clean
    sudo -u routing osm2pgrouting --f data.osm.pbf --conf mapconfig_for_pedestrian.xml  --dbname pedestrian_routing --clean
fi
