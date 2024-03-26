FROM ubuntu:22.04

#ARG WORK_DIR
#ARG INSTALL_DIR
#ARG GEANT4_VERSION

RUN apt-get update -qq && \
    apt-get install -y -qq \
    apt-utils \ 
    git \
    wget \
    unzip \
    build-essential \
    freeglut3-dev \
    libboost-all-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    mercurial \
    libeigen3-dev \
    libsqlite3-dev \
    nlohmann-json3-dev \
    libexpat1-dev \
    libxerces-c-dev \
    libhdf5-dev \
    libhepmc3-dev \
    cmake \
    vim \
    x11-apps \
    libssl-dev && \
    apt-get clean all

WORKDIR /home

Run pwd && \
    ls && \
    cd /opt && \
    wget https://root.cern/download/root_v6.30.04.Linux-ubuntu22.04-x86_64-gcc11.4.tar.gz && \
    tar -xzvf root_v6.30.04.Linux-ubuntu22.04-x86_64-gcc11.4.tar.gz
#    source /opt/root/bin/thisroot.sh

RUN pwd && \
    ls && \
    cd /opt && \
    wget https://gitlab.cern.ch/geant4/geant4/-/archive/v11.2.1/geant4-v11.2.1.tar.gz && \
    tar -zxvf geant4-v11.2.1.tar.gz && \
    mkdir geant4-v11.2.1-build && \
    cd geant4-v11.2.1-build && \
    cmake -DGEANT4_INSTALL_DATA=ON -DCMAKE_INSTALL_PREFIX=/opt/geant4-v11.2.1-install /opt/geant4-v11.2.1 && \
    make -j4 && \
    make install

