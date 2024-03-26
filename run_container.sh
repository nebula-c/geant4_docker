#!/bin/bash

#docker run -it --mount ./:/home --mount /tmp/.X11-unix:/tmp.X11-unix geant4_suchoi \
docker run -it  \
    -v /tmp/.X11-unix:/tmp.X11-unix:ro \
    -v ./:/home \
    --hostname guest \
    -e DISPLAY=$(ifconfig en0 | grep inet | grep -v inet6 | awk '{print $2}'):0 \
    geant4_suchoi /bin/bash 
