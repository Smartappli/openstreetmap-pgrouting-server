FROM ubuntu:20.04

# Set up environment
ENV TZ=UTC
ENV AUTOVACUUM=off
ENV OSM2PGROUTING_VERSION 2.3.8
ENV POSTGIS_VERSION 3.1.2
ENV POSTGRESQL_VERSION 13
ENV PGROUTING_VERSION 3.1.3
ENV PGROUTING_SHA256 54b58e8c4ac997d130e894f6311a28238258b224bb824b83f5bfa0fb4ee79c60
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt-get update \
  && apt-get -y dist-upgrade \
  && apt-get install -y wget gnupg2 lsb-core apt-transport-https ca-certificates curl \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo "deb [ trusted=yes ] https://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \  && apt-get update 
  
RUN apt-get install -y --no-install-recommends \
  autoconf \
  build-essential \
  bzip2 \
  cmake \
  expat \
  g++ \
  gcc \
  gdal-bin \
  git-core \
  libagg-dev \
  libboost-atomic-dev \
  libboost-chrono-dev \
  libboost-date-time-dev \
  libboost-dev \
  libboost-filesystem-dev \
  libboost-graph-dev \
  libboost-program-options-dev \
  libboost-system-dev \
  libboost-thread-dev \
  libbz2-dev \
  libcgal-dev \
  libcurl4-gnutls-dev \
  libexpat-dev \
  libexpat1-dev \
  libfreetype6-dev \
  libgdal-dev \
  libgeos++-dev \
  libgeos-dev \
  libicu-dev \
  libiniparser-dev \
  libosmium2-dev \
  libpq-dev \
  libpqxx-dev \
  libpqxx-6.4 \
  libproj-dev \
  libprotobuf-c-dev \
  libtiff5-dev \
  libtool \
  libxml2-dev \
  make \
  osmctools \
  postgresql-${POSTGRESQL_VERSION} \
  postgresql-contrib-${POSTGRESQL_VERSION} \
  postgresql-server-dev-${POSTGRESQL_VERSION} \
  protobuf-c-compiler \
  python-is-python3 \
  python3-lxml \
  python3-psycopg2 \
  python3-shapely \
  python3-pip \
  sudo \
  tar \
  ttf-unifont \
  unzip \
  zlib1g-dev \
&& apt-get clean autoclean \
&& apt-get autoremove --yes \
&& rm -rf /var/lib/{apt,dpkg,cache,log}/

# Set up PostGIS
RUN wget https://download.osgeo.org/postgis/source/postgis-${POSTGIS_VERSION}.tar.gz -O postgis.tar.gz \
 && mkdir -p postgis_src \
 && tar -xvzf postgis.tar.gz --strip 1 -C postgis_src \
 && rm postgis.tar.gz \
 && cd postgis_src \
 && ./configure \
 && make -j $(nproc) \
 && make -j $(nproc) install \
 && cd .. && rm -rf postgis_src

# Set up routing user
RUN adduser --disabled-password --gecos "" routing

# Configure PosgtreSQL
COPY postgresql.custom.conf.tmpl /etc/postgresql/${POSTGRESQL_VERSION}/main/
RUN chown -R postgres:postgres /var/lib/postgresql \
 && chown postgres:postgres /etc/postgresql/${POSTGRESQL_VERSION}/main/postgresql.custom.conf.tmpl \
 && echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/${POSTGRESQL_VERSION}/main/pg_hba.conf \
 && echo "host all all ::/0 md5" >> /etc/postgresql/${POSTGRESQL_VERSION}/main/pg_hba.conf

#pgrouting     
 RUN wget -O pgrouting.tar.gz "https://github.com/pgRouting/pgrouting/archive/v${PGROUTING_VERSION}.tar.gz" \
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
        libboost-graph-dev \
        postgresql-server-dev-${POSTGRESQL_VERSION} \
 && rm -rf /var/lib/apt/lists/*

#osm2pgrouting
RUN apt update \
 && apt install -y \
        libpqxx-6.4 \
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
 
#RUN git clone https://github.com/ramunasd/osmctools.git \
# && cd osmctools \
# && autoreconf --install \
# && ./configure \
# && make install 
 
# Start running
COPY run.sh /
RUN chmod +x /run.sh
COPY mapconfig.xml /
COPY mapconfig_for_bicycles.xml /
COPY mapconfig_for_cars.xml /
COPY mapconfig_for_pedestrian.xml /
COPY indexes.sql /
ENTRYPOINT ["/run.sh"]
CMD []

EXPOSE 5432
