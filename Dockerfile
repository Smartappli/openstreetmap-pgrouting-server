FROM pgrouting/pgrouting:13-3.1-3.2.0

ENV OSM2PGROUTING_VERSION 2.3.8

RUN apt update \
 && apt install -y \
        libpqxx-6.2 \
 && apt install -y \
        build-essential \
        cmake \
        wget \
        libboost-program-options-dev \
        libexpat1 \
        libexpat-dev \
        libosmium2-dev \
        libpqxx-dev \
        zlib1g-dev \
 && cd /usr/local/src \
 && wget https://github.com/pgRouting/osm2pgrouting/archive/v${OSM2PGROUTING_VERSION}.tar.gz \
 && tar xvf v${OSM2PGROUTING_VERSION}.tar.gz \
 && cd osm2pgrouting-${OSM2PGROUTING_VERSION} \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make \
 && make install \
 && cd ../tools/osmium/ \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make \
 && make install \
 && cd /usr/local/src \
 && rm -rf ./* \
 && apt purge -y --autoremove \
        build-essential \
        cmake \
        wget \
        libexpat-dev \
        libosmium2-dev \
        libpqxx-dev \
        zlib1g-dev \
 && apt autoremove -y \
 && rm -rf /var/lib/apt/lists/*
 
 # Start running
COPY indexes.sql /
COPY run.sh /
ENTRYPOINT ["/run.sh"]
CMD []

EXPOSE 5432
