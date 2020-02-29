#!/bin/sh

###
# Docker build script for Spring Petclinic image.
# Copyright(C) 2020 Objectway Spa - DevOps Team -
# Maintainer: Renato Perini
# This script is provided only for convenience. 
# Build the image using the main docker-compose file instead of this!
###

# We're building on plain native Linux
if [ "$OSTYPE" == "linux-gnu" ]; then
	DOCKER_BUILDKIT=1 docker-compose build --no-cache --force-rm --parallel
# No, we're building on Windows, native CMD or Powershell terminal
elif [ "$OSTYPE" == "win32" ]; then
        docker-compose build --no-cache --force-rm --parallel
# Wait, we're on Windows but we're building using msys termina (eg. git bash)
elif [ "$OSTYPE" == "msys" ]; then 
	winpty docker-compose build --no-cache --force-rm --parallel
else
# Cannot build: we don't know where we are.
	echo "Cannot determine operating system. OSTYPE var is set to ${OSTYPE}. Exiting..."
fi

