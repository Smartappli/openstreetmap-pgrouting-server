FROM postgis/postgis:13-3.1

# Set up environment
ENV TZ=UTC
ENV PGROUTING_VERSION 3.2.0
ENV PGROUTING_SHA256 5cf4d2147cf0897b5e2de9f1b526339abf293226c411882dba4901ba049092ab

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN set -ex \
 && apt update \
 && apt -y dist-upgrade
 && apt install -y \
        libboost-atomic1.74.0 \
        libboost-chrono1.74.0 \
        libboost-graph1.74.0 \
        libboost-date-time1.74.0 \
        libboost-program-options1.74.0 \
        libboost-system1.74.0 \
        libboost-thread1.74.0 \
        libcgal13 \
 && apt install -y \
        build-essential \
        cmake \
        wget \
        libboost-graph1.74-dev \
        libcgal-dev \
        libpq-dev \
        postgresql-server-dev-13 \
 && wget -O pgrouting.tar.gz "https://github.com/pgRouting/pgrouting/archive/v${PGROUTING_VERSION}.tar.gz" \
 && echo "$PGROUTING_SHA256 *pgrouting.tar.gz" | sha256sum -c - \
 && mkdir -p /usr/src/pgrouting \
 && tar \
        --extract \
        --file pgrouting.tar.gz \
        --directory /usr/src/pgrouting \
        --strip-components 1 \
 && rm pgrouting.tar.gz \
 && cd /usr/src/pgrouting \
 && mkdir build \
 && cd build \
 && cmake .. \
 && make \
 && make install \
 && cd / \
 && rm -rf /usr/src/pgrouting \
 && apt-mark manual postgresql-13 \
 && apt purge -y --autoremove \
        build-essential \
        cmake \
        wget \
        libcgal-dev \
        libpq-dev \
        libboost-graph1.74-dev \
        postgresql-server-dev-13 \
 && rm -rf /var/lib/apt/lists/*
RUN rm /docker-entrypoint-initdb.d/10_postgis.sh

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
COPY run.sh /
ENTRYPOINT ["/run.sh"]
CMD []

EXPOSE 5432
