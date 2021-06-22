FROM ubuntu:20.04

ENV OSM2PGROUTING_VERSION 2.3.8

# Set up environment
ENV TZ=UTC
ENV AUTOVACUUM=off
ENV UPDATES=disabled
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install dependencies
RUN apt-get update \
  && apt-get -y dist-upgrade \
  && apt-get install -y wget gnupg2 lsb-core apt-transport-https ca-certificates curl \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo "deb [ trusted=yes ] https://apt.postgresql.org/pub/repos/apt/ `lsb_release -cs`-pgdg main" | tee /etc/apt/sources.list.d/pgdg.list \
  && apt-get update 
  
RUN apt-get install -y --no-install-recommends \
  autoconf \
  build-essential \
  bzip2 \
  cmake \
  cron \
  g++ \
  gcc \
  gdal-bin \
  git-core \
  libagg-dev \
  libboost-dev \
  libboost-filesystem-dev \
  libboost-system-dev \
  libbrotli-dev \
  libbz2-dev \
  libcairo2-dev \
  libcairomm-1.0-dev \
  libcurl4-gnutls-dev \
  libexpat1-dev \
  libfreetype6-dev \
  libgdal-dev \
  libgeos++-dev \
  libgeos-dev \
  libicu-dev \
  libiniparser-dev \
  libpq-dev \
  libproj-dev \
  libprotobuf-c-dev \
  libtiff5-dev \
  libtool \
  libxml2-dev \
  make \
  osmium-tool \
  osmosis \
  pandoc \
  postgis \
  postgresql-13 \
  postgresql-contrib-13 \
  postgresql-server-dev-13 \
  protobuf-c-compiler \
  python3-mapnik \
  python3-lxml \
  python3-psycopg2 \
  python3-shapely \
  python3-pip \
  sudo \
  tar \
  ttf-unifont \
  unzip \
  wget \
  zlib1g-dev \
&& apt-get clean autoclean \
&& apt-get autoremove --yes \
&& rm -rf /var/lib/{apt,dpkg,cache,log}/

# Install python libraries
RUN pip3 install requests \ 
 && pip3 install pyyaml

# Set up PostGIS
RUN wget https://download.osgeo.org/postgis/source/postgis-3.1.2.tar.gz -O postgis.tar.gz \
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
COPY postgresql.custom.conf.tmpl /etc/postgresql/13/main/
RUN chown -R postgres:postgres /var/lib/postgresql \
 && chown postgres:postgres /etc/postgresql/13/main/postgresql.custom.conf.tmpl \
 && echo "host all all 0.0.0.0/0 md5" >> /etc/postgresql/13/main/pg_hba.conf \
 && echo "host all all ::/0 md5" >> /etc/postgresql/13/main/pg_hba.conf

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
        zlib1g-dev 
        
RUN cd /usr/local/src \
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
