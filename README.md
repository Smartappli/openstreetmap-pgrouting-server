# Openstreetmap-pgrouting

This container is widely impired of works of https://github.com/Overv/openstreetmap-tile-server. It allows you to easily set up an OpenStreetMap PG Routing server given a `.osm.pbf` file. 

## Setting up the server

First create a Docker volume to hold the PostgreSQL database that will contain the OpenStreetMap data:

    docker volume create openstreetmap-data

Next, download an .osm.pbf extract from geofabrik.de for the region that you're interested in. You can then start importing it into PostgreSQL by running a container and mounting the file as `/data.osm.pbf`. For example:

```
docker run \
    -e AUTOVACUUM=off \
    -v /absolute/path/to/belgium.osm.pbf:/data.osm.pbf \
    -v openstreetmap-data:/var/lib/postgresql/13/main \
    smartappli/openstreetmap-pgrouting-server \
    import
```

If the container exits without errors, then your data has been successfully imported and you are now ready to run the pgrouting server.

## Upgrade from PostgreSQL 12 to PostgreSQL 13

chmod +x upgrade12-13.sh
sh upgrade12-13.sh

## Upgrade from PostgreSQL 13 to PostgreSQL 14

chmod +x upgrade13-14.sh
sh upgrade13-14.sh

## Running the server

Run the server like this:

```
docker run -e AUTOVACUUM=on -v openstreetmap-data:/var/lib/postgresql/13/main -d smartappli/openstreetmap-pgrouting-server run
```

## Running the server at same time of openstreetmap-tile-server

Run the server like this:

```
docker run \
    -p 5433:5432 \
    -e AUTOVACUUM=on \
    -v openstreetmap-data:/var/lib/postgresql/13/main \
    -d smartappli/openstreetmap-pgrouting-server \
    run
```

## Complement

openstreetmap-tile-server is available at https://github.com/smartappli/openstreetmap-tile-server

## License

```
Copyright 2021 Olivier Debauche

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
